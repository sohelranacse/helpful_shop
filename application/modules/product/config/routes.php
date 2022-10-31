<?php
defined('BASEPATH') OR exit('No direct script access allowed');



$route['category_form']        = "product/product/category_form";
$route['category_form/(:num)'] = 'product/product/category_form/$1';
$route['category_list']        = "product/product/category_list";

$route['unit_form']            = "product/product/unit_form";
$route['unit_form/(:num)']     = 'product/product/unit_form/$1';
$route['unit_list']            = "product/product/unit_list";

$route['product_form']         = "product/product/product_form";
$route['product_form/(:any)']  = "product/product/product_form/$1";
$route['product_list']         = "product/product/product_list";
$route['barcode/(:any)']       = "product/product/barcode_print/$1";
$route['qrcode/(:any)']        = "product/product/qrgenerator/$1";
$route['bulk_products']        = "product/product/csv_product";
$route['product_details/(:any)']= "product/product/product_details/$1";

$route['writer'] = "product/product/writer";
$route['writer/(:num)'] = "product/product/writer/$1";

$route['publication'] = "product/product/publication";
$route['publication/(:num)'] = "product/product/publication/$1";