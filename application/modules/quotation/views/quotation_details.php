<?php
$user_type = $this->session->userdata('user_type');
$user_id = $this->session->userdata('id');

?>
<link href="<?php echo base_url('assets/custom/quotation.css') ?>" rel="stylesheet" type="text/css" />

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd">
            <div id="printableArea">
                <div class="panel-body print-font-size">
                    <div class="row marginleft5">
                        <div class="fl-left">
                            <div class="col-xs-4">
                                <img src="<?php
                                    if (isset($setting->invoice_logo)) {
                                        echo base_url().$setting->invoice_logo;
                                    }
                                    ?>" class="img-bottom-m print-logo invoice-img-position" alt="" >

                                <address class="margin-top10">
                                    <strong class=""><?php echo $company_info[0]['company_name']?></strong><br>
                                    <span class="comp-web"><?php echo $company_info[0]['address']?></span><br>
                                    <abbr class="font-bold"><?php echo display('mobile') ?>: </abbr>
                                    <?php echo $company_info[0]['mobile']?> <br>
                                    <abbr><b><?php echo display('email') ?>:</b></abbr>
                                    <?php echo $company_info[0]['email']?><br>
                                    <abbr><b><?php echo display('website') ?>:</b></abbr>
                                    <span class="comp-web"><?php echo $company_info[0]['website']?></span><br>
                                    <?php if (!empty($company_info[0]['vat_no'])) {?>
                                    <abbr class="font-bold"><?php echo display('vat_no') ?>: </abbr>
                                    <?php echo $company_info[0]['vat_no']?><br>
                                    <?php }?>
                                    <?php if (!empty($company_info[0]['cr_no'])) {?>
                                    <abbr class="font-bold"><?php echo display('cr_no') ?>: </abbr>
                                    <?php echo $company_info[0]['cr_no']?><br>
                                    <?php }?>
                            </div>
                            <div class="col-xs-4">
                            <?php $web_setting = $this->db->select("*")->from("web_setting")->get()->row();
                            if ($web_setting->is_qr == 1) { ?>
                            <div class="print-qr">
                                <?php  $text = base64_encode(display('quotation_no').': '.$quot_main[0]['quot_no'].' '.display('customer_name').': '. $customer_info[0]['customer_name']);
                                        ?>
                                <img src="http://chart.apis.google.com/chart?cht=qr&chs=250x250&chld=L|4&chl=<?php echo $text?>"
                                    alt="">
                            </div>
                            <?php } ?>
                            </div>
                            <div class="col-xs-4 text-left ">
                                <h1><?php echo display('quotation'); ?></h1>
                                <address>
                                <?php if ($customer_info[0]['customer_name']) { ?>
                                    <strong class=""><?php echo $customer_info[0]['customer_name']; ?>
                                    </strong><br>
                                    <?php } ?>
                                    <?php if ($customer_info[0]['customer_address']) { ?>
                                    <?php echo $customer_info[0]['customer_address']; ?>
                                    <br>
                                    <?php } ?>
                                    <?php if ($customer_info[0]['customer_mobile']) { ?>
                                    <abbr class="font-bold"><?php echo display('mobile') ?>: </abbr>
                                    <?php echo $customer_info[0]['customer_mobile']; ?><br> <?php } ?>

                                    <?php if ($customer_info[0]['customer_email']) { ?>
                                        <abbr class="font-bold"><?php echo display('email') ?>: </abbr>
                                    <?php echo $customer_info[0]['customer_email']; ?><br>
                                    <?php } ?>

                                    <abbr>
                                    <span class="font-bold"><?php echo display('quotation_date') ?>: </span>
                                        <?php echo $quot_main[0]['quotdate'] ?><br>
                                        <span class="font-bold"><?php echo display('expiry_date') ?>: </span>
                                        <?php echo $quot_main[0]['expire_date'] ?><br>
                                        <span class="font-bold"><?php echo display('quotation_no') ?>: </span>
                                        <?php echo $quot_main[0]['quot_no'] ?>
                                    </abbr>
                                    <br>
                                    <?php if (!empty($customer_info[0]['email_address'])) {?>
                                    <abbr class="font-bold"><?php echo display('vat_no') ?>: </abbr>
                                    <?php echo $customer_info[0]['email_address']; ?></b></abbr>
                                    <br>
                                    <?php } ?>
                                    <?php if (!empty($customer_info[0]['contact'])) {?>
                                    <abbr class="font-bold"><?php echo display('cr_no') ?>: </abbr>
                                    <?php echo $customer_info[0]['contact'];?>
                                    <?php } ?>
                                </address>
                            </div>
                        </div>
                    </div>


                    <?php
                            $amount = 0;
                    if (!empty($quot_product[0]['product_name'])) {
                        ?>
                    
                        <table class="table table-striped print-font-size">
                            <caption class="text-center">
                                <h2 class="title-text"><?php echo display('item_quotation') ?></h2>
                            </caption>
                            <thead>
                                <tr>
                                    <th width="8%" class="text-center"><?php echo display('sl') ?></th>
                                    <th width="22%" class="text-center"><?php echo display('item') ?></th>
                                    <th   class="text-center"><?php echo display('qty') ?></th>
                                    <th   class="text-right"><?php echo display('price') ?></th>
                                    <?php if ($discount_type == 1) { ?>
                                    <th   class="text-right"><?php echo display('discount_percentage') ?> %
                                    </th>
                                    <?php } elseif ($discount_type == 2) { ?>
                                    <th   class="text-right"><?php echo display('discount') ?> </th>
                                    <?php } elseif ($discount_type == 3) { ?>
                                    <th   class="text-right"><?php echo display('fixed_dis') ?> </th>
                                    <?php } ?>
                                    <th   class="text-right "><?php echo display('dis_val') ?> </th>
                                    <?php if(!empty( $quot_product[0]['vat_per'])){?>
                                    <th class="text-right "><?php echo display('vat').' %' ?> </th>
                                    <?php } ?>
                                    <?php if(!empty( $quot_product[0]['vat_amnt'])){?>
                                    <th   class="text-right "><?php echo display('vat_val') ?></th>
                                    <?php } ?>
                                    <th   class="text-right"><?php echo display('total') ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $sl = 1;
                                $amount = 0;
                                foreach ($quot_product as $item) {
                            
                                        ?>
                                <tr>
                                    <td class="text-center"><?php echo $sl ?></td>
                                    <td class="text-center">
                                    <span class="comp-web">  <?php echo $item['product_name'].' ('.$item['product_model'].')'; ?></span></td>
                                    <td  class="text-center comp-web"><?php echo $item['used_qty']; ?></td>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $rate = $item['rate'];
                                                                echo (($position == 0) ? "$currency $rate" : "$rate $currency");
                                                                ?>
                                    </td>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $itemdiscountper = $item['discount_per'];
                                                                echo (!empty($itemdiscountper)?$itemdiscountper:'0.00');
                                                                ?>
                                    </td>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $discount = $item['discount'];
                                                                echo (!empty($discount)?$discount:'');
                                                                ?>
                                    </td>
                                    <?php if(!empty( $item['vat_per'])){?>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $vat_per = $item['vat_per'];
                                                                echo (!empty($vat_per)?$vat_per:'');
                                                                ?>
                                    </td>
                                    <?php }?>
                                    <?php if(!empty( $item['vat_amnt'])){?>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $vat_amnt = $item['vat_amnt'];
                                                                echo (!empty($vat_amnt)?$vat_amnt:'');
                                                                ?>
                                    </td>
                                    <?php }?>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $amount += $item['total_price'];
                                                                $rate_total = $item['total_price'];
                                                                echo (($position == 0) ? "$currency $rate_total" : "$rate_total $currency");
                                                                ?>
                                    </td>
                                </tr>
                                <?php
                                                        $sl++;
                                                       
                                                    
                                                }
                                                ?>
                            </tbody>

                        </table>
                        <div class="row">
                            <div class="col-xs-6">
                                <p></p>
                            </div>
                            <div class="col-xs-6 inline-block">
                                
                                <table class="table print-font-size">
                                    <tr>
                                        <td colspan="8"><b><?php echo display('sub_total'); ?></b></td>
                                        <td  class="text-right"><b>
                                                <?php $amount = number_format($amount,2);
                                                                echo (($position == 0) ? "$currency $amount" : "$amount $currency");
                                                                ?>
                                            </b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" ><b><?php echo display('discounts'); ?></b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $ttldiscountamount = $quot_main[0]['item_total_dicount'];
                                                                echo (($position == 0) ? "$currency $ttldiscountamount" : "$ttldiscountamount $currency");
                                                                ?>
                                            </b></td>
                                    </tr>
                                    <?php if ($quot_main[0]['item_total_vat'] > 0) {?>
                                    <tr>
                                        <td colspan="8" ><b><?php echo display('ttl_val'); ?>
                                               </b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $item_total_vat = $quot_main[0]['item_total_vat'];
                                                                echo (($position == 0) ? "$currency $item_total_vat" : "$item_total_vat $currency");
                                                                ?>
                                            </b></td>
                                    </tr>
                                    <?php }?>
                                    <?php if (!empty($quot_main[0]['item_total_tax'])) {?>
                                    <tr>
                                        <td colspan="8"><b><?php echo display('total_tax'); ?></b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $itemtotaltax = $quot_main[0]['item_total_tax'];
                                                                echo (($position == 0) ? "$currency $itemtotaltax" : "$itemtotaltax $currency");
                                                                ?>
                                            </b></td>
                                    </tr>
                                    <?php }?>
                                    <tr>
                                        <td colspan="8" ><b><?php echo display('grand_total'); ?></b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $ttlamount = number_format($quot_main[0]['item_total_amount'], 2);
                                                                echo (($position == 0) ? "$currency $ttlamount" : "$ttlamount $currency");
                                                                ?>
                                            </b>
                                            <input type="hidden" name="" id="quotation_id"
                                                value="<?php echo $quot_main[0]['quotation_id'] ?>">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    
                    <?php } ?>

                    <!-- Service Part start -->
                    <?php
                                if (!empty($quot_service[0]['service_name'])) {
                                    ?>
                    
                        <table class="table table-striped print-font-size">
                            <caption class="text-center">
                                <h2 class="title-text"><?php echo display('service_quotation') ?> </h2>
                            </caption>
                            <thead>
                                <tr>
                                    <th width="8%" class="text-center"><?php echo display('sl') ?></th>
                                    <th width="22%" class="text-center"><?php echo display('service_name') ?></th>
                                    <th  class="text-center"><?php echo display('qty') ?></th>
                                    <th  class="text-right"><?php echo display('charge') ?></th>
                                    <?php if ($discount_type == 1) { ?>
                                    <th  class="text-right"><?php echo display('discount_percentage') ?> %
                                    </th>
                                    <?php } elseif ($discount_type == 2) { ?>
                                    <th  class="text-right"><?php echo display('discount') ?> </th>
                                    <?php } elseif ($discount_type == 3) { ?>
                                    <th  class="text-right"><?php echo display('fixed_dis') ?> </th>
                                    <?php } ?>
                                    <th class="text-right "><?php echo display('dis_val') ?> </th>
                                    <?php if(!empty( $quot_service[0]['vat_per'])){?>
                                        <th  class="text-right "><?php echo display('vat').' %' ?> </th>
                                        <?php } ?>
                                        <?php if(!empty( $quot_service[0]['vat_amnt'])){?>
                                            <th  class="text-right "><?php echo display('vat_val') ?> 
                                            <?php } ?>
                                            
                                      </th>
                                    <th  class="text-right"><?php echo display('total') ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $ssl = 1;
                                    $subtotalservice = 0;
                                    foreach ($quot_service as $service) {
                                
                                            ?>
                                <tr>
                                    <td class="text-center"><?php echo $ssl ?></td>
                                    <td class="text-center comp-web"><?php echo $service['service_name']; ?></td>
                                    <td class="text-center comp-web"><?php echo $service['qty']; ?></td>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $charge = $service['charge'];
                                                                echo (($position == 0) ? "$currency $charge" : "$charge $currency");
                                                                ?>
                                    </td>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $diper = $service['discount'];
                                                                echo (!empty($diper)?$diper:'');
                                                                ?>
                                    </td>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $discount_amount = $service['discount_amount'];
                                                                echo (!empty($discount_amount)?$discount_amount:'');
                                                                ?>
                                    </td>
                                    <?php if(!empty( $service['vat_per'])){?>
                                    
                                    <td class="text-right comp-web">
                                        <?php
                                                                $vat_per = $service['vat_per'];
                                                                echo (!empty($vat_per)?$vat_per:'');
                                                                ?>
                                    </td>
                                    <?php } ?>
                                    <?php if(!empty( $service['vat_amnt'])){?>
                                        <td class="text-right comp-web">
                                            <?php
                                                                $vat_amnt = $service['vat_amnt'];
                                                                echo (!empty($vat_amnt)?$vat_amnt:'');
                                                                ?>
                                    </td>
                                    <?php } ?>
                                    <td class="text-right comp-web">
                                        <?php
                                                                $subtotalservice += $service['total'];
                                                                $totalcharge = $service['total'];
                                                                echo (($position == 0) ? "$currency $totalcharge" : "$totalcharge $currency");
                                                                ?>
                                    </td>
                                </tr>
                                <?php
                                                        $ssl++;
                                                       
                                                    
                                                }
                                                ?>
                            </tbody>
                            
                        </table>
                        <div class="row">
                            <div class="col-xs-6">
                                <p></p>
                            </div>
                            <div class="col-xs-6 inline-block">
                                <table class="table print-font-size">
                                    <tr>
                                        <td colspan="8" ><b><?php echo display('sub_total'); ?>
                                               </b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $subtotalservice = number_format($subtotalservice,2);
                                                                echo (($position == 0) ? "$currency $subtotalservice" : "$subtotalservice $currency");
                                                                ?>
                                            </b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" ><b><?php echo display('discounts') ?> </b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $servicediscount = $quot_main[0]['service_total_discount'];
                                                                echo (($position == 0) ? "$currency $servicediscount" : "$servicediscount $currency");
                                                                ?>
                                            </b></td>
                                    </tr>
                                    <?php if ($quot_main[0]['service_total_vat'] > 0) {?>
                                    <tr>
                                        <td colspan="8" ><b><?php echo display('ttl_val'); ?>
                                                </b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $service_total_vat = $quot_main[0]['service_total_vat'];
                                                                echo (($position == 0) ? "$currency $service_total_vat" : "$service_total_vat $currency");
                                                                ?>
                                            </b></td>
                                    </tr>
                                    <?php }?>
                                    <?php if (!empty($quot_main[0]['service_total_tax'])) {?>
                                    <tr>
                                        <td colspan="8" ><b><?php echo display('total_tax') ?></b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $servicetotaltax = $quot_main[0]['service_total_tax'];
                                                                echo (($position == 0) ? "$currency $servicetotaltax" : "$servicetotaltax $currency");
                                                                ?>
                                            </b></td>
                                    </tr>
                                    <?php }?>
                                    <tr>
                                        <td colspan="8"><b><?php echo display('grand_total'); ?> </b></td>
                                        <td class="text-right"><b>
                                                <?php
                                                                $servicetotalamount = number_format($quot_main[0]['service_total_amount'], 2);
                                                                echo (($position == 0) ? "$currency $servicetotalamount" : "$servicetotalamount $currency");
                                                                ?>
                                            </b>

                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>
                    
                    <?php } ?>
                    <div class="row">

                        <div class="table-responsive m-b-20">
                            <table class="table table-stripped print-font-size">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th colspan="24" class="text-right"><?php echo display('net_total') ?> :</th>
                                        <th class="text-right"><?php $nettotal = (!empty($quot_main[0]['item_total_amount'])?$quot_main[0]['item_total_amount']:0)+(!empty($quot_main[0]['service_total_amount'])?$quot_main[0]['service_total_amount']:0);
                                               $ntotal =  number_format($nettotal,2);
                                                  echo (($position == 0) ? "$currency $ntotal" : "$ntotal $currency");
                                                ?> </th>
                                    </tr>

                                </tbody>

                            </table>
                        </div>


                            <div class="row ">
                                <div class="desc-div">
                                    <strong><?php echo display('quot_description') ?> :</strong>
                                    <?php echo $quot_main[0]['quot_description'] ?>
                                </div>
                            </div>

                    </div>
                </div>
            </div>


            <div class="panel-footer text-left">
                <a class="btn btn-danger"
                    href="<?php echo base_url('Cquotation/manage_quotation'); ?>"><?php echo display('cancel') ?></a>
                <button class="btn btn-info" onclick="printDivnew('printableArea')"><span
                        class="fa fa-print"></span></button>

            </div>



        </div>
    </div>
</div>