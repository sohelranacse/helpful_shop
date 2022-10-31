<?php
defined('BASEPATH') OR exit('No direct script access allowed');



$route['add_purchase']         = "purchase/purchase/purchase_form";
$route['purchase_list']        = "purchase/purchase/purchase_list";
$route['purchase_details/(:num)'] = 'purchase/purchase/purchase_details/$1';
$route['purchase_edit/(:num)'] = 'purchase/purchase/purchase_edit_form/$1';

