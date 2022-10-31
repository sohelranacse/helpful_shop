<div class="row">
    <div class="col-sm-12">
        <?php if($this->permission1->method('add_purchase','create')->access()){ ?>
        <a href="<?php echo base_url('add_purchase')?>" class="btn btn-success m-b-5 m-r-2"><i class="ti-plus"> </i>
            <?php echo display('add_purchase')?> </a>
        <?php }?>
        <?php if($this->permission1->method('manage_supplier','read')->access()){ ?>
        <a href="<?php echo base_url('purchase_list')?>" class="btn btn-info m-b-5 m-r-2"><i class="ti-align-justify">
            </i> <?php echo display('manage_purchase')?> </a>
        <?php }?>


    </div>
</div>


<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <span><?php echo display('purchase_details') ?></span>
                    <span class="print-button">
                        <button class="btn btn-info " onclick="printDivnew('printableArea')"><span
                                class="fa fa-print"></span></button></span>
                </div>
            </div>
            <div class="panel-body " id="printableArea">

                <div class="row print-font-size purchasedetails-header">

                    <div class="col-xs-4 ">
                        <?php foreach($company_info as $cominfo){?>
                        <img src="<?php
                                    if (isset($setting->invoice_logo)) {
                                        echo base_url().$setting->invoice_logo;
                                    }
                                    ?>" class="img-bottom-m print-logo invoice-img-position" alt="" >
                        <br> 
                        <br> 

                        <span
                            class="label label-success-outline m-r-15 p-10"><?php echo display('billing_from') ?></span>
                        <address class="margin-top10">
                            <strong class=""><?php echo $cominfo['company_name']?></strong><br>
                            <span class="comp-web"><?php echo $cominfo['address']?></span><br>
                            <abbr class="font-bold"><?php echo display('mobile') ?>: </abbr>
                            <?php echo $cominfo['mobile']?> <br>

                            <abbr class="font-bold"><?php echo display('email') ?>:</abbr>
                            <?php echo $cominfo['email']?> <br>
                            <abbr class="font-bold"><?php echo display('website') ?>:</abbr>
                            <span class="comp-web"><?php echo $cominfo['website']?></span><br>
                            <?php if (!empty($cominfo['vat_no'])) {?>
                            <abbr class="font-bold"><?php echo display('vat_no') ?>: </abbr>   
                            <?php echo $cominfo['vat_no']?> <br>
                            <?php }?>
                            <?php if (!empty($cominfo['cr_no'])) {?>
                            <abbr class="font-bold"><?php echo display('cr_no') ?>: </abbr>
                            <?php echo $cominfo['cr_no']?><br>
                            <?php }?>
                            <?php }?>
                            
                        </address>
                        
                        
                        
                    </div>
                    <div class="col-xs-4 print-qr">
                        <?php $web_setting = $this->db->select("*")->from("web_setting")->get()->row();
                            if ($web_setting->is_qr == 1) { ?>
                        <?php  $text = base64_encode(display('invoice_no').': '.$purchase_id.' '.display('customer_name').': '. $supplier_name);
                                        ?>
                        <img src="http://chart.apis.google.com/chart?cht=qr&chs=250x250&chld=L|4&chl=<?php echo $text?>"
                        alt="">
                        <?php }?>
                    </div>
                    <div class="col-xs-4 text-left ">
                        <h2 class="m-t-0"><?php echo display('purchase') ?></h2>
                        <div>
                            <abbr class="font-bold">
                                <?php echo display('chalan_no') ?>: 
                            </abbr>
                            <?php echo $chalan_no;?>
                        </div>
                        <div>
                            <abbr class="font-bold">
                                <?php echo display('invoice_no') ?>: 
                            </abbr>
                            <?php echo $purchase_all_data[0]['purchase_id'];?>
                        </div>
                        <div class="m-b-15">
                        <abbr class="font-bold"><?php echo display('billing_date') ?>: </abbr>
                        <?php echo $final_date;?>
                        <br>
                            <abbr class="font-bold"><?php echo display('order_time') ?>: </abbr>
                            <?php echo date("H:i:s",strtotime($order_time));?></div>
                        <span class="label label-success-outline m-r-15"><?php echo display('billing_to') ?></span>
                        <address style="margin-top: 10px;" class="">
                                <strong class=""><?php echo $supplier_name?> </strong><br>
                                <?php if ($address) { ?>
                                <?php echo $address;?>
                                <br>
                                <?php } ?>
                                <?php if ($mobile) { ?>
                                <abbr class="font-bold"><?php echo display('mobile') ?>: </abbr>
                                <?php echo $mobile;?>
                                <br>
                                <?php } ?>
                                <?php if (!empty($vat_no)) {?>
                                <abbr class="font-bold"><?php echo display('vat_no') ?>: </abbr>
                                <?php echo $vat_no?>
                                <br>
                                <?php } ?>
                                
                            </address>
                        
                    </div>
                </div>
                
                    <table class="table table-striped print-font-size">
                    
                        <thead>
                            <tr>
                                <th width="8%" class="text-center"><?php echo display('sl') ?></th>
                                <th width="20%" class="text-center"><?php echo display('product_name') ?></th>
                                <th width="10%" class="text-right"><?php echo display('quantity') ?></th>
                                <th width="10%" class="text-right"><?php echo display('rate') ?></th>
                                <th width="10%" class="text-right"><?php echo display('discount_percentage') .'%'?></th>
                                <th width="10%" class="text-right"><?php echo display('dis_val') ?> </th>
                                <th width="10%" class="text-right"><?php echo display('vat').' %' ?> </th>
                                <th width="10%" class="text-right"><?php echo display('vat_val') ?> </th>
                                <th width="10%" class="text-right"><?php echo display('total_ammount') ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                        if ($purchase_all_data) {
                                    ?>
                            <?php foreach($purchase_all_data as $details){?>
                            <tr>
                                <td class="text-center"><?php echo $details['sl']?></td>
                                <td class="comp-web text-center">
    
                                    <?php echo $details['product_name']; ?>
    
                                </td>
                                <td class="text-right comp-web"><?php echo $details['quantity']?></td>
                                <td class="text-right comp-web">
                                    <?php echo (($position==0)?$currency.' '.$details['rate']:$details['rate'].' '.$currency) ?>
                                </td>
                                <td class="text-right comp-web">
                                    <?php echo (($position==0)?$details['discount']:$details['discount']) ?></td>
                                <td class="text-right comp-web">
                                    <?php echo (($position==0)?$currency.' '.$details['discount_amnt']:$details['discount_amnt'].' '.$currency) ?>
                                </td>
                                <td class="text-right comp-web">
                                    <?php echo (($position==0)?$details['vat_amnt_per']:$details['vat_amnt_per']) ?>
                                </td>
                                <td class="text-right comp-web">
                                    <?php echo (($position==0)?$currency.' '.$details['vat_amnt']:$details['vat_amnt'].' '.$currency) ?>
                                </td>
                                <td class="text-right comp-web">
                                    <?php echo (($position==0)?$currency.' '.$details['total_amount']:$details['total_amount'].' '.$currency) ?>
                                </td>
                            </tr>
    
                            <?php
                                }}
                                    ?>
                        </tbody>
                    </table>
                    

                    <div class="row">
                        <div class="col-xs-6 ">

                            <p></p>
                            

                        </div>
                        <div class="col-xs-6 ">
                            <table class="table print-font-size">
                                <tr>
                                    <td class="" colspan="8"><b><?php echo display('total') ?>:</td>
                                    <td class="text-right">
                                        <b><?php echo (($position==0)?$currency.' '.$total:$total.' '.$currency) ?></b>
                                    </td>
                                </tr>
                                <?php if($ttl_val > 0){?>
                                <tr>
                                    <td class="" colspan="8"><b><?php echo display('ttl_val') ?>:</b></td>
                                    <td class="text-right">
                                        <b><?php echo (($position==0)?$currency.' '.$ttl_val:$ttl_val.' '.$currency) ?></b>
                                    </td>
                                </tr>
                                <?php }?>
                                <?php if($discount > 0){?>
                                <tr>
                                    <td class="" colspan="8"><b><?php echo display('purchase_discount') ?>:
                                    </td>
                                    <td class="text-right">
                                        <b><?php echo (($position==0)?$currency.' '.$discount:$discount.' '.$currency) ?></b>
                                    </td>
                                </tr>
                                <?php }?>
                                <?php if($invoice_discount > 0){?>
                                <tr>
                                    <td class="" colspan="8"><b><?php echo display('total_discount') ?>:</b></td>
                                    <td class="text-right">
                                        <b><?php echo (($position==0)?$currency.' '.$invoice_discount:$invoice_discount.' '.$currency) ?></b>
                                    </td>
                                </tr>
                                <?php }?>
                                <tr>
                                    <td class="" colspan="8"><b><?php echo display('grand_total') ?>:</b></td>
                                    <td class="text-right">
                                        <b><?php echo (($position==0)?$currency.' '.$sub_total_amount:$sub_total_amount.' '. $currency) ?></b>
                                    </td>
                                </tr>
                                <?php if($paid_amount > 0){?>
                                <tr>
                                    <td class="" colspan="8"><b><?php echo display('paid_amount') ?>:</b></td>
                                    <td class="text-right">
                                        <b><?php echo (($position==0)?$currency.' '.$paid_amount:$paid_amount.' '.$currency) ?></b>
                                    </td>
                                </tr>
                                <?php }?>
                                <?php if($due_amount > 0){?>
                                <tr>
                                    <td class="" colspan="8"><b><?php echo display('due_amount') ?>:</b></td>
                                    <td class="text-right">
                                        <b><?php echo (($position==0)?$currency.' '.$due_amount:$due_amount.' '. $currency) ?></b>
                                    </td>
                                </tr>
                                <?php }?>
                            </table>
                           

                        </div>
                    </div>
               
            </div>

           


        </div>
    </div>
</div>
</div>