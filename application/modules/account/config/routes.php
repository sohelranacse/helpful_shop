<?php

defined('BASEPATH') OR exit('No direct script access allowed');

$route['financial_year'] = "account/accounts/financial_year/";
$route['opening_balance'] = "account/accounts/opening_balance";
$route['show_tree'] = "account/accounts/show_tree";
$route['subaccount_list'] = "account/accounts/subaccount_list";
$route['predefined_accounts'] = "account/accounts/predefined_accounts";
$route['debit_voucher'] = "account/accounts/debit_voucher";
$route['create_debit_voucher'] = "account/accounts/create_debit_voucher";
$route['add_opening_balance'] = "account/accounts/add_opening_balance";
$route['edit_voucher/(:any)'] = "account/accounts/edit_voucher/$1";
$route['edit_opening_balance/(:any)'] = "account/accounts/edit_opening_balance/$1";
$route['credit_voucher'] = "account/accounts/credit_voucher";
$route['create_credit_voucher'] = "account/accounts/create_credit_voucher";
$route['contra_voucher'] = "account/accounts/contra_voucher";
$route['create_contra_voucher'] = "account/accounts/create_contra_voucher";
$route['journal_voucher'] = "account/accounts/journal_voucher";
$route['create_journal_voucher'] = "account/accounts/create_journal_voucher";
$route['bank_reconciliation'] = "account/accounts/bank_reconciliation";
$route['aprove_v'] = "account/accounts/aprove_v";
$route['add_payment_method']   = "account/accounts/bdtask_payment_method_form";
$route['add_payment_method/(:num)']   = "account/accounts/bdtask_payment_method_form/$1";
$route['payment_method_list']   = "account/accounts/payment_method_list";
$route['supplier_payment']= "account/accounts/bdtask_supplier_payment";
$route['supplier_payment_received/(:any)/(:any)/(:any)'] = 'account/accounts/supplier_paymentreceipt/$1/$1/$1';
$route['customer_payment_receipt/(:any)/(:any)/(:any)'] = 'account/accounts/customer_receipt/$1/$1/$1';
$route['customer_receive']= "account/accounts/customer_receive";
$route['service_payment']= "account/accounts/service_payment_view";
$route['cash_adjustment'] = "account/accounts/bdtask_cash_adjustment";

// reports
$route['cash_book']       = "account/accounts/cash_book";
$route['cash_book_report']= "account/accounts/cash_book_report";
$route['bank_book']       = "account/accounts/bank_book";
$route['bank_book_report']= "account/accounts/bank_book_report";
$route['day_book']       = "account/accounts/day_book";
$route['day_book_report'] = "account/accounts/day_book_report";
$route['general_ledger']= "account/accounts/general_ledger";
$route['accounts_report_search']= "account/accounts/accounts_report_search";
$route['sub_ledger']= "account/accounts/sub_ledger";
$route['sub_ledger_report']= "account/accounts/sub_ledger_report";
$route['trial_balance']= "account/accounts/trial_balance";
$route['trial_balance_report']= "account/accounts/trial_balance_report";
$route['income_statement_form']= "account/accounts/income_statement_form";
$route['income_statement']= "account/accounts/income_statement";
$route['expenditure_statement']= "account/accounts/expenditure_statement";
$route['expenditure_statement_report']= "account/accounts/expenditure_statement_report";
$route['profit_loss_report']= "account/accounts/profit_loss_report";
$route['profit_loss_report_search']= "account/accounts/profit_loss_report_search";
$route['balance_sheet']= "account/accounts/balance_sheet";
$route['fixedasset_schedule']= "account/accounts/fixedasset_schedule";
$route['fixed_assets_report']= "account/accounts/fixed_assets_report";
$route['receipt_payment']= "account/accounts/receipt_payment";
$route['receipt_payment_report']= "account/accounts/receipt_payment_report";
$route['bank_reconciliation_report']= "account/accounts/bank_reconciliation_report";
$route['coa_print']= "account/accounts/coa_print";