<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-bd">
            <div id="printableArea">
                <div class="panel-body print-font-size">
                    <div class="row print_header">

                        <div class="col-xs-4">

                            <img src="<?php
                                    if (isset($setting->invoice_logo)) {
                                        echo base_url().$setting->invoice_logo;
                                    }
                                    ?>" class="img-bottom-m print-logo invoice-img-position" alt="">
                            <br>
                            <span
                                class="label label-success-outline m-r-15 p-10"><?php echo display('billing_from') ?></span>
                            <address class="margin-top10">
                                <strong class=""><?php echo $company_info[0]['company_name']?></strong><br>
                                <span class="comp-web"><?php echo $company_info[0]['address']?></span><br>
                                <abbr class="font-bold"><?php echo display('mobile') ?>: </abbr>
                                <?php echo $company_info[0]['mobile']?>
                                <br>
                                <abbr><b><?php echo display('email') ?>:</b></abbr>
                                <?php echo $company_info[0]['email']?><br>
                                <abbr><b><?php echo display('website') ?>:</b></abbr>
                                <span class="comp-web"><?php echo $company_info[0]['website']?></span><br>
                                <?php if (!empty($company_info[0]['vat_no'])) {?>
                                <abbr class="font-bold"><?php echo display('vat_no') ?>: </abbr>
                                <?php echo $company_info[0]['vat_no']?><br>
                                <?php } ?>
                                <?php if (!empty($company_info[0]['cr_no'])) {?>
                                <abbr class="font-bold"><?php echo display('cr_no') ?>: </abbr>
                                <?php echo $company_info[0]['cr_no']?><br>
                                <?php } ?>

                            </address>



                        </div>
                        <div class="col-xs-4">
                            <?php $web_setting = $this->db->select("*")->from("web_setting")->get()->row();
                            if ($web_setting->is_qr == 1) { ?>
                            <div class="print-qr">
                                <?php  $text = base64_encode(display('invoice_no').': '.$invoice_id.' '.display('customer_name').': '. $customer_name);
                                        ?>
                                <img src="http://chart.apis.google.com/chart?cht=qr&chs=250x250&chld=L|4&chl=<?php echo $text?>"
                                    alt="">
                            </div>
                            <?php } ?>
                        </div>
                        <div class="col-xs-4 text-left ">
                            <h2 class="m-t-0 test-class"><?php echo display('service_invoice') ?></h2>
                            <div>
                                <abbr class="font-bold">
                                    <?php echo display('invoice_no') ?>:
                                </abbr>
                                <?php echo $invoice_id?>
                            </div>
                            <div class="m-b-15">
                                <abbr class="font-bold"><?php echo display('date') ?>:
                                </abbr><?php echo $final_date?>
                                <?php $create_at = $this->db->select('CreateDate')->from('acc_vaucher')->where('referenceNo',$invoice_id)->get()->row();?>
                                <div class="m-b-15">
                                    <abbr class="font-bold"><?php echo display('invoice_time') ?>: </abbr>
                                    <?php echo date("H:i:s",strtotime($create_at->CreateDate));?>
                                </div>

                                <span
                                    class="label label-success-outline m-r-15"><?php echo display('billing_to') ?></span>

                                <address style="margin-top: 10px;" class="">
                                    <strong class=""><?php echo $customer_name?> </strong><br>
                                    <?php if ($customer_address) { ?>
                                    <?php echo $customer_address?>
                                    <br>
                                    <?php } ?>

                                    <?php if ($customer_mobile) { ?>
                                    <abbr class="font-bold"><?php echo display('mobile') ?>: </abbr>
                                    <?php echo $customer_mobile?>
                                    <br>
                                    <?php }?>
                                    <?php if (!empty($customer_info->email_address)) { ?>
                                    <abbr class="font-bold"><?php echo display('vat_no') ?>: </abbr>
                                    <?php echo $customer_info->email_address?>
                                    <br>
                                    <?php }?>
                                    <?php if (!empty($customer_info->contact)) { ?>
                                    <abbr class="font-bold"><?php echo display('cr_no') ?>: </abbr>
                                    <?php echo $customer_info->contact?>
                                    <?php }?>


                                </address>
                            </div>

                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped print-font-size">
                            <thead>
                                <tr>
                                    <th width="8%" class="text-center"><?php echo display('sl') ?>
                                    </th>
                                    <th width="22%" class="text-center"><?php echo display('service_name') ?></th>

                                    <th class="text-right"><?php echo display('quantity') ?></th>
                                    <th class="text-right"><?php echo display('charge') ?></th>

                                    <?php if ($discount_type == 1) { ?>
                                    <th class="text-right">
                                        <?php echo display('discount_percentage') ?> %</th>
                                    <?php } elseif ($discount_type == 2) { ?>
                                    <th class="text-right"><?php echo display('discount') ?>
                                    </th>
                                    <?php } elseif ($discount_type == 3) { ?>
                                    <th class="text-right"><?php echo display('fixed_dis') ?>
                                    </th>
                                    <?php } ?>

                                    <th class="text-right "><?php echo display('dis_val') ?>
                                    </th>
                                    <?php if($invoice_detail[0]['vat'] > 0){ ?>
                                    <th class="text-right "><?php echo display('vat').' %';?>
                                        <?php  } ?></th>
                                    <?php if($invoice_detail[0]['vat_amnt'] > 0){ ?>
                                    <th class="text-right "><?php echo display('vat_val');?>
                                        <?php  } ?></th>
                                    <th class="text-right"><?php echo display('total_amount') ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $itemprice = 0;
                                foreach($invoice_detail as $details){?>
                                <tr>
                                    <td class="text-center"><?php echo $details['sl']?></td>
                                    <td class="text-center">
                                        <div><span class="comp-web"><?php echo $details['service_name']?></span></div>
                                    </td>
                                    <td align="right" class="comp-web"><?php echo $details['qty']?></td>
                                    <td align="right" class="comp-web">
                                        <?php echo (($position == 0) ? $currency.' '.$details['charge']: $details['charge'].' '.$currency);
                                        $itemprice += $details['charge'] * $details['qty'];
                                        ?>
                                    </td>

                                    <?php if ($discount_type == 1) { ?>
                                    <td class="comp-web" align="right"><?php echo $details['discount']?></td>
                                    <?php } else { ?>
                                    <td align="right">
                                        <?php echo (($position == 0) ? $currency.' '.$details['discount'] : $details['discount'].' '.$currency) ?>
                                    </td>
                                    <?php } ?>

                                    <td class="comp-web" align="right">
                                        <?php echo (($position == 0) ? $currency.' '.$details['discount_amount']: $details['discount_amount'].' '.$currency) ?>
                                    </td>
                                    <?php if ($details['vat'] > 0) {?>
                                    <td class="comp-web" align="right"> <?php echo (($position == 0) ? $details['vat']: $details['vat']) ?></td>
                                    <?php }?>
                                    
                                    <?php if ($details['vat_amnt'] > 0) {?>
                                        <td class="comp-web" align="right">
                                            <?php 
                                        if(!empty($details['vat_amnt'])){
                                            $curicon = $currency;
                                        }else{
                                            $curicon = '';
                                        }
                                        echo (($position == 0) ? $curicon.' '.$details['vat_amnt']: $details['vat_amnt'].' '.$curicon) ?>
                                    </td>
                                    <?php }?>

                                    <td class="comp-web" align="right">
                                        <?php echo (($position == 0) ? $currency.' '.$details['total']: $details['total'].' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php }?>
                                <tr>
                                    <td class="text-right" colspan="2"><b><?php echo display('sub_total') ?>:</b></td>

                                    <td align="right"><b><?php echo $subTotal_quantity?></b></td>

                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td align="right" colspan="3">
                                        <b><?php echo (($position == 0) ? $currency.' '.$subTotal_ammount: $subTotal_ammount.' '.$currency) ?></b>
                                    </td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                    <div class="row">

                        <div class="col-xs-6 ">

                            <p></p>
                            <p><strong><?php echo $invoice_detail[0]['details']?></strong></p>

                        </div>
                        <div class="col-xs-6 inline-block">

                            <table class="table print-font-size">
                                <?php
                                   $price_bef_dis = (($subTotal_amount_cal?$subTotal_amount_cal:0) + ($total_discount_cal?$total_discount_cal:0));
                                        if ($invoice_detail[0]['total_discount'] != 0) {
                                            ?>
                                <tr>
                                    <th><?php echo 'Total Price Before Discount' ?> :</th>
                                    <td class="text-right">
                                        <?php 
                                        
                                        echo (($position == 0) ? $currency.' '.$itemprice : $itemprice.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php }?>
                                <?php
                                        if ($invoice_detail[0]['total_discount'] != 0) {
                                            ?>
                                <tr>
                                    <th><?php echo display('dis_val') ?> :</th>
                                    <td class="text-right">
                                        <?php echo (($position == 0) ? $currency.' '.$total_discount : $total_discount.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php }?>
                                <tr>
                                    <th><?php echo 'Total Price After Discount' ?> :</th>
                                    <td class="text-right">
                                        <?php
                                          
                                         echo (($position == 0) ? $currency.' '.($itemprice - ($total_discount_cal?$total_discount_cal:0)) : ($itemprice - ($total_discount_cal?$total_discount_cal:0)).' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php
                                        
                                        if ($invoice_detail[0]['total_vat_amnt'] != 0) {
                                            ?>
                                <tr>
                                    <th><?php echo display('vat_val') ?> : </th>
                                    <td class="text-right">
                                        <?php echo (($position == 0) ? $currency.' '.$total_vat_amnt : $total_vat_amnt.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php
                                        }
                                        if ($invoice_detail[0]['total_tax'] != 0) {
                                            ?>
                                <tr>
                                    <th class="text-left"><?php echo display('tax') ?> : </th>
                                    <td class="text-right">
                                        <?php echo (($position == 0) ? $currency.' '.$total_tax : $total_tax.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php } ?>
                                <?php if ($invoice_detail[0]['shipping_cost'] != 0) {
                                            ?>
                                <tr>
                                    <th class="text-left"><?php echo 'Shipping Cost' ?> : </th>
                                    <td class="text-right">
                                        <?php echo (($position == 0) ? $currency.' '.$shipping_cost :  $shipping_cost.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php } ?>
                                <tr>
                                    <th class="text-left grand_total"><?php echo display('grand_total') ?> :</th>
                                    <td class="text-right grand_total">
                                        <?php echo (($position == 0) ? $currency.' '.$total_amount : $total_amount.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php if($previous > 0){?>
                                <tr>
                                    <th class="text-left grand_total"><?php echo display('previous'); ?> :</th>
                                    <td class="text-right grand_total">
                                        <?php echo (($position == 0) ? $currency.' '.$previous : $previous.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php }?>



                                <tr>
                                    <th class="text-left grand_total"><?php echo display('paid_ammount') ?> : </th>
                                    <td class="text-right grand_total">
                                        <?php echo (($position == 0) ? $currency.' '.$paid_amount : $paid_amount.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php
                                        if ($invoice_detail[0]['due_amount'] != 0) {
                                            ?>
                                <tr>
                                    <th class="text-left grand_total"><?php echo display('due') ?> : </th>
                                    <td class="text-right grand_total">
                                        <?php echo (($position == 0) ? $currency.' '.$due_amount : $due_amount.' '.$currency) ?>
                                    </td>
                                </tr>
                                <?php
                                        }
                                        ?>
                            </table>



                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="inv-footer-left">
                                <?php echo display('received_by') ?>
                            </div>
                        </div>
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">
                            <div class="inv-footer-right">
                                <?php echo display('authorised_by') ?>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="panel-footer text-left">
                <a class="btn btn-danger"
                    href="<?php echo base_url('add_service'); ?>"><?php echo display('cancel') ?></a>

                <button class="btn btn-info" onclick="printDivnew('printableArea')"><span
                        class="fa fa-print"></span></button>

            </div>
        </div>
    </div>
</div>