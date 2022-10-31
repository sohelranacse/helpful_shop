<link
    href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap"
    rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@0,400;0,700;1,400;1,700&display=swap"
    rel="stylesheet">
<style>
*,
::after,
::before {
    box-sizing: border-box;
}

body {
    padding: 0;
    font-family: Lato, "Helvetica Neue", Arial, Helvetica, sans-serif;
}
</style>


<div class="row">
    <div class="col-sm-5">
        <div class="panel panel-bd">
            <div id="printableArea">
                <div class="panel-body">
                    <div class="invoice-wrap"
                        style="max-width:272.12598425px;background:#fff;margin-right:auto;margin-left:auto;font-size:14px;color:#5b5b5b">
                        <div style="text-align: center; margin-bottom: 10px;">
                            <div style="border: 1px solid #000;font-weight: 700;font-size: 17px;color: #000;">
                                <?php echo $company_info[0]['company_name']?></div>
                        </div>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"
                            style="color: #000;font-size: 11px;margin-bottom: 10px;">

                            <tbody>
                            <tr>
                                    <th style="text-align: left;"><?php echo display('date');?></th>
                                    <th style="text-align: right;"><?php echo  $final_date; ?></th>
                                </tr>
                                <tr>
                                    <th style="text-align: left;"><?php echo display('invoice_no');?></th>
                                    <th style="text-align: right;"><?php echo $invoice_no;?></th>
                                </tr>
                                <tr>
                                    <th style="text-align: left;"><?php echo display('customer');?></th>
                                    <th style="text-align: right;"><?php echo $customer_name; ?></th>
                                </tr>
                                <?php if ($customer_mobile != '') { ?>
                                <tr>
                                    <th style="text-align: left;"><?php echo display('phone');?></th>
                                    <th style="text-align: right;"><?php echo $customer_mobile; ?></th>
                                </tr>
                                <?php }?>

                            </tbody>
                        </table>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"
                            style="color: #000;font-size: 11px;border-collapse: collapse;margin-bottom: 10px;">
                            <thead>
                                <tr>
                                    <th style="background-color: #ccc;border: 1px solid #000;">
                                    <div><?php echo display('item'); ?></div>

                                    </th>
                                    <th style="background-color: #ccc;border: 1px solid #000;">
                                    <div><?php echo display('qty2'); ?></div>

                                    </th>
                                    <th style="background-color: #ccc;border: 1px solid #000;">
                                    <div><?php echo display('batch'); ?></div>

                                    </th>
                                    <th style="background-color: #ccc;border: 1px solid #000;">
                                    <div><?php echo display('price'); ?></div>

                                    </th>
                                    <th style="background-color: #ccc;border: 1px solid #000;">
                                    <div><?php echo display('disc'); ?></div>

                                    </th>
                                    <?php if(!empty($invoice_all_data[0]['vat_amnt'] )){?>
                                    <th style="background-color: #ccc;border: 1px solid #000;">
                                    <div><?php echo display('vat'); ?></div>

                                    </th>
                                    <?php }?>
                                    <th style="background-color: #ccc;border: 1px solid #000;">
                                    <div><?php echo display('tot_price'); ?></div>

                                    </th>
                                </tr>
                                <tr>
                                    <th colspan="7" style="border: 1px solid #000;">
                                        <div style="position: relative;">
                                            <div style="height: 3px;background-color: #000;width: 99%;margin: auto;">
                                            </div>
                                            <div
                                                style="height: 1px;background-color: #fff;width: 100%;position: absolute;z-index: 9;top: 1px;left: 0;">
                                            </div>
                                        </div>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                $sl =1;
                $s_total = 0;
                $itemrow = 0;
                $total_price_with_dis = 0;  
                foreach($invoice_all_data as $invoice_data){?>
                                <tr>
                                    <th style="border: 1px solid #000;">
                                        <?php echo html_escape($invoice_data['product_name']);?></th>
                                    <th style="border: 1px solid #000;">
                                        <?php echo html_escape($invoice_data['quantity']);?></th>
                                    <th style="border: 1px solid #000;">
                                        <?php echo html_escape($invoice_data['batch_id']);?></th>
                                    <th style="border: 1px solid #000;"><?php echo html_escape($invoice_data['rate']);?>
                                    </th>
                                    <th style="border: 1px solid #000;">
                                        <?php echo html_escape($invoice_data['discount']);?></th>
                                    <?php if(!empty($invoice_data['vat_amnt'] )){?>
                                    <th style="border: 1px solid #000;">
                                        <?php echo html_escape($invoice_data['vat_amnt'] );?>
                                    </th>
                                    <?php }?>

                                    <th style="border: 1px solid #000;">
                                        <?php echo html_escape($invoice_data['total_price']);?></th>
                                </tr>
                                <?php 
                                $itemrow += $invoice_data['rate'] * $invoice_data['quantity'];
                                $total_price_with_dis +=$invoice_data['total_price'];
                                
                                ?>
                                <tr>
                                    <th colspan="7" style="border: 1px solid #000;text-align: center;">

                                        <div>
                                            <?php echo html_escape($invoice_data['product_name']).'('.html_escape($invoice_data['product_model']).')';?>
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th colspan="7" style="border: 1px solid #000;">
                                        <div style="position: relative;">
                                            <div style="height: 3px;background-color: #000;width: 99%;margin: auto;">
                                            </div>
                                            <div
                                                style="height: 1px;background-color: #fff;width: 100%;position: absolute;z-index: 9;top: 1px;left: 0;">
                                            </div>
                                        </div>
                                    </th>
                                </tr>

                                <?php $sl++; } ?>

                            </tbody>
                        </table>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"
                            style="color: #000;font-size: 11px;margin-bottom: 20px;">
                            <tbody>
                                <tr>
                                    <th style="text-align: left;"><?php echo number_format($itemrow, 2, '.', ',');?>
                                    </th>
                                    <th style="text-align: right;padding: 3px 10px 3px 0px"><?php echo display('tot_before_dis'); ?></th>
                                </tr>
                                <tr>
                                    <th style="text-align: left;"><?php echo $all_discount?></th>
                                    <th style="text-align: right;padding: 3px 10px 3px 0px"><?php echo display('discounts'); ?></th>
                                </tr>
                                <tr>
                                    <th style="text-align: left;">
                                        <?php echo number_format($itemrow -$all_discount, 2, '.', ',')?></th>
                                    <th style="text-align: right;padding: 3px 10px 3px 0px"><?php echo display('tot_with_dis'); ?></th>
                                </tr>
                                <?php if($total_vat > 0){?>
                                <tr>
                                    <th style="text-align: left;"><?php echo $total_vat?></th>
                                    <th style="text-align: right;padding: 3px 10px 3px 0px"><?php echo display('vat_val'); ?></th>
                                </tr>
                                <?php } 
                                if($total_tax > 0){?>
                                <tr>
                                    <th style="text-align: left;"><?php echo $total_tax?></th>
                                    <th style="text-align: right;padding: 3px 10px 3px 0px"><?php echo display('tax_vat'); ?></th>
                                </tr>
                                <?php } ?>
                                <tr>
                                    <th style="text-align: left;"><span
                                            style="font-size: 16px;font-weight: 900;"><?php echo $grand_total?></span>
                                    </th>
                                    <th style="text-align: right;padding: 3px 10px 3px 0px"><?php echo display('grand_total'); ?></th>
                                </tr>
                            </tbody>
                        </table>
                        <div style="margin-bottom: 12px;">
                            <div style="font-size: 11px;font-weight: 700;color: #000;text-align: center;margin-bottom: 15px;">
                            <?php echo display('return_receipt_text'); ?></div>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"
                                style="color: #000;font-size: 13px;">
                                <thead>
                                    <tr align="center">
                                        <?php foreach($p_method_list as $method_list){?>
                                        <th style="border-bottom: 1px solid #000;width: 12%;text-align: center;">
                                            <?php echo $method_list->HeadName?></th>
                                        <?php }?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <?php foreach($p_method_list as $method_list){
                                       
                                        ?>
                                        <th style="text-align: center;">
                                            <?php if($method_list->Debit !=null){echo $method_list->Debit;}else{echo '0.00';}?>
                                        </th>
                                        <?php }
                                        ?>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="text-align: left;">

                            <ul style="font-size: 11px;color: #000;font-weight: 700;">
                                <?php if (!empty($terms_list)) {
                                foreach($terms_list as $terms){?>
                                <li><?php echo $terms->description?></li>
                                <?php } }?>
                            </ul>
                        </div>
                        <?php $web_setting = $this->db->select("*")->from("web_setting")->get()->row();
                            if ($web_setting->is_qr == 1) { ?>
                        <div style="text-align: center;">
                            <?php  $text = base64_encode(display('invoice_no').': '.$invoice_no.' '.display('customer_name').': '. $customer_name);
                            ?>
                            <img src="http://chart.apis.google.com/chart?cht=qr&chs=250x250&chld=L|4&chl=<?php echo $text?>"
                                alt="">
                        </div>
                        <?php }?>
                        <table width="70%" border="0" cellpadding="0" cellspacing="0" align="center"
                            style="color: #000;font-size: 13px;margin-top: 20px;">
                            <tbody>
                                <tr>
                                    <th style="text-align: left;"><?php echo $users_name;?></th>
                                    <th style="text-align: right;"><?php echo display('order_by') ?></th>

                                </tr>
                                <tr>
                                    <?php $create_at = $this->db->select('CreateDate')
                                            ->from('acc_vaucher')
                                            ->where('referenceNo',$invoice_no)
                                            ->get()
                                            ->row();?>
                                    <th style="text-align: left;">
                                        <?php echo date("H:i:s",strtotime($create_at->CreateDate));?></th>

                                    <th style="text-align: right;"><?php echo display('order_time');
                    
                    ?></th>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel-footer text-left">
                <a class="btn btn-info" href="#" onclick="printDiv('printableArea')"><span
                        class="fa fa-print"></span></a>

            </div>
        </div>
    </div>
</div>
