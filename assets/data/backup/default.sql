SET sql_mode = '';
--
-- Table structure for table `acc_coa`
--

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
  `isCashNature` int(11) NOT NULL DEFAULT 0,
  `isBankNature` int(11) NOT NULL DEFAULT 0,
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
  `isSubType` int(11) NOT NULL DEFAULT 0,
  `subType` int(11) NOT NULL DEFAULT 1,
  `isStock` int(11) NOT NULL DEFAULT 0,
  `isFixedAssetSch` int(11) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_coa`
--

INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(8, 50202, 'Accounts Payable', 'Current Liabilities', '502', 3, 1, 0, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:52:17', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(10, 1, 'Assets', 'COA', '0', 1, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(13, 10201, 'Cash', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 12:07:11', '0', '2015-10-15 15:57:55', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(15, 1020101, 'Cash In Hand', 'Cash', '10201', 4, 1, 1, 1, 1, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-12 08:16:03', '0', '2016-05-23 12:05:43', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(16, 102, 'Current Asset', 'Assets', '1', 2, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '2018-07-07 11:23:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(17, 502, 'Current Liabilities', 'Liabilities', '5', 2, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2014-08-30 13:18:20', '0', '2015-10-15 19:49:21', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(23, 401, 'Cost of Goods Solds', 'Expenses', '4', 2, 1, 1, 1, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-02 10:28:34', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(24, 2, 'Shareholder\'s Equity', 'COA', '0', 1, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(25, 4, 'Expenses', 'COA', '0', 1, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '2', '2019-11-24 05:45:24', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(26, 101, 'Fixed Assets', 'Assets', '1', 2, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '2015-10-15 15:29:11', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(27, 402, 'Over Head Cost', 'Expenses', '4', 2, 1, 1, 1, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-04 10:01:58', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(29, 3, 'Income', 'COA', '0', 1, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(30, 5, 'Liabilities', 'COA', '0', 1, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2013-07-04 12:32:07', '0', '2015-10-15 19:46:54', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(31, 501, 'Long Term Liabilities', 'Liabilities', '5', 2, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2014-08-30 13:18:20', '0', '2015-10-15 19:49:21', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(33, 301, 'Direct Income', 'Income', '3', 2, 1, 1, 1, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-02 10:31:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(35, 302, 'Indirect Income', 'Income', '3', 2, 1, 1, 1, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-02 10:55:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', '');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(36, 5020201, 'Supplier Payable', 'Accounts Payable', '50202', 4, 1, 0, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:52:44', '0', '0000-00-00 00:00:00', 1, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(41, 10203, 'Prepaid Expenses', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:45:19', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(43, 10204, 'Inventory', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:48:32', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(44, 50203, 'Accrued Expenses', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:50:20', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(46, 50101, 'Long-Term Debt', 'Long Term Liabilities', '501', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:51:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(47, 50102, 'Other Long-Term  Liabilities', 'Long Term Liabilities', '501', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:53:04', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(48, 201, 'Equity', 'Shareholder\'s Equity', '2', 2, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2022-04-10 06:56:38', '0', '2022-04-10 06:56:38', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(49, 20101, 'Equity Capital', 'Equity', '201', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:31:33', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(50, 20102, 'Retained Earnings', 'Equity', '201', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 07:01:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(51, 10101, 'Property & Equipment', 'Fixed Assets', '101', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:35:53', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(52, 10102, 'Goodwills', 'Fixed Assets', '101', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-23 06:47:21', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(53, 30101, 'Construction Income', 'Direct Income', '301', 3, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:08:04', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(54, 30102, 'Reimbursement Income', 'Direct Income', '301', 3, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:09:02', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(55, 40101, 'Cost of Goods Sold', 'Cost of Goods Solds', '401', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:13:52', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(56, 40102, 'Job Expenses', 'Cost of Goods Solds', '401', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:14:18', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(57, 40201, 'Automobile', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:14:37', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(58, 40202, 'Bank Service Charges', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:15:32', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(59, 40203, 'Insurance', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:15:58', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(60, 40204, 'Interest Expenses', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:16:36', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(61, 40205, 'Payroll Expenses', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:17:08', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(62, 40206, 'Postage', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:17:26', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(63, 40207, 'Professional Fees', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:17:55', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(64, 40208, 'Repairs', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:18:38', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(65, 40209, 'Tools and Macchnery', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:28:02', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(66, 40210, 'Utilities', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:28:42', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(67, 4021001, 'Electic Bill', 'Utilities', '40210', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 09:05:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(68, 4021002, 'House Rent', 'Utilities', '40210', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 09:06:05', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(69, 10205, 'Cash at Bank', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:44:19', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(75, 1010201, 'Goodwill', 'Goodwills', '10102', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '15.00', '1', '2022-04-23 06:45:48', '0', '0000-00-00 00:00:00', 0, 1, 0, 1, NULL, 'GD001', NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(77, 5020401, 'property sales', 'Unearned Revenue', '50204', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:40:48', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(78, 5010101, 'Debts', 'Long-Term Debt', '50101', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:41:49', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(79, 5010201, 'Other Long-Term  Liabilities', 'Other Long-Term  Liabilities', '50102', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:42:03', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(80, 2010101, 'Capital Fund', 'Equity Capital', '20101', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:42:36', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(81, 2010201, 'Current year Profit & Loss', 'Retained Earnings', '20102', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:42:53', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(82, 2010202, 'Last year Profit & Loss', 'Retained Earnings', '20102', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:43:03', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(84, 50201, 'Provisions', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:46:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(85, 5020104, 'Depreciation of Goodwill', 'Depreciations', '50205', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-23 06:47:07', '0', '0000-00-00 00:00:00', 0, 1, 0, 1, NULL, NULL, 'GD001');
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(86, 50204, 'Unearned Revenue', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:53:09', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(88, 10206, 'Advance', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-11 11:56:56', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(89, 1020601, 'Advance against Employee', 'Advance', '10206', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-11 11:57:18', '0', '0000-00-00 00:00:00', 1, 2, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(90, 1020602, 'Advance Against Customer', 'Advance', '10206', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-11 11:57:35', '0', '0000-00-00 00:00:00', 1, 3, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(91, 1020102, 'Petty Cash', 'Cash', '10201', 4, 1, 0, 0, 1, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-12 08:16:19', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(94, 40301, 'Purchase Account', 'Purchase Accounts', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2022-04-16 10:31:43', '0', '2022-04-16 10:31:43', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(95, 4030102, 'Purchase', 'Purchase Account', '40201', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-16 10:33:59', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(96, 30103, 'Sales Accounts', 'Direct Income', '301', 3, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-16 10:34:37', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(97, 3010301, 'Sales Account', 'Sales Accounts', '30103', 4, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-16 10:34:57', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(99, 4020501, 'Salary Expense', 'Payroll Expenses', '40205', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-20 06:24:08', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(104, 5020102, 'Provision for npf contribution', 'Provisions', '50201', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-10 06:19:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(106, 5020101, 'Provision for State Income Tax', 'Provisions', '50201', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-26 06:44:29', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(107, 40211, 'State Income Tax', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-26 06:44:46', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(108, 4021101, 'State Income Tax', 'State Income Tax', '40211', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-26 06:45:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(110, 40212, 'Employeer ICF Expense', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-10 06:35:37', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(111, 4021201, 'Employeer 1% ICF Expense', 'Employeer ICF Expense', '40212', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 11:34:02', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(112, 50205, 'Depreciations', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2022-05-10 09:35:15', '0', '2022-05-10 09:35:15', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(191, 4020502, 'Employee 5 % NPF Expenses', 'Payroll Expenses', '40205', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 11:32:14', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(192, 4020503, 'Employee 10 % NPF Expenses', 'Payroll Expenses', '40205', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 11:32:36', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(221, 50206, 'Aoounts pay by name supplier', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-13 11:51:32', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(229, 10208, 'Accounts Receivable', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-16 07:05:42', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(230, 1020801, 'Customer Receivable', 'Accounts Receivable', '10208', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-16 07:07:17', '0', '0000-00-00 00:00:00', 1, 3, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(231, 1020802, 'Employee Receivable', 'Accounts Receivable', '10208', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-16 07:06:58', '0', '0000-00-00 00:00:00', 1, 2, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(232, 1020401, 'Inventory account', 'Inventory', '10204', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-15 07:53:16', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(233, 4010101, 'Cost of Goods Sold Account', 'Cost of Goods Sold', '40101', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-15 08:58:18', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(234, 30104, 'Service Accounts', 'Direct Income', '301', 3, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-15 16:23:37', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES(235, 3010401, 'Service Account', 'Service Accounts', '30104', 4, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-15 16:24:11', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `acc_monthly_balance`
--

CREATE TABLE IF NOT EXISTS `acc_monthly_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fyear` int(11) NOT NULL,
  `COAID` int(11) NOT NULL,
  `balance1` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance2` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance3` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance4` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance5` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance6` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance7` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance8` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance9` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance10` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance11` decimal(18,2) NOT NULL DEFAULT 0.00,
  `balance12` decimal(18,2) NOT NULL DEFAULT 0.00,
  `totalBalance` decimal(18,2) NOT NULL DEFAULT 0.00,
  `updatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `acc_opening_balance`
--

CREATE TABLE IF NOT EXISTS `acc_opening_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fyear` int(11) NOT NULL,
  `COAID` int(11) NOT NULL,
  `subType` int(11) NOT NULL DEFAULT 1,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_predefine_account`
--

INSERT INTO `acc_predefine_account` (`id`, `cashCode`, `bankCode`, `advance`, `fixedAsset`, `purchaseCode`, `salesCode`, `serviceCode`, `customerCode`, `supplierCode`, `costs_of_good_solds`, `vat`, `tax`, `inventoryCode`, `CPLCode`, `LPLCode`, `salary_code`, `emp_npf_contribution`, `empr_npf_contribution`, `emp_icf_contribution`, `empr_icf_contribution`, `prov_state_tax`, `state_tax`, `prov_npfcode`) VALUES(0, 10201, 10205, 10206, 101, 1020401, 3010301, 3010401, 1020801, 5020201, 4010101, 0, 4021101, 1020401, 2010201, 2010202, 4020501, 4020502, 4020503, 4021201, 0, 5020101, 4021101, 5020102);

-- --------------------------------------------------------

--
-- Table structure for table `acc_subcode`
--

CREATE TABLE IF NOT EXISTS `acc_subcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subTypeId` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `referenceNo` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `subTypeId` (`subTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `acc_subtype`
--

CREATE TABLE IF NOT EXISTS `acc_subtype` (
  `id` int(11) NOT NULL,
  `subtypeName` varchar(200) NOT NULL,
  `staus` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_subtype`
--

INSERT INTO `acc_subtype` (`id`, `subtypeName`, `staus`, `created_by`, `created_date`) VALUES(1, 'None', 1, 1, '2022-04-05 10:19:27');
INSERT INTO `acc_subtype` (`id`, `subtypeName`, `staus`, `created_by`, `created_date`) VALUES(2, 'Employee', 1, 1, '2022-04-06 08:14:48');
INSERT INTO `acc_subtype` (`id`, `subtypeName`, `staus`, `created_by`, `created_date`) VALUES(3, 'Customer', 1, 1, '2022-04-10 08:49:22');
INSERT INTO `acc_subtype` (`id`, `subtypeName`, `staus`, `created_by`, `created_date`) VALUES(4, 'Supplier', 1, 1, '2022-04-10 08:49:22');
INSERT INTO `acc_subtype` (`id`, `subtypeName`, `staus`, `created_by`, `created_date`) VALUES(6, 'Agent', 1, 1, '2022-04-10 08:50:12');

-- --------------------------------------------------------

--
-- Table structure for table `acc_transaction`
--

CREATE TABLE IF NOT EXISTS `acc_transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `fyear` int(11) NOT NULL,
  `VNo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Vtype` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `referenceNo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VDate` date DEFAULT NULL,
  `COAID` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Narration` text CHARACTER SET utf8 DEFAULT NULL,
  `chequeNo` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chequeDate` date DEFAULT NULL,
  `isHonour` int(11) DEFAULT NULL,
  `ledgerComment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Debit` decimal(18,2) DEFAULT NULL,
  `Credit` decimal(18,2) DEFAULT NULL,
  `StoreID` int(11) NOT NULL DEFAULT 0,
  `IsPosted` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `is_opening` int(11) NOT NULL DEFAULT 0,
  `CreateBy` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `IsAppove` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `RevCodde` bigint(20) NOT NULL,
  `subType` int(11) NOT NULL DEFAULT 1,
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
  `isHonour` int(11) NOT NULL DEFAULT 0,
  `ledgerComment` varchar(255) DEFAULT NULL,
  `Debit` decimal(18,2) NOT NULL DEFAULT 0.00,
  `Credit` decimal(18,2) NOT NULL DEFAULT 0.00,
  `RevCodde` int(11) NOT NULL,
  `subType` int(11) NOT NULL DEFAULT 1,
  `subCode` int(11) DEFAULT NULL,
  `isApproved` int(11) NOT NULL DEFAULT 0,
  `CreateBy` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `UpdateBy` int(11) DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `isyearClosed` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = non yet transfer to transation,  1 = Tranfer to transition',
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

CREATE TABLE IF NOT EXISTS `activity_logs` (
  `activity_id` int(11) NOT NULL,
  `user_id` varchar(11) NOT NULL COMMENT 'for employee , it will save employee_id',
  `type` varchar(30) NOT NULL COMMENT 'ticket, employee, attendnace etc.',
  `action` varchar(15) NOT NULL COMMENT 'create, update, delete',
  `action_id` varchar(15) NOT NULL,
  `table_name` varchar(30) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `form_data` text DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=created, 2=updated, 3=deleted	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

INSERT INTO `app_setting` (`id`, `localhserver`, `onlineserver`, `hotspot`) VALUES(1, 'https://demo.bdtask.com', 'https://demo.bdtask.com', 'https://demo.bdtask.com');

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

INSERT INTO `company_information` (`company_id`, `company_name`, `email`, `address`, `mobile`, `website`, `vat_no`, `cr_no`, `status`) VALUES('1', 'Demo Company', 'demo@mail.com', 'Company Demo Address', '123456', 'https://www.demo.com/', '', '', 1);

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

INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES(2, 'USD', '$');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `designation`, `details`) VALUES(1, 'sales man', '');

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

INSERT INTO `email_config` (`id`, `protocol`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `mailtype`, `isinvoice`, `isservice`, `isquotation`) VALUES(1, 'ssmtp', 'ssl://ssmtp.gmail.com', '25', 'info@eholol.com', 'demo123456', 'html', 0, 0, 0);

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

CREATE TABLE IF NOT EXISTS `employee_salary_setup` (
  `e_s_s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `sal_type` varchar(30) NOT NULL,
  `salary_type_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
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
-- Table structure for table `financial_year`
--

CREATE TABLE IF NOT EXISTS `financial_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yearName` varchar(30) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `isCloseReq` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=active, 0=closed, 2=pending',
  `created_by` int(6) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(6) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmb_salary_advance`
--

CREATE TABLE IF NOT EXISTS `gmb_salary_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(50) NOT NULL,
  `salary_month` varchar(50) NOT NULL COMMENT 'for the month advance will be deducted',
  `amount` decimal(11,0) NOT NULL,
  `release_amount` decimal(11,0) DEFAULT 0,
  `paid` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'paid_to_employee',
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

CREATE TABLE IF NOT EXISTS `gmb_salary_sheet_generate` (
  `ssg_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `gdate` varchar(30) DEFAULT NULL,
  `start_date` varchar(30) NOT NULL,
  `end_date` varchar(30) NOT NULL,
  `generate_by` varchar(30) NOT NULL COMMENT 'user_id',
  `approved` tinyint(1) DEFAULT 0 COMMENT '1 = approved, 0= not approved',
  `approved_by` varchar(20) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  PRIMARY KEY (`ssg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `ret_adjust_amnt` decimal(10,2) DEFAULT NULL,
  `returnable_amount` decimal(10,2) DEFAULT NULL,
  `sales_by` varchar(50) NOT NULL,
  `delivery_note` text DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1085 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1, 'user_profile', 'User Profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2, 'setting', 'Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(3, 'language', 'Language');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(4, 'manage_users', 'Manage Users');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(5, 'add_user', 'Add User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(6, 'manage_company', 'Manage Company');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(7, 'web_settings', 'Software Settings');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(8, 'manage_accounts', 'Manage Accounts');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(9, 'create_accounts', 'Create Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(10, 'manage_bank', 'Manage Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(11, 'add_new_bank', 'Add New Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(12, 'settings', 'Settings');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(13, 'closing_report', 'Closing Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(14, 'closing', 'Closing');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(15, 'cheque_manager', 'Cheque Manager');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(16, 'accounts_summary', 'Accounts Summary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(17, 'expense', 'Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(18, 'income', 'Income');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(19, 'accounts', 'Accounts');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(20, 'stock_report', 'Stock Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(21, 'stock', 'Stock');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(22, 'pos_invoice', 'POS Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(23, 'manage_invoice', 'Manage Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(24, 'new_invoice', 'New Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(25, 'invoice', 'Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(26, 'manage_purchase', 'Manage Purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(27, 'add_purchase', 'Add Purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(28, 'purchase', 'Purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(29, 'paid_customer', 'Paid Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(30, 'manage_customer', 'Manage Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(31, 'add_customer', 'Add Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(32, 'customer', 'Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(33, 'supplier_payment_actual', 'Supplier Payment Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(34, 'supplier_sales_summary', 'Supplier Sales Summary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(35, 'supplier_sales_details', 'Supplier Sales Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(36, 'supplier_ledger', 'Supplier Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(37, 'manage_supplier', 'Manage Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(38, 'add_supplier', 'Add Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(39, 'supplier', 'Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(40, 'product_statement', 'Product Statement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(41, 'manage_product', 'Manage Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(42, 'add_product', 'Add Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(43, 'product', 'Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(44, 'manage_category', 'Manage Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(45, 'add_category', 'Add Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(46, 'category', 'Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(47, 'sales_report_product_wise', 'Sales Report (Product Wise)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(48, 'purchase_report', 'Purchase Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(49, 'sales_report', 'Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(50, 'todays_report', 'Todays Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(51, 'report', 'Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(52, 'dashboard', 'Dashboard');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(53, 'online', 'Online');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(54, 'logout', 'Logout');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(55, 'change_password', 'Change Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(56, 'total_purchase', 'Total Purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(57, 'total_amount', 'Total Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(58, 'supplier_name', 'Supplier Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(59, 'invoice_no', 'Invoice No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(60, 'purchase_date', 'Purchase Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(61, 'todays_purchase_report', 'Todays Purchase Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(62, 'total_sales', 'Total Sales');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(63, 'customer_name', 'Customer Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(64, 'sales_date', 'Sales Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(65, 'todays_sales_report', 'Todays Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(66, 'home', 'Home');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(67, 'todays_sales_and_purchase_report', 'Todays sales and purchase report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(68, 'total_ammount', 'Total Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(69, 'rate', 'Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(70, 'product_model', 'Product Model');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(71, 'product_name', 'Product Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(72, 'search', 'Search');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(73, 'end_date', 'End Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(74, 'start_date', 'Start Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(75, 'total_purchase_report', 'Total Purchase Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(76, 'total_sales_report', 'Total Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(77, 'total_seles', 'Total Sales');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(78, 'all_stock_report', 'All Stock Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(79, 'search_by_product', 'Search By Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(80, 'date', 'Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(81, 'print', 'Print');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(82, 'stock_date', 'Stock Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(83, 'print_date', 'Print Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(84, 'sales', 'Sales');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(85, 'price', 'Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(86, 'sl', 'SL.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(87, 'add_new_category', 'Add new category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(88, 'category_name', 'Category Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(89, 'save', 'Save');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(90, 'delete', 'Delete');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(91, 'update', 'Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(92, 'action', 'Action');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(93, 'manage_your_category', 'Manage your category ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(94, 'category_edit', 'Category Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(95, 'status', 'Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(96, 'active', 'Active');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(97, 'inactive', 'Inactive');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(98, 'save_changes', 'Save Changes');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(99, 'save_and_add_another', 'Save And Add Another');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(100, 'model', 'Model');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(101, 'supplier_price', 'Supplier Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(102, 'sell_price', 'Sale Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(103, 'image', 'Image');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(104, 'select_one', 'Select One');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(105, 'details', 'Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(106, 'new_product', 'New Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(107, 'add_new_product', 'Add new product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(108, 'barcode', 'Barcode');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(109, 'qr_code', 'Qr-Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(110, 'product_details', 'Product Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(111, 'manage_your_product', 'Manage your product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(112, 'product_edit', 'Product Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(113, 'edit_your_product', 'Edit your product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(114, 'cancel', 'Cancel');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(115, 'incl_vat', 'Incl. Vat');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(116, 'money', 'TK');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(117, 'grand_total', 'Grand Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(118, 'quantity', 'Qnty');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(119, 'product_report', 'Product Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(120, 'product_sales_and_purchase_report', 'Product sales and purchase report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(121, 'previous_stock', 'Previous Stock');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(122, 'out', 'Out');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(123, 'in', 'In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(124, 'to', 'To');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(125, 'previous_balance', 'Previous Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(126, 'customer_address', 'Customer Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(127, 'customer_mobile', 'Customer Mobile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(128, 'customer_email', 'Customer Email');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(129, 'add_new_customer', 'Add new customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(130, 'balance', 'Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(131, 'mobile', 'Mobile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(132, 'address', 'Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(133, 'manage_your_customer', 'Manage your customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(134, 'customer_edit', 'Customer Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(135, 'paid_customer_list', 'Paid Customer List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(136, 'ammount', 'Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(137, 'customer_ledger', 'Customer Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(138, 'manage_customer_ledger', 'Manage Customer Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(139, 'customer_information', 'Customer Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(140, 'debit_ammount', 'Debit Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(141, 'credit_ammount', 'Credit Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(142, 'balance_ammount', 'Balance Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(143, 'receipt_no', 'Receipt NO');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(144, 'description', 'Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(145, 'debit', 'Debit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(146, 'credit', 'Credit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(147, 'item_information', 'Item Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(148, 'total', 'Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(149, 'please_select_supplier', 'Please Select Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(150, 'submit', 'Submit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(151, 'submit_and_add_another', 'Submit And Add Another One');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(152, 'add_new_item', 'Add New Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(153, 'manage_your_purchase', 'Manage your purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(154, 'purchase_edit', 'Purchase Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(155, 'purchase_ledger', 'Purchase Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(156, 'invoice_information', 'Sale Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(157, 'paid_ammount', 'Paid Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(158, 'discount', 'Dis./Pcs.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(159, 'save_and_paid', 'Save And Paid');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(160, 'payee_name', 'Payee Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(161, 'manage_your_invoice', 'Manage your Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(162, 'invoice_edit', 'Sale Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(163, 'new_pos_invoice', 'New POS Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(164, 'add_new_pos_invoice', 'Add new pos Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(165, 'product_id', 'Product ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(166, 'paid_amount', 'Paid Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(167, 'authorised_by', 'Authorised By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(168, 'checked_by', 'Checked By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(169, 'received_by', 'Received By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(170, 'prepared_by', 'Prepared By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(171, 'memo_no', 'Memo No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(172, 'website', 'Website');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(173, 'email', 'Email');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(174, 'invoice_details', 'Sale Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(175, 'reset', 'Reset');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(176, 'payment_account', 'Payment Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(177, 'bank_name', 'Bank Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(178, 'cheque_or_pay_order_no', 'Cheque/Pay Order No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(179, 'payment_type', 'Payment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(180, 'payment_from', 'Payment From');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(181, 'payment_date', 'Payment Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(182, 'add_income', 'Add Income');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(183, 'cash', 'Cash');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(184, 'cheque', 'Cheque');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(185, 'pay_order', 'Pay Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(186, 'payment_to', 'Payment To');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(187, 'total_outflow_ammount', 'Total Expense Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(188, 'transections', 'Transections');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(189, 'accounts_name', 'Accounts Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(190, 'outflow_report', 'Expense Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(191, 'inflow_report', 'Income Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(192, 'all', 'All');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(193, 'account', 'Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(194, 'from', 'From');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(195, 'account_summary_report', 'Account Summary Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(196, 'search_by_date', 'Search By Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(197, 'cheque_no', 'Cheque No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(198, 'name', 'Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(199, 'closing_account', 'Closing Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(200, 'close_your_account', 'Close your account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(201, 'last_day_closing', 'Last Day Closing');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(202, 'cash_in', 'Cash In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(203, 'cash_out', 'Cash Out');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(204, 'cash_in_hand', 'Cash In Hand');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(205, 'add_new_bank', 'Add New Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(206, 'day_closing', 'Day Closing');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(207, 'account_closing_report', 'Account Closing Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(208, 'last_day_ammount', 'Last Day Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(209, 'adjustment', 'Adjustment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(210, 'pay_type', 'Pay Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(211, 'customer_or_supplier', 'Customer,Supplier Or Others');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(212, 'transection_id', 'Transections ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(213, 'accounts_summary_report', 'Accounts Summary Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(214, 'bank_list', 'Bank List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(215, 'bank_edit', 'Bank Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(216, 'debit_plus', 'Debit (+)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(217, 'credit_minus', 'Credit (-)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(218, 'account_name', 'Account Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(219, 'account_type', 'Account Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(220, 'account_real_name', 'Account Real Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(221, 'manage_account', 'Manage Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(222, 'company_name', 'Niha International');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(223, 'edit_your_company_information', 'Edit your company information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(224, 'company_edit', 'Company Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(225, 'admin', 'Admin');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(226, 'user', 'User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(227, 'password', 'Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(228, 'last_name', 'Last Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(229, 'first_name', 'First Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(230, 'add_new_user_information', 'Add new user information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(231, 'user_type', 'User Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(232, 'user_edit', 'User Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(233, 'rtr', 'RTR');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(234, 'ltr', 'LTR');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(235, 'ltr_or_rtr', 'LTR/RTR');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(236, 'footer_text', 'Footer Text');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(237, 'favicon', 'Favicon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(238, 'logo', 'Logo');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(239, 'update_setting', 'Update Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(240, 'update_your_web_setting', 'Update your web setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(241, 'login', 'Login');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(242, 'your_strong_password', 'Your strong password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(243, 'your_unique_email', 'Your unique email');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(244, 'please_enter_your_login_information', 'Please enter your login information.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(245, 'update_profile', 'Update Profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(246, 'your_profile', 'Your Profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(247, 're_type_password', 'Re-Type Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(248, 'new_password', 'New Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(249, 'old_password', 'Old Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(250, 'new_information', 'New Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(251, 'old_information', 'Old Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(252, 'change_your_information', 'Change your information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(253, 'change_your_profile', 'Change your profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(254, 'profile', 'Profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(255, 'wrong_username_or_password', 'Wrong User Name Or Password !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(256, 'successfully_updated', 'Successfully Updated.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(257, 'blank_field_does_not_accept', 'Blank Field Does Not Accept !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(258, 'successfully_changed_password', 'Successfully changed password.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(259, 'you_are_not_authorised_person', 'You are not authorised person !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(260, 'password_and_repassword_does_not_match', 'Passwor and re-password does not match !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(261, 'new_password_at_least_six_character', 'New Password At Least 6 Character.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(262, 'you_put_wrong_email_address', 'You put wrong email address !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(263, 'cheque_ammount_asjusted', 'Cheque amount adjusted.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(264, 'successfully_payment_paid', 'Successfully Payment Paid.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(265, 'successfully_added', 'Successfully Added.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(266, 'successfully_updated_2_closing_ammount_not_changeale', 'Successfully Updated -2. Note: Closing Amount Not Changeable.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(267, 'successfully_payment_received', 'Successfully Payment Received.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(268, 'already_inserted', 'Already Inserted !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(269, 'successfully_delete', 'Successfully Delete.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(270, 'successfully_created', 'Successfully Created.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(271, 'logo_not_uploaded', 'Logo not uploaded !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(272, 'favicon_not_uploaded', 'Favicon not uploaded !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(273, 'supplier_mobile', 'Supplier Mobile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(274, 'supplier_address', 'Supplier Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(275, 'supplier_details', 'Supplier Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(276, 'add_new_supplier', 'Add New Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(277, 'manage_suppiler', 'Manage Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(278, 'manage_your_supplier', 'Manage your supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(279, 'manage_supplier_ledger', 'Manage supplier ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(280, 'invoice_id', 'Invoice ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(281, 'deposite_id', 'Deposite ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(282, 'supplier_actual_ledger', 'Supplier Payment Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(283, 'supplier_information', 'Supplier Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(284, 'event', 'Event');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(285, 'add_new_income', 'Add New Income');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(286, 'add_expese', 'Add Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(287, 'add_new_expense', 'Add New Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(288, 'total_inflow_ammount', 'Total Income Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(289, 'create_new_invoice', 'Create New Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(290, 'create_pos_invoice', 'Create POS Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(291, 'total_profit', 'Total Profit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(292, 'monthly_progress_report', 'Monthly Progress Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(293, 'total_invoice', 'Total Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(294, 'account_summary', 'Account Summary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(295, 'total_supplier', 'Total Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(296, 'total_product', 'Total Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(297, 'total_customer', 'Total Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(298, 'supplier_edit', 'Supplier Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(299, 'add_new_invoice', 'Add New Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(300, 'add_new_purchase', 'Add new purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(301, 'currency', 'Currency');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(302, 'currency_position', 'Currency Position');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(303, 'left', 'Left');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(304, 'right', 'Right');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(305, 'add_tax', 'Add TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(306, 'manage_tax', 'Manage TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(307, 'add_new_tax', 'Add new TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(308, 'enter_tax', 'Enter TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(309, 'already_exists', 'Already Exists !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(310, 'successfully_inserted', 'Successfully Inserted.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(311, 'tax', 'TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(312, 'tax_edit', 'TAX Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(313, 'product_not_added', 'Product not added !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(314, 'total_tax', 'Total TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(315, 'manage_your_supplier_details', 'Manage your supplier details.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(316, 'invoice_description', 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(317, 'thank_you_for_choosing_us', 'Thank you very much for choosing us.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(318, 'billing_date', 'Billing Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(319, 'billing_to', 'Billing To');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(320, 'billing_from', 'Billing From');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(321, 'you_cant_delete_this_product', 'Sorry !!  You can\'t delete this product.This product already used in calculation system!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(322, 'old_customer', 'Old Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(323, 'new_customer', 'New Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(324, 'new_supplier', 'New Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(325, 'old_supplier', 'Old Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(326, 'credit_customer', 'Credit Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(327, 'account_already_exists', 'This Account Already Exists !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(328, 'edit_income', 'Edit Income');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(329, 'you_are_not_access_this_part', 'You are not authorised person !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(330, 'account_edit', 'Account Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(331, 'due', 'Due');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(332, 'expense_edit', 'Expense Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(333, 'please_select_customer', 'Please select customer !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(334, 'profit_report', 'Profit Report (Sale Wise)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(335, 'total_profit_report', 'Total profit report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(336, 'please_enter_valid_captcha', 'Please enter valid captcha.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(337, 'category_not_selected', 'Category not selected.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(338, 'supplier_not_selected', 'Supplier not selected.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(339, 'please_select_product', 'Please select product.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(340, 'product_model_already_exist', 'Product model already exist !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(341, 'invoice_logo', 'Sale Logo');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(342, 'available_qnty', 'Av. Qnty.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(343, 'you_can_not_buy_greater_than_available_cartoon', 'You can not select grater than available cartoon !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(344, 'customer_details', 'Customer details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(345, 'manage_customer_details', 'Manage customer details.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(346, 'site_key', 'Captcha Site Key');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(347, 'secret_key', 'Captcha Secret Key');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(348, 'captcha', 'Captcha');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(349, 'cartoon_quantity', 'Cartoon Quantity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(350, 'total_cartoon', 'Total Cartoon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(351, 'cartoon', 'Cartoon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(352, 'item_cartoon', 'Item/Cartoon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(353, 'product_and_supplier_did_not_match', 'Product and supplier did not match !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(354, 'if_you_update_purchase_first_select_supplier_then_product_and_then_quantity', 'If you update purchase,first select supplier then product and then update qnty.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(355, 'item', 'Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(356, 'manage_your_credit_customer', 'Manage your credit customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(357, 'total_quantity', 'Total Quantity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(358, 'quantity_per_cartoon', 'Quantity per cartoon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(359, 'barcode_qrcode_scan_here', 'Barcode or QR-code scan here');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(360, 'synchronizer_setting', 'Synchronizer Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(361, 'data_synchronizer', 'Data Synchronizer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(362, 'hostname', 'Host name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(363, 'username', 'User Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(364, 'ftp_port', 'FTP Port');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(365, 'ftp_debug', 'FTP Debug');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(366, 'project_root', 'Project Root');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(367, 'please_try_again', 'Please try again');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(368, 'save_successfully', 'Save successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(369, 'synchronize', 'Synchronize');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(370, 'internet_connection', 'Internet Connection');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(371, 'outgoing_file', 'Outgoing File');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(372, 'incoming_file', 'Incoming File');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(373, 'ok', 'Ok');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(374, 'not_available', 'Not Available');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(375, 'available', 'Available');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(376, 'download_data_from_server', 'Download data from server');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(377, 'data_import_to_database', 'Data import to database');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(378, 'data_upload_to_server', 'Data uplod to server');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(379, 'please_wait', 'Please Wait');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(380, 'ooops_something_went_wrong', 'Oooops Something went wrong !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(381, 'upload_successfully', 'Upload successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(382, 'unable_to_upload_file_please_check_configuration', 'Unable to upload file please check configuration');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(383, 'please_configure_synchronizer_settings', 'Please configure synchronizer settings');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(384, 'download_successfully', 'Download successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(385, 'unable_to_download_file_please_check_configuration', 'Unable to download file please check configuration');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(386, 'data_import_first', 'Data import past');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(387, 'data_import_successfully', 'Data import successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(388, 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data please check config or sql file');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(389, 'total_sale_ctn', 'Total Sale Ctn');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(390, 'in_qnty', 'In Qnty.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(391, 'out_qnty', 'Out Qnty.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(392, 'stock_report_supplier_wise', 'Stock Report (Supplier Wise)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(393, 'all_stock_report_supplier_wise', 'Stock Report (Suppler Wise)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(394, 'select_supplier', 'Select Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(395, 'stock_report_product_wise', 'Stock Report (Product Wise)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(396, 'phone', 'Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(397, 'select_product', 'Select Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(398, 'in_quantity', 'In Qnty.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(399, 'out_quantity', 'Out Qnty.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(400, 'in_taka', 'In TK.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(401, 'out_taka', 'Out TK.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(402, 'commission', 'Commission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(403, 'generate_commission', 'Generate Commssion');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(404, 'commission_rate', 'Commission Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(405, 'total_ctn', 'Total Ctn.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(406, 'per_pcs_commission', 'Per PCS Commission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(407, 'total_commission', 'Total Commission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(408, 'enter', 'Enter');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(409, 'please_add_walking_customer_for_default_customer', 'Please add \'Walking Customer\' for default customer.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(410, 'supplier_ammount', 'Supplier Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(411, 'my_sale_ammount', 'My Sale Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(412, 'signature_pic', 'Signature Picture');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(413, 'branch', 'Branch');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(414, 'ac_no', 'A/C Number');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(415, 'ac_name', 'A/C Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(416, 'bank_transaction', 'Bank Transaction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(417, 'bank', 'Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(418, 'withdraw_deposite_id', 'Withdraw / Deposite ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(419, 'bank_ledger', 'Bank Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(420, 'note_name', 'Note Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(421, 'pcs', 'Pcs.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(422, '1', '1');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(423, '2', '2');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(424, '5', '5');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(425, '10', '10');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(426, '20', '20');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(427, '50', '50');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(428, '100', '100');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(429, '500', '500');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(430, '1000', '1000');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(431, 'total_discount', 'Total Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(432, 'product_not_found', 'Product not found !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(433, 'this_is_not_credit_customer', 'This is not credit customer !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(434, 'personal_loan', 'Personal Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(435, 'add_person', 'Add Person');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(436, 'add_loan', 'Add Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(437, 'add_payment', 'Add Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(438, 'manage_person', 'Manage Person');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(439, 'personal_edit', 'Person Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(440, 'person_ledger', 'Person Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(441, 'backup_restore', 'Backup ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(442, 'database_backup', 'Database backup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(443, 'file_information', 'File information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(444, 'filename', 'Filename');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(445, 'size', 'Size');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(446, 'backup_date', 'Backup date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(447, 'backup_now', 'Backup now');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(448, 'restore_now', 'Restore now');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(449, 'are_you_sure', 'Are you sure ?');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(450, 'download', 'Download');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(451, 'backup_and_restore', 'Backup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(452, 'backup_successfully', 'Backup successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(453, 'delete_successfully', 'successfully Deleted');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(454, 'stock_ctn', 'Stock/Qnt');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(455, 'unit', 'Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(456, 'meter_m', 'Meter (M)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(457, 'piece_pc', 'Piece (Pc)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(458, 'kilogram_kg', 'Kilogram (Kg)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(459, 'stock_cartoon', 'Stock Cartoon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(460, 'add_product_csv', 'Add Product (CSV)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(461, 'import_product_csv', 'Import product (CSV)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(462, 'close', 'Close');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(463, 'download_example_file', 'Download example file.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(464, 'upload_csv_file', 'Upload CSV File');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(465, 'csv_file_informaion', 'CSV File Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(466, 'out_of_stock', 'Out Of Stock');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(467, 'others', 'Others');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(468, 'full_paid', 'Full Paid');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(469, 'successfully_saved', 'Your Data Successfully Saved');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(470, 'manage_loan', 'Manage Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(471, 'receipt', 'Receipt');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(472, 'payment', 'Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(473, 'cashflow', 'Daily Cash Flow');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(474, 'signature', 'Signature');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(475, 'supplier_reports', 'Supplier Reports');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(476, 'generate', 'Generate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(477, 'todays_overview', 'Todays Overview');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(478, 'last_sales', 'Last Sales');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(479, 'manage_transaction', 'Manage Transaction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(480, 'daily_summary', 'Daily Summary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(481, 'daily_cash_flow', 'Daily Cash Flow');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(482, 'custom_report', 'Custom Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(483, 'transaction', 'Transaction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(484, 'receipt_amount', 'Receipt Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(485, 'transaction_details_datewise', 'Transaction Details Datewise');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(486, 'cash_closing', 'Cash Closing');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(487, 'you_can_not_buy_greater_than_available_qnty', 'You can not buy greater than available qnty.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(488, 'supplier_id', 'Supplier ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(489, 'category_id', 'Category ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(490, 'select_report', 'Select Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(491, 'supplier_summary', 'Supplier summary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(492, 'sales_payment_actual', 'Sales payment actual');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(493, 'today_already_closed', 'Today already closed.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(494, 'root_account', 'Root Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(495, 'office', 'Office');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(496, 'loan', 'Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(497, 'transaction_mood', 'Transaction Mood');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(498, 'select_account', 'Select Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(499, 'add_receipt', 'Add Receipt');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(500, 'update_transaction', 'Update Transaction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(501, 'no_stock_found', 'No Stock Found !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(502, 'admin_login_area', 'Admin Login Area');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(503, 'print_qr_code', 'Print QR Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(504, 'discount_type', 'Discount Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(505, 'discount_percentage', 'Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(506, 'fixed_dis', 'Fixed Dis.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(507, 'return', 'Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(508, 'stock_return_list', 'Stock Return List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(509, 'wastage_return_list', 'Wastage Return List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(510, 'return_invoice', 'Sale Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(511, 'sold_qty', 'Sold Qty');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(512, 'ret_quantity', 'Return Qty');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(513, 'deduction', 'Deduction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(514, 'check_return', 'Check Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(515, 'reason', 'Reason');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(516, 'usablilties', 'Usability');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(517, 'adjs_with_stck', 'Adjust With Stock');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(518, 'return_to_supplier', 'Return To Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(519, 'wastage', 'Wastage');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(520, 'to_deduction', 'Total Deduction ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(521, 'nt_return', 'Net Return Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(522, 'return_list', 'Return List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(523, 'add_return', 'Add Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(524, 'per_qty', 'Purchase Qty');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(525, 'return_supplier', 'Supplier Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(526, 'stock_purchase', 'Stock Purchase Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(527, 'stock_sale', 'Stock Sale Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(528, 'supplier_return', 'Supplier Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(529, 'purchase_id', 'Purchase ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(530, 'return_id', 'Return ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(531, 'supplier_return_list', 'Supplier Return List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(532, 'c_r_slist', 'Stock Return Stock');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(533, 'wastage_list', 'Wastage List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(534, 'please_input_correct_invoice_id', 'Please Input a Correct Sale ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(535, 'please_input_correct_purchase_id', 'Please Input Your Correct  Purchase ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(536, 'add_more', 'Add More');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(537, 'prouct_details', 'Product Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(538, 'prouct_detail', 'Product Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(539, 'stock_return', 'Stock Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(540, 'choose_transaction', 'Select Transaction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(541, 'transection_category', 'Select  Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(542, 'transaction_categry', 'Select Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(543, 'search_supplier', 'Search Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(544, 'customer_id', 'Customer ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(545, 'search_customer', 'Search Customer Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(546, 'serial_no', 'SN');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(547, 'item_discount', 'Item Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(548, 'invoice_discount', 'Sale Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(549, 'add_unit', 'Add Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(550, 'manage_unit', 'Manage Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(551, 'add_new_unit', 'Add New Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(552, 'unit_name', 'Unit Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(553, 'payment_amount', 'Payment Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(554, 'manage_your_unit', 'Manage Your Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(555, 'unit_id', 'Unit ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(556, 'unit_edit', 'Unit Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(557, 'vat', 'Vat');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(558, 'sales_report_category_wise', 'Sales Report (Category wise)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(559, 'purchase_report_category_wise', 'Purchase Report (Category wise)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(560, 'category_wise_purchase_report', 'Category wise purchase report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(561, 'category_wise_sales_report', 'Category wise sales report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(562, 'best_sale_product', 'Best Sale Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(563, 'all_best_sales_product', 'All Best Sales Products');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(564, 'todays_customer_receipt', 'Todays Customer Receipt');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(565, 'not_found', 'Record not found');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(566, 'collection', 'Collection');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(567, 'increment', 'Increment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(568, 'accounts_tree_view', 'Accounts Tree View');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(569, 'debit_voucher', 'Debit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(570, 'voucher_no', 'Voucher No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(571, 'credit_account_head', 'Credit Account Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(572, 'remark', 'Remark');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(573, 'code', 'Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(574, 'amount', 'Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(575, 'approved', 'Approved');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(576, 'debit_account_head', 'Debit Account Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(577, 'credit_voucher', 'Credit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(578, 'find', 'Find');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(579, 'transaction_date', 'Transaction Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(580, 'voucher_type', 'Voucher Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(581, 'particulars', 'Particulars');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(582, 'with_details', 'With Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(583, 'general_ledger', 'General Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(584, 'general_ledger_of', 'General ledger of');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(585, 'pre_balance', 'Pre Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(586, 'current_balance', 'Current Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(587, 'to_date', 'To Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(588, 'from_date', 'From Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(589, 'trial_balance', 'Trial Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(590, 'authorized_signature', 'Authorized Signature');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(591, 'chairman', 'Chairman');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(592, 'total_income', 'Total Income');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(593, 'statement_of_comprehensive_income', 'Statement of Comprehensive Income');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(594, 'profit_loss', 'Profit Loss');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(595, 'cash_flow_report', 'Cash Flow Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(596, 'cash_flow_statement', 'Cash Flow Statement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(597, 'amount_in_dollar', 'Amount In Dollar');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(598, 'opening_cash_and_equivalent', 'Opening Cash and Equivalent');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(599, 'coa_print', 'Coa Print');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(600, 'cash_flow', 'Cash Flow');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(601, 'cash_book', 'Cash Book');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(602, 'bank_book', 'Bank Book');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(603, 'c_o_a', 'Chart of Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(604, 'journal_voucher', 'Journal Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(605, 'contra_voucher', 'Contra Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(606, 'voucher_approval', 'Vouchar Approval');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(607, 'supplier_payment', 'Supplier Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(608, 'customer_receive', 'Customer Receive');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(609, 'gl_head', 'General Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(610, 'account_code', 'Account Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(611, 'opening_balance', 'Opening Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(612, 'head_of_account', 'Head of Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(613, 'inventory_ledger', 'Inventory Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(614, 'newpassword', 'New Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(615, 'password_recovery', 'Password Recovery');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(616, 'forgot_password', 'Forgot Password ??');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(617, 'send', 'Send');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(618, 'due_report', 'Due Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(619, 'due_amount', 'Due Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(620, 'download_sample_file', 'Download Sample File');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(621, 'customer_csv_upload', 'Customer Csv Upload');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(622, 'csv_supplier', 'Csv Upload Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(623, 'csv_upload_supplier', 'Csv Upload Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(624, 'previous', 'Previous');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(625, 'net_total', 'Net Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(626, 'currency_list', 'Currency List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(627, 'currency_name', 'Currency Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(628, 'currency_icon', 'Currency Symbol');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(629, 'add_currency', 'Add Currency');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(630, 'role_permission', 'Role Permission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(631, 'role_list', 'Role List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(632, 'user_assign_role', 'User Assign Role');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(633, 'permission', 'Permission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(634, 'add_role', 'Add Role');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(635, 'add_module', 'Add Module');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(636, 'module_name', 'Module Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(637, 'office_loan', 'Office Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(638, 'add_menu', 'Add Menu');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(639, 'menu_name', 'Menu Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(640, 'sl_no', 'Sl No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(641, 'create', 'Create');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(642, 'read', 'Read');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(643, 'role_name', 'Role Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(644, 'qty', 'Quantity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(645, 'max_rate', 'Max Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(646, 'min_rate', 'Min Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(647, 'avg_rate', 'Average Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(648, 'role_permission_added_successfully', 'Role Permission Successfully Added');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(649, 'update_successfully', 'Successfully Updated');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(650, 'role_permission_updated_successfully', 'Role Permission Successfully Updated ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(651, 'shipping_cost', 'Shipping Cost');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(652, 'in_word', 'In Word ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(653, 'shipping_cost_report', 'Shipping Cost Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(654, 'cash_book_report', 'Cash Book Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(655, 'inventory_ledger_report', 'Inventory Ledger Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(656, 'trial_balance_with_opening_as_on', 'Trial Balance With Opening As On');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(657, 'type', 'Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(658, 'taka_only', 'Taka Only');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(659, 'item_description', 'Desc');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(660, 'sold_by', 'Sold By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(661, 'user_wise_sales_report', 'User Wise Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(662, 'user_name', 'User Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(663, 'total_sold', 'Total Sold');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(664, 'user_wise_sale_report', 'User Wise Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(665, 'barcode_or_qrcode', 'Barcode/QR-code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(666, 'category_csv_upload', 'Category Csv  Upload');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(667, 'unit_csv_upload', 'Unit Csv Upload');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(668, 'invoice_return_list', 'Sales Return list');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(669, 'invoice_return', 'Sales Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(670, 'tax_report', 'TAX Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(671, 'select_tax', 'Select TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(672, 'hrm', 'HRM');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(673, 'employee', 'Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(674, 'add_employee', 'Add Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(675, 'manage_employee', 'Manage Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(676, 'attendance', 'Attendance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(677, 'add_attendance', 'Attendance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(678, 'manage_attendance', 'Manage Attendance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(679, 'payroll', 'Payroll');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(680, 'add_payroll', 'Payroll');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(681, 'manage_payroll', 'Manage Payroll');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(682, 'employee_type', 'Employee Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(683, 'employee_designation', 'Employee Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(684, 'designation', 'Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(685, 'add_designation', 'Add Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(686, 'manage_designation', 'Manage Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(687, 'designation_update_form', 'Designation Update form');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(688, 'picture', 'Picture');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(689, 'country', 'Country');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(690, 'blood_group', 'Blood Group');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(691, 'address_line_1', 'Address Line 1');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(692, 'address_line_2', 'Address Line 2');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(693, 'zip', 'Zip code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(694, 'city', 'City');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(695, 'hour_rate_or_salary', 'Houre Rate/Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(696, 'rate_type', 'Rate Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(697, 'hourly', 'Hourly');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(698, 'salary', 'Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(699, 'employee_update', 'Employee Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(700, 'checkin', 'Check In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(701, 'employee_name', 'Employee Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(702, 'checkout', 'Check Out');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(703, 'confirm_clock', 'Confirm Clock');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(704, 'stay', 'Stay Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(705, 'sign_in', 'Sign In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(706, 'check_in', 'Check In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(707, 'single_checkin', 'Single Check In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(708, 'bulk_checkin', 'Bulk Check In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(709, 'successfully_checkout', 'Successfully Checkout');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(710, 'attendance_report', 'Attendance Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(711, 'datewise_report', 'Date Wise Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(712, 'employee_wise_report', 'Employee Wise Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(713, 'date_in_time_report', 'Date In Time Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(714, 'request', 'Request');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(715, 'sign_out', 'Sign Out');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(716, 'work_hour', 'Work Hours');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(717, 's_time', 'Start Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(718, 'e_time', 'In Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(719, 'salary_benefits_type', 'Benefits Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(720, 'salary_benefits', 'Salary Benefits');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(721, 'beneficial_list', 'Benefit List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(722, 'add_beneficial', 'Add Benefits');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(723, 'add_benefits', 'Add Benefits');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(724, 'benefits_list', 'Benefit List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(725, 'benefit_type', 'Benefit Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(726, 'benefits', 'Benefit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(727, 'manage_benefits', 'Manage Benefits');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(728, 'deduct', 'Deduct');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(729, 'add', 'Add');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(730, 'add_salary_setup', 'Add Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(731, 'manage_salary_setup', 'Manage Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(732, 'basic', 'Basic');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(733, 'salary_type', 'Salary Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(734, 'addition', 'Addition');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(735, 'gross_salary', 'Gross Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(736, 'set', 'Set');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(737, 'salary_generate', 'Salary Generate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(738, 'manage_salary_generate', 'Manage Salary Generate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(739, 'sal_name', 'Salary Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(740, 'gdate', 'Generated Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(741, 'generate_by', 'Generated By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(742, 'the_salary_of', 'The Salary of ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(743, 'already_generated', ' Already Generated');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(744, 'salary_month', 'Salary Month');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(745, 'successfully_generated', 'Successfully Generated');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(746, 'salary_payment', 'Salary Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(747, 'employee_salary_payment', 'Employee Salary Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(748, 'total_salary', 'Total Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(749, 'total_working_minutes', 'Total Working Hours');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(750, 'working_period', 'Working Period');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(751, 'paid_by', 'Paid By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(752, 'pay_now', 'Pay Now ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(753, 'confirm', 'Confirm');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(754, 'successfully_paid', 'Successfully Paid');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(755, 'add_incometax', 'Add Income TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(756, 'setup_tax', 'Setup TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(757, 'start_amount', 'Start Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(758, 'end_amount', 'End Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(759, 'tax_rate', 'TAX Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(760, 'setup', 'Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(761, 'manage_income_tax', 'Manage Income TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(762, 'income_tax_updateform', 'Income TAX Update form');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(763, 'positional_information', 'Positional Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(764, 'personal_information', 'Personal Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(765, 'timezone', 'Time Zone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(766, 'sms', 'SMS');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(767, 'sms_configure', 'SMS Configure');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(768, 'url', 'URL');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(769, 'sender_id', 'Sender ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(770, 'api_key', 'Api Key');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(771, 'gui_pos', 'GUI POS');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(772, 'manage_service', 'Manage Service');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(773, 'service', 'Service');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(774, 'add_service', 'Add Service');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(775, 'service_edit', 'Service Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(776, 'service_csv_upload', 'Service CSV Upload');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(777, 'service_name', 'Service Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(778, 'charge', 'Charge');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(779, 'service_invoice', 'Service Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(780, 'service_discount', 'Service Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(781, 'hanging_over', 'ETD');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(782, 'service_details', 'Service Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(783, 'tax_settings', 'TAX Settings');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(784, 'default_value', 'Default Value');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(785, 'number_of_tax', 'Number of TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(786, 'please_select_employee', 'Please Select Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(787, 'manage_service_invoice', 'Manage Service Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(788, 'update_service_invoice', 'Update Service Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(789, 'customer_wise_tax_report', 'Customer Wise TAX Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(790, 'service_id', 'Service Id');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(791, 'invoice_wise_tax_report', 'Invoice Wise TAX Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(792, 'reg_no', 'Reg No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(793, 'update_now', 'Update Now');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(794, 'import', 'Import');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(795, 'add_expense_item', 'Add Expense Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(796, 'manage_expense_item', 'Manage Expense Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(797, 'add_expense', 'Add Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(798, 'manage_expense', 'Manage Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(799, 'expense_statement', 'Expense Statement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(800, 'expense_type', 'Expense Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(801, 'expense_item_name', 'Expense Item Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(802, 'stock_purchase_price', 'Stock Purchase Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(803, 'purchase_price', 'Purchase Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(804, 'customer_advance', 'Customer Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(805, 'advance_type', 'Advance Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(806, 'restore', 'Restore');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(807, 'supplier_advance', 'Supplier Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(808, 'please_input_correct_invoice_no', 'Please Input Correct Invoice NO');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(809, 'backup', 'Back Up');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(810, 'app_setting', 'App Settings');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(811, 'local_server_url', 'Local Server Url');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(812, 'online_server_url', 'Online Server Url');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(813, 'connet_url', 'Connected Hotspot Ip/url');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(814, 'update_your_app_setting', 'Update Your App Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(815, 'select_category', 'Select Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(816, 'mini_invoice', 'Mini Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(817, 'purchase_details', 'Purchase Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(818, 'disc', 'Dis %');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(819, 'serial', 'Serial');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(820, 'transaction_head', 'Transaction Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(821, 'transaction_type', 'Transaction Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(822, 'return_details', 'Return Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(823, 'return_to_customer', 'Return To Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(824, 'sales_and_purchase_report_summary', 'Sales And Purchase Report Summary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(825, 'add_person_officeloan', 'Add Person (Office Loan)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(826, 'add_loan_officeloan', 'Add Loan (Office Loan)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(827, 'add_payment_officeloan', 'Add Payment (Office Loan)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(828, 'manage_loan_officeloan', 'Manage Loan (Office Loan)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(829, 'add_person_personalloan', 'Add Person (Personal Loan)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(830, 'add_loan_personalloan', 'Add Loan (Personal Loan)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(831, 'add_payment_personalloan', 'Add Payment (Personal Loan)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(832, 'manage_loan_personalloan', 'Manage Loan (Personal)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(833, 'hrm_management', 'Human Resource');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(834, 'cash_adjustment', 'Cash Adjustment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(835, 'adjustment_type', 'Adjustment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(836, 'change', 'Change');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(837, 'sale_by', 'Sale By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(838, 'salary_date', 'Salary Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(839, 'earnings', 'Earnings');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(840, 'total_addition', 'Total Addition');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(841, 'total_deduction', 'Total Deduction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(842, 'net_salary', 'Net Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(843, 'ref_number', 'Reference Number');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(844, 'name_of_bank', 'Name Of Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(845, 'salary_slip', 'Salary Slip');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(846, 'basic_salary', 'Basic Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(847, 'return_from_customer', 'Return From Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(848, 'quotation', 'Quotation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(849, 'add_quotation', 'Add Quotation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(850, 'manage_quotation', 'Manage Quotation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(851, 'terms', 'Terms');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(852, 'send_to_customer', 'Sent To Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(853, 'quotation_no', 'Quotation No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(854, 'quotation_date', 'Quotation Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(855, 'total_service_tax', 'Total Service TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(856, 'totalservicedicount', 'Total Service Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(857, 'item_total', 'Item Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(858, 'service_total', 'Service Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(859, 'quot_description', 'Quotation Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(860, 'sub_total', 'Sub Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(861, 'mail_setting', 'Mail Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(862, 'mail_configuration', 'Mail Configuration');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(863, 'mail', 'Mail');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(864, 'protocol', 'Protocol');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(865, 'smtp_host', 'SMTP Host');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(866, 'smtp_port', 'SMTP Port');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(867, 'sender_mail', 'Sender Mail');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(868, 'mail_type', 'Mail Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(869, 'html', 'HTML');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(870, 'text', 'TEXT');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(871, 'expiry_date', 'Expiry Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(872, 'api_secret', 'Api Secret');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(873, 'please_config_your_mail_setting', NULL);
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(874, 'quotation_successfully_added', 'Quotation Successfully Added');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(875, 'add_to_invoice', 'Add To Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(876, 'added_to_invoice', 'Added To Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(877, 'closing_balance', 'Closing Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(878, 'contact', 'Contact');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(879, 'fax', 'Fax');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(880, 'state', 'State');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(881, 'discounts', 'Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(882, 'address1', 'Address1');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(883, 'address2', 'Address2');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(884, 'receive', 'Receive');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(885, 'purchase_history', 'Purchase History');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(886, 'cash_payment', 'Cash Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(887, 'bank_payment', 'Bank Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(888, 'do_you_want_to_print', 'Do You Want to Print');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(889, 'yes', 'Yes');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(890, 'no', 'No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(891, 'todays_sale', 'Today\'s Sales');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(892, 'or', 'OR');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(893, 'no_result_found', 'No Result Found');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(894, 'add_service_quotation', 'Add Service Quotation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(895, 'add_to_invoice', 'Add To Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(896, 'item_quotation', 'Item Quotation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(897, 'service_quotation', 'Service Quotation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(898, 'return_from', 'Return Form');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(899, 'customer_return_list', 'Customer Return List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(900, 'pdf', 'Pdf');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(901, 'note', 'Note');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(902, 'update_debit_voucher', 'Update Debit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(903, 'update_credit_voucher', 'Update Credit voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(904, 'on', 'On');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(905, '', '');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(906, 'total_expenses', 'Total Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(907, 'already_exist', 'Already Exist');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(908, 'checked_out', 'Checked Out');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(909, 'update_salary_setup', 'Update Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(910, 'employee_signature', 'Employee Signature');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(911, 'payslip', 'Payslip');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(912, 'exsisting_role', 'Existing Role');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(913, 'filter', 'Filter');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(914, 'testinput', NULL);
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(915, 'update_quotation', 'Update Quotation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(916, 'quotation_successfully_updated', 'Quotation Successfully Updated');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(917, 'successfully_approved', 'Successfully Approved');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(918, 'expiry', 'Expiry');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(919, 'user_list', 'User List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(920, 'assign_roleto_user', 'Assign Role To User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(921, 'assign_role_list', 'Assigned Role List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(922, 'application_settings', 'Application Settings');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(923, 'company_list', 'Company List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(924, 'edit_company', 'Edit Company');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(925, 'edit_user', 'Edit User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(926, 'edit_currency', 'Edit Currency');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(927, 'mobile_no', 'Mobile No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(928, 'email_address', 'Email Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(929, 'customer_list', 'Customer List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(930, 'advance_receipt', 'Advance Receipt');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(931, 'supplier_list', 'Supplier List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(932, 'category_list', 'Category List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(933, 'no_record_found', 'No Record Found');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(934, 'unit_list', 'Unit List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(935, 'edit_product', 'Edit Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(936, 'payable_summary', 'Payable Summary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(937, 'pad_print', 'Pad Print');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(938, 'pos_print', 'POS Print');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(939, 'pos_invoice', 'POS Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(940, 'employee_profile', 'Employee Profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(941, 'edit_beneficials', 'Edit Beneficials');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(942, 'edit_setup_update', 'Edit Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(943, 'add_office_loan', 'Add Office Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(944, 'income_tax', 'Income TAX');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(945, 'quotation_to_sale', 'Quotation To Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(946, 'quotation_edit', 'Edit Quotation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(947, 'edit_profile', 'Edit Profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(948, 'edit_supplier', 'Edit Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(949, 'edit_bank', 'Edit Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(950, 'balance_sheet', 'Balance Sheet');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(951, 'salary_setup', 'Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(952, 'account_head', 'Account Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(953, 'add_invoice', 'Add Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(954, 'general_ledger_report', 'General Ledger Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(955, 'print_setting', 'Print Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(956, 'header', 'Header');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(957, 'footer', 'Footer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(958, 'supplier_payment_receipt', 'Payment Receipt');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(959, 'welcome_back', 'Welcome Back');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(960, 'overwrite', 'Over Write');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(961, 'module', 'Module');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(962, 'purchase_key', 'Purchase Key');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(963, 'buy_now', 'Buy Now');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(964, 'module_list', 'Module List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(965, 'modules', 'Modules');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(966, 'install', 'Install');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(967, 'uninstall', 'Uninstall');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(968, 'module_added_successfully', 'Module Added Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(969, 'no_tables_are_registered_in_config', 'No table registered in config');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(970, 'tables_are_not_available_in_database', 'Table Are not Available in Database');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(971, 'addon', 'Add-ons');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(972, 'generate_qr', 'Generate QR');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(973, 'latestv', 'Latest Version');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(974, 'Current Version', NULL);
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(976, 'notesupdate', 'Note: If you want to update software,you Must have immediate previous version');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(977, 'arabic', NULL);
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(978, 'vat_no', 'VAT NO');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(979, 'new_p_method', 'Add New Payment Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(980, 'dis_val', 'Dis. Value');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(981, 'vat_val', 'VAT Value');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(982, 'ttl_val', 'Total VAT');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(983, 'purchase_discount', 'Purchase Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(984, 'order_time', 'Order Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(985, 'order_by', 'Order By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(986, 'terms_list', 'Sales Terms List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(987, 'terms_add', 'Add Sales Terms');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(988, 'term_condi', 'Terms & Condition');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(989, 'terms_update', 'Update Seles Terms');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(990, 'add_payment_method', 'Add Payment Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(991, 'payment_method_list', 'Payment Method List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(992, 'payment_method_name', 'Payment Method Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(993, 'batch_no', 'Batch No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(994, 'total_with_vat', 'Total With VAT');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(995, 'invoice_time', 'Invoice Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(996, 'product_vat', 'Product VAT');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(997, 'service_vat', 'Service VAT');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(998, 'cr_no', 'CR NO');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(999, 'service_payment', 'Service Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1000, 'vat_tax_setting', 'VAT & TAX Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1001, 'qty2', 'Qty');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1002, 'batch', 'Batch');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1003, 'disc', 'Disc');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1004, 'tot_price', 'Tot Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1005, 'tot_before_dis', 'Total Before Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1006, 'tot_with_dis', 'Total with Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1007, 'tax_vat', 'TAX Value');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1008, 'return_receipt_text', 'Please keep the receipt and bring it in case of return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1009, 'invoice_qr_code', 'Invoice Qr-Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1010, 'sales_due', 'Today Sales Due');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1011, 'purchase_due', 'Today Purchase Due');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1012, 'delivery_note', 'Delivery Note');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1013, 'financial_year', 'Financial Year');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1014, 'close_financial_year', 'Close Financial Year');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1015, 'create_financial_year', 'Create Financial Year');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1016, 'year_closing', 'Year Closing');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1017, 'financial_year_start_date', 'Financial Year Start');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1018, 'financial_year_end_date', 'Financial Year End');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1019, 'subaccount_list', 'Sub Account List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1020, 'subaccount_add', 'Sub Account Add');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1021, 'subtype', 'Sub Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1022, 'predefined_accounts', 'Predefined Accounts');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1023, 'create_debit_voucher', 'Create Debit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1024, 'ledger_comment', 'Ledger Comment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1025, 'reverseHead', 'Reverse Account Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1026, 'VNo', 'VNo');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1027, 'ledgerComment', '	Ledger Comment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1028, 'create_credit_voucher', 'Create Credit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1029, 'create_contra_voucher', 'Create Contra Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1030, 'create_journal_voucher', 'Create Journal Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1031, 'reverse_account_head', 'Reverse Account Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1032, 'bank_reconciliation', 'Bank Reconciliation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1033, 'day_book', 'Day Book');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1034, 'sub_ledger', 'Sub Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1035, 'income_statement_form', 'Income Statement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1036, 'year', 'Year');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1037, 'expenditure_statement', 'Expenditure Statement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1038, 'profit_loss_report', 'Profit Loss');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1039, 'fixedasset_schedule', 'Fixed Asset Schedule');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1040, 'receipt_payment', 'Receipt & Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1041, 'cash_basis', 'Cash Basis');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1042, 'accrual_basis', 'Accrual Basis');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1043, 'bank_reconciliation_report', 'Bank Reconciliation Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1044, 'salary_advance_view', 'Salary Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1045, 'add_salary_advance', 'Add Salary Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1046, 'manage_salary_advance', 'Manage Salary Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1047, 'release_amount', 'Release Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1048, 'create_date', 'Create Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1049, 'employee_salary_generate', 'Salary Generate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1050, 'approved_date', 'Approved Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1051, 'approved_by', 'Approved By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1052, 'salar_month', 'Salary Month');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1053, 'employee_salary_chart', 'Employee Salary Chart');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1054, 'post', 'Post');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1055, 'employee_salary_payment_view', 'Manage Employee Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1056, 'pay_by', 'Pay By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1057, 'bank_book_report', 'Bank Book Report Of');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1058, 'head_name', 'Head Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1059, 'head_code', 'Head Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1060, 'voucher', 'Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1061, 'sub_ledger_of', 'Sub Ledger of');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1062, 'fixed_assets_report', 'Fixed Assets Annual Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1063, 'opening_balance_fixed_assets', 'Opening Balance of Fixed Assets');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1064, 'additions', 'Additions');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1065, 'closing_balance_fixed_assets', 'Closing Balance of Fixed Assets');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1066, 'depreciation_rate', 'Depreciation Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1067, 'depreciation_value', 'Depreciation Value');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1068, 'opening_balance_accumulated_depreciation', 'Opening Balance of Accumulated Depreciation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1069, 'closing_balance_accumulated_depreciation', 'Closing Balance of Accumulated Depreciation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1070, 'written_down_value', 'Written Down Value');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1071, 'unapproved', 'Unapproved');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1072, 'check_no', 'Check No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1073, 'Total Liabilities Equity', 'total_liabilities_equity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1074, 'total_equity', 'Total Equity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1075, 'total_liabilities', 'Total Liabilities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1076, 'total_assets', 'Total Assets');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1077, 'cashinhand', 'Cash In Hand');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1078, 'cash_bank', 'Cash At Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1079, 'advance', 'Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1080, 'view_employee_payment', 'Employee Payment List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1081, 'ret_item', 'Returned Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1082, 'replaced_item', 'Replaced Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1083, 'adj_amount', 'Adjusted Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1084, 'is_autoapprove_v', 'Auto Approve Invoice Voucher');

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

INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(1, 'invoice', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(2, 'customer', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(3, 'product', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(4, 'supplier', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(5, 'purchase', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(6, 'stock', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(7, 'return', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(8, 'report', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(9, 'accounts', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(11, 'tax', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(12, 'hrm_management', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(13, 'service', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(15, 'setting', NULL, NULL, NULL, 1);
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES(16, 'quotation', NULL, NULL, NULL, 1);

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

INSERT INTO `print_setting` (`id`, `header`, `footer`) VALUES(1, 200, 100);

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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(1, 1, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(2, 2, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(3, 3, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(4, 121, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(5, 122, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(6, 4, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(7, 5, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(8, 10, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(9, 11, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(10, 12, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(11, 13, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(12, 14, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(13, 15, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(14, 16, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(15, 17, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(16, 18, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(17, 21, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(18, 22, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(19, 23, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(20, 24, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(21, 25, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(22, 26, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(23, 27, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(24, 28, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(25, 29, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(26, 30, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(27, 31, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(28, 32, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(29, 33, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(30, 34, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(31, 35, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(32, 36, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(33, 37, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(34, 38, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(35, 39, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(36, 40, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(37, 41, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(38, 42, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(39, 43, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(40, 44, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(41, 45, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(42, 46, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(43, 47, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(44, 48, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(45, 49, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(46, 50, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(47, 51, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(48, 52, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(49, 53, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(50, 54, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(51, 55, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(52, 56, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(53, 57, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(54, 58, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(55, 60, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(56, 123, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(57, 125, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(58, 126, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(59, 127, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(60, 128, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(61, 129, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(62, 130, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(63, 131, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(64, 132, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(65, 133, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(66, 134, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(67, 135, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(68, 136, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(69, 137, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(70, 138, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(71, 139, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(72, 140, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(73, 61, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(74, 62, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(75, 65, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(76, 124, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(77, 70, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(78, 71, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(79, 72, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(80, 73, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(81, 74, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(82, 75, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(83, 76, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(84, 84, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(85, 85, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(86, 86, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(87, 87, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(88, 88, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(89, 89, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(90, 90, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(91, 91, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(92, 92, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(93, 93, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(94, 94, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(95, 95, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(96, 96, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(97, 141, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(98, 142, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(99, 143, 1, 1, 1, 1, 1);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(100, 97, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(101, 98, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(102, 99, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(103, 100, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(104, 102, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(105, 103, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(106, 104, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(107, 105, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(108, 106, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(109, 107, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(110, 108, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(111, 109, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(112, 110, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(113, 111, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(114, 112, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(115, 113, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(116, 114, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(117, 115, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(118, 116, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(119, 117, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(120, 118, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(121, 119, 1, 0, 0, 0, 0);
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES(122, 120, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `salary_setup_header`
--

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
  `emp_sal_type` varchar(50) DEFAULT NULL,
  `default_amount` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sec_role`
--

INSERT INTO `sec_role` (`id`, `type`) VALUES(1, 'test');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sec_userrole`
--

INSERT INTO `sec_userrole` (`id`, `user_id`, `roleid`, `createby`, `createdate`) VALUES(1, '615419', 1, '1', '2022-06-16 03:49:43');

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

INSERT INTO `seles_termscondi` (`id`, `description`, `status`) VALUES(5, 'Goods purchased without the original invoice are not to be returned or exchanged', 1);

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

INSERT INTO `sms_settings` (`id`, `api_key`, `api_secret`, `from`, `isinvoice`, `isservice`, `isreceive`) VALUES(1, '5d6db102011', '456452dfgdf', '8801645452', 0, 0, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_module`
--

INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(1, 1, 'new_invoice', NULL, NULL, 'new_invoice', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(2, 1, 'manage_invoice', NULL, NULL, 'manage_invoice', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(3, 1, 'pos_invoice', NULL, NULL, 'gui_pos', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(4, 2, 'add_customer', NULL, NULL, 'add_customer', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(5, 2, 'manage_customer', NULL, NULL, 'manage_customer', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(6, 0, 'credit_customer', NULL, NULL, 'credit_customer', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(7, 0, 'paid_customer', NULL, NULL, 'paid_customer', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(8, 0, 'customer_ledger', NULL, NULL, 'customer_ledger', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(9, 0, 'customer_advance', NULL, NULL, 'customer_advance', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(10, 3, 'category', NULL, NULL, 'category', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(11, 3, 'manage_category', NULL, NULL, 'manage_category', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(12, 3, 'unit', NULL, NULL, 'unit', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(13, 3, 'manage_unit', NULL, NULL, 'manage_unit', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(14, 3, 'add_product', NULL, NULL, 'create_product', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(15, 3, 'import_product_csv', NULL, NULL, 'add_product_csv', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(16, 3, 'manage_product', NULL, NULL, 'manage_product', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(17, 4, 'add_supplier', NULL, NULL, 'add_supplier', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(18, 4, 'manage_supplier', NULL, NULL, 'manage_supplier', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(19, 0, 'supplier_ledger', NULL, NULL, 'supplier_ledger_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(20, 0, 'supplier_advance', NULL, NULL, 'supplier_advance', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(21, 5, 'add_purchase', NULL, NULL, 'add_purchase', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(22, 5, 'manage_purchase', NULL, NULL, 'manage_purchase', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(23, 6, 'stock_report', NULL, NULL, 'stock_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(24, 7, 'return', NULL, NULL, 'add_return', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(25, 7, 'stock_return_list', NULL, NULL, 'return_list', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(26, 7, 'supplier_return_list', NULL, NULL, 'supplier_return_list', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(27, 7, 'wastage_return_list', NULL, NULL, 'wastage_return_list', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(28, 8, 'closing', NULL, NULL, 'add_closing', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(29, 8, 'closing_report', NULL, NULL, 'closing_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(30, 8, 'todays_report', NULL, NULL, 'all_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(31, 8, 'todays_customer_receipt', NULL, NULL, 'todays_customer_receipt', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(32, 8, 'sales_report', NULL, NULL, 'todays_sales_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(33, 8, 'due_report', NULL, NULL, 'due_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(34, 8, 'purchase_report', NULL, NULL, 'todays_purchase_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(35, 8, 'purchase_report_category_wise', NULL, NULL, 'purchase_report_category_wise', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(36, 8, 'sales_report_product_wise', NULL, NULL, 'product_sales_reports_date_wise', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(37, 8, 'sales_report_category_wise', NULL, NULL, 'sales_report_category_wise', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(38, 8, 'shipping_cost_report', NULL, NULL, 'shipping_cost_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(39, 8, 'user_wise_sales_report', NULL, NULL, 'user_wise_sales_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(40, 8, 'invoice_return', NULL, NULL, 'invoice_return', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(41, 8, 'supplier_return', NULL, NULL, 'supplier_return', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(42, 8, 'tax_report', NULL, NULL, 'tax_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(43, 8, 'profit_report', NULL, NULL, 'profit_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(44, 9, 'c_o_a', NULL, NULL, 'show_tree', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(45, 9, 'subaccount_list', NULL, NULL, 'subaccount_list', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(46, 9, 'predefined_accounts', NULL, NULL, 'predefined_accounts', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(47, 9, 'financial_year', NULL, NULL, 'financial_year', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(48, 9, 'opening_balance', NULL, NULL, 'opening_balance', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(49, 9, 'credit_voucher', NULL, NULL, 'credit_voucher', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(50, 9, 'voucher_approval', NULL, NULL, 'aprove_v', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(51, 9, 'contra_voucher', NULL, NULL, 'contra_voucher', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(52, 9, 'journal_voucher', NULL, NULL, 'journal_voucher', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(53, 9, 'report', NULL, NULL, 'ac_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(54, 9, 'cash_book', NULL, NULL, 'cash_book', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(55, 9, 'Inventory_ledger', NULL, NULL, 'inventory_ledger', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(56, 9, 'bank_book', NULL, NULL, 'bank_book', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(57, 9, 'general_ledger', NULL, NULL, 'general_ledger', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(58, 9, 'trial_balance', NULL, NULL, 'trial_balance', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(60, 9, 'coa_print', NULL, NULL, 'coa_print', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(61, 0, 'add_new_bank', NULL, NULL, 'add_bank', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(62, 0, 'manage_bank', NULL, NULL, 'bank_list', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(63, 0, 'bank_transaction', NULL, NULL, 'bank_transaction', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(64, 0, 'bank_ledger', NULL, NULL, 'bank_ledger', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(65, 11, 'tax_settings', NULL, NULL, 'tax_settings', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(66, 0, 'add_incometax', NULL, NULL, 'add_incometax', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(67, 0, 'manage_income_tax', NULL, NULL, 'manage_income_tax', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(68, 0, 'tax_report', NULL, NULL, 'tax_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(69, 0, 'invoice_wise_tax_report', NULL, NULL, 'invoice_wise_tax_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(70, 12, 'add_designation', NULL, NULL, 'add_designation', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(71, 12, 'manage_designation', NULL, NULL, 'manage_designation', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(72, 12, 'add_employee', NULL, NULL, 'add_employee', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(73, 12, 'manage_employee', NULL, NULL, 'manage_employee', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(74, 12, 'add_attendance', NULL, NULL, 'add_attendance', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(75, 12, 'manage_attendance', NULL, NULL, 'manage_attendance', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(76, 12, 'attendance_report', NULL, NULL, 'attendance_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(77, 0, 'add_benefits', NULL, NULL, 'add_benefits', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(78, 0, 'manage_benefits', NULL, NULL, 'manage_benefits', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(79, 0, 'add_salary_setup', NULL, NULL, 'add_salary_setup', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(80, 0, 'manage_salary_setup', NULL, NULL, 'manage_salary_setup', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(81, 0, 'salary_generate', NULL, NULL, 'salary_generate', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(82, 0, 'manage_salary_generate', NULL, NULL, 'manage_salary_generate', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(83, 0, 'salary_payment', NULL, NULL, 'salary_payment', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(84, 0, 'add_expense_item', NULL, NULL, 'add_expense_item', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(85, 0, 'manage_expense_item', NULL, NULL, 'manage_expense_item', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(86, 0, 'add_expense', NULL, NULL, 'add_expense', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(87, 0, 'manage_expense', NULL, NULL, 'manage_expense', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(88, 0, 'expense_statement', NULL, NULL, 'expense_statement', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(89, 0, 'add_person_officeloan', NULL, NULL, 'add1_person', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(90, 0, 'add_loan_officeloan', NULL, NULL, 'add_office_loan', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(91, 0, 'add_payment_officeloan', NULL, NULL, 'add_loan_payment', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(92, 0, 'manage_loan_officeloan', NULL, NULL, 'manage1_person', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(93, 0, 'add_person_personalloan', NULL, NULL, 'add_person', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(94, 0, 'add_loan_personalloan', NULL, NULL, 'add_loan', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(95, 0, 'add_payment_personalloan', NULL, NULL, 'add_payment', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(96, 0, 'manage_loan_personalloan', NULL, NULL, 'manage_person', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(97, 13, 'add_service', NULL, NULL, 'create_service', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(98, 13, 'manage_service', NULL, NULL, 'manage_service', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(99, 13, 'service_invoice', NULL, NULL, 'service_invoice', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(100, 13, 'manage_service_invoice', NULL, NULL, 'manage_service_invoice', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(102, 15, 'manage_company', NULL, NULL, 'manage_company', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(103, 15, 'add_user', NULL, NULL, 'add_user', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(104, 15, 'manage_users', NULL, NULL, 'manage_user', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(105, 15, 'language', NULL, NULL, 'add_language', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(106, 15, 'currency', NULL, NULL, 'add_currency', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(107, 15, 'setting', NULL, NULL, 'soft_setting', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(108, 15, 'print_setting', NULL, NULL, 'print_setting', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(109, 15, 'mail_setting', NULL, NULL, 'mail_setting', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(110, 15, 'add_role', NULL, NULL, 'add_role', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(111, 15, 'role_list', NULL, NULL, 'role_list', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(112, 15, 'user_assign_role', NULL, NULL, 'user_assign', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(113, 15, 'Permission', NULL, NULL, NULL, 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(114, 15, 'sms_configure', NULL, NULL, 'sms_configure', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(115, 15, 'backup_restore', NULL, NULL, 'back_up', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(116, 15, 'import', NULL, NULL, 'sql_import', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(117, 15, 'restore', NULL, NULL, 'restore', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(118, 16, 'add_quotation', NULL, NULL, 'add_quotation', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(119, 16, 'manage_quotation', NULL, NULL, 'manage_quotation', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(120, 16, 'add_to_invoice', NULL, NULL, 'add_to_invoice', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(121, 1, 'terms_list', NULL, NULL, 'terms_list', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(122, 1, 'terms_add', NULL, NULL, 'terms_add', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(123, 9, 'service_payment', NULL, NULL, 'service_payment', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(124, 11, 'vat_tax_setting', NULL, NULL, 'vat_tax_setting', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(125, 9, 'add_payment_method', NULL, NULL, 'add_payment_method', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(126, 9, 'payment_method_list', NULL, NULL, 'payment_method_list', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(127, 9, 'debit_voucher', NULL, NULL, 'debit_voucher', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(128, 9, 'bank_reconciliation', NULL, NULL, 'bank_reconciliation', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(129, 9, 'supplier_payment', NULL, NULL, 'supplier_payment', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(130, 9, 'customer_receive', NULL, NULL, 'customer_receive', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(131, 9, 'cash_adjustment', NULL, NULL, 'cash_adjustment', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(132, 9, 'day_book', NULL, NULL, 'day_book', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(133, 9, 'sub_ledger', NULL, NULL, 'sub_ledger', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(134, 9, 'income_statement_form', NULL, NULL, 'income_statement_form', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(135, 9, 'expenditure_statement', NULL, NULL, 'expenditure_statement', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(136, 9, 'profit_loss_report', NULL, NULL, 'profit_loss_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(137, 9, 'balance_sheet', NULL, NULL, 'balance_sheet', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(138, 9, 'fixedasset_schedule', NULL, NULL, 'fixedasset_schedule', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(139, 9, 'receipt_payment', NULL, NULL, 'receipt_payment', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(140, 9, 'bank_reconciliation_report', NULL, NULL, 'bank_reconciliation_report', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(141, 12, 'salary_advance_view', NULL, NULL, 'salary_advance_view', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(142, 12, 'employee_salary_generate', NULL, NULL, 'employee_salary_generate', 1);
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES(143, 12, 'employee_salary_payment_view', NULL, NULL, 'employee_salary_payment_view', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_collection`
--

INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(1, '2022-06-15', '3', '9812294451');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(2, '2022-06-15', '3', '8597516432');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(4, '2022-06-16', '3', 'serv-2');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(5, '2022-06-16', '3', 'serv-1');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(6, '2022-06-16', '3', 'serv-3');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(7, '2022-06-16', '3', 'serv-4');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(8, '2022-06-16', '3', '3849912183');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(9, '2022-06-16', '3', '3849912183');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(10, '2022-06-16', '3', '2783899932');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(11, '2022-06-16', '3', '2783899932');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(12, '2022-06-16', '3', '9322594831');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(13, '2022-06-16', '3', '9322594831');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(14, '2022-06-16', '3', 'serv-8');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(15, '2022-06-16', '3', 'serv-9');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(16, '2022-06-16', '3', 'serv-10');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(17, '2022-06-16', '3', 'serv-11');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(18, '2022-06-19', '3', '1454627645');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(19, '2022-06-19', '3', 'serv-1');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(20, '2022-06-19', '3', '9833289562');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(21, '2022-06-19', '3', '9833289562');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(22, '2022-06-19', '3', 'serv-3');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(23, '2022-06-19', '3', '4442989216');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(24, '2022-06-19', '3', '4442989216');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(25, '2022-06-20', '3', 'serv-5');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(26, '2022-07-06', '3', '1947578543');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(27, '2022-07-06', '3', '3236424893');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(28, '2022-07-06', '3', '6825311164');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(29, '2022-07-07', '3', 'serv-6');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(30, '2022-07-07', '3', '6193428598');
INSERT INTO `tax_collection` (`id`, `date`, `customer_id`, `relation_id`) VALUES(31, '2022-07-07', '3', '6193428598');

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

INSERT INTO `units` (`unit_id`, `unit_name`, `status`) VALUES(3, 'PCS', 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

INSERT INTO `vat_tax_setting` (`id`, `dynamic_tax`, `fixed_tax`) VALUES(1, 0, 1);

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
  `is_autoapprove_v` int(11) NOT NULL DEFAULT 0,
  `site_key` varchar(250) DEFAULT NULL,
  `secret_key` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT 1,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_setting`
--

INSERT INTO `web_setting` (`setting_id`, `logo`, `invoice_logo`, `favicon`, `currency`, `timezone`, `currency_position`, `footer_text`, `language`, `rtr`, `captcha`, `is_qr`, `is_autoapprove_v`, `site_key`, `secret_key`, `discount_type`) VALUES(1, 'assets/img/icons/2022-06-26/568bf5d2689adbd05f3663e267bb10c1.jpg', 'assets/img/icons/2022-06-26/9f2f4a609279632b61ef0723ce62ada0.jpg', 'assets/img/icons/2022-06-26/db5049cfd36483f0ac0614c88d820845.png', '$', 'Asia/Dhaka', '0', 'Developed by  Bdtask', 'english', '0', 1, 0, 1, '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', 1);
