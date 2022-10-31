<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-bd">
			<div id="printableArea" onload="printDiv('printableArea')">
				<div class="panel-body print-font-size">
					<div class="row print_header">

						<div class="col-xs-4">
							<?php foreach($company_info as $company){?>
								<img src="<?php if (isset($setting->invoice_logo)) echo base_url().$setting->invoice_logo;  ?>" class="img-bottom-m print-logo invoice-img-position" alt="">
								<br>
								<span
								class="label label-success-outline m-r-15 p-10"><?php echo display('billing_from') ?></span>
								<address class="margin-top10">
									<strong class=""><?php echo $company['company_name']?></strong><br>
									<span class="comp-web"><?php echo $company['address']?></span><br>
									<abbr class="font-bold"><?php echo display('mobile') ?>: </abbr>
									<?php echo $company['mobile']?><br>
									<abbr><b><?php echo display('email') ?>:</b></abbr>
									<?php echo $company['email']?><br>
									<abbr><b><?php echo display('website') ?>:</b></abbr>
									<span class="comp-web"><?php echo $company['website']?></span><br>
									<?php if (!empty($company['vat_no'])) {?>
										<abbr class="font-bold"><?php echo display('vat_no') ?>: </abbr>
										<?php echo $company['vat_no']?><br>
									<?php }?>
									<?php if (!empty($company['cr_no'])) {?>
										<abbr class="font-bold"><?php echo display('cr_no') ?>: </abbr>
										<?php echo $company['cr_no']?><br>
									<?php }?>
								</address>
							<?php }?>
						</div>

						<div class="col-xs-4">
							<?php $web_setting = $this->db->select("*")->from("web_setting")->get()->row();
							if ($web_setting->is_qr == 1) { ?>
								<div class="print-qr">
									<?php  $text = display('invoice_no').': '.$info->invoice.' '.display('customer_name').': '. $info->customer_name;
									?>
									<img src="http://chart.apis.google.com/chart?cht=qr&chs=250x250&chld=L|4&chl=<?php echo $text?>" alt="" style="max-height: 140px;">
								</div>
							<?php }?>
						</div>

						<div class="col-xs-4 text-left ">
							<h2 class="m-t-0"><?php echo display('invoice') ?></h2>
							<div>
								<abbr class="font-bold">
									<?php echo display('invoice_no') ?>: <span dir="ltr"></span>
								</abbr>
								<?php echo $info->invoice; ?>
							</div>
							<div class="m-b-15">
								<abbr class="font-bold"><?php echo display('billing_date') ?></abbr>
								<?php echo date("d-M-Y",strtotime($info->added_on));?>
								<br>
								<abbr class="font-bold"><?php echo display('invoice_time') ?>:</abbr>
								<?php echo date("H:i:s",strtotime($info->added_on));?>
							</div>

							<span class="label label-success-outline m-r-15"><?php echo display('billing_to') ?></span>

							<address style="margin-top: 10px;" class="">
								<strong class=""><?php echo $info->customer_name?> </strong><br>
								<?php if ($info->customer_address) { ?>
									<?php echo $info->customer_address;?>
									<br>
								<?php } ?>
								<?php if ($info->customer_mobile) { ?>
									<abbr class="font-bold"><?php echo display('mobile') ?>: </abbr>
									<?php echo $info->customer_mobile;?>
									<br>
								<?php }  ?>
								<?php  if ($info->customer_email){ ?>
									<abbr class="font-bold"><?php echo display('email') ?>: </abbr>
									<?php echo $info->customer_email;?>
									<br>
								<?php } ?>
								<?php if (!empty($info->email_address)) {?>
									<abbr class="font-bold"><?php echo display('vat_no') ?>: </abbr>
									<?php echo $info->email_address?>
									<br>
								<?php } ?>
								<?php if (!empty($info->contact)) {?>
									<abbr class="font-bold"><?php echo display('cr_no') ?>: </abbr>
									<?php echo $info->contact?>
								<?php } ?>


							</address>
						</div>
					</div>


					<div class="table-responsive">
                        <table class="table table-striped print-font-size">
                            <thead>
                                <tr>
                                    <th width="8%" class="text-center"><?php echo display('sl'); ?></th>
                                    <th width="22%" class="text-center"><?php echo display('product_name'); ?></th>                                    
                                    <th class="text-center"><?php echo display('unit'); ?></th>

                                    <th class="text-right"><?php echo display('sell_price'); ?></th>
                                    <th class="text-right"><?php echo display('quantity'); ?></th>

                                    <th class="text-right"><?php echo display('discount_percentage').'%'; ?></th>
                                    <th class="text-right"><?php echo display('dis_val');; ?></th>
                                    <th class="text-right"><?php echo display('net_amount'); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $subTotal_quantity = $subTotal_amount = $totalAmuount = $totalDiscountAmuount = 0;
                                if(sizeof($details))
                                foreach($details as $key => $row) {
                                	$subTotal_quantity += $row->quantity;
                                	$totalAmuount += $row->total_price;
                                	$totalDiscountAmuount += $row->discount;
                                	$subTotal_amount += ($row->quantity * $row->rate); // Sub total amount
                                ?>
	                                <tr>
	                                    <td class="text-center"><?php echo $key+1; ?></td>
	                                    <td class="text-center"><span class="comp-web"><?php echo $row->product_name; ?></span></td>
	                                    <td class="text-center comp-web"><?php echo $row->unit_name; ?></td>

	                                    <td class="comp-web" align="right"><?php echo $setting->currency.$row->rate; ?></td>
	                                    <td align="right" class="comp-web"><?php echo $row->quantity; ?></td>

	                                    <td class="comp-web" align="right"><?php echo $row->discount_per; ?></td>
	                                    <td class="comp-web" align="right"><?php echo $setting->currency.$row->discount; ?></td>
	                                    <td class="comp-web" align="right"><?php echo $setting->currency.$row->total_price; ?></td>
	                                </tr>
                                <?php } ?>
                                <tr>
                                    <td class="text-left" colspan="3"><b><?php echo display('grand_total') ?>:</b>
                                    </td>
                                    <td></td>
                                    <td align="right"><b><?php echo $setting->currency.number_format($subTotal_quantity,2)?></b></td>
                                    <td></td>
                                    <td align="right"><b><?php echo $setting->currency.number_format($totalDiscountAmuount,2)?></b></td>
                                    <td align="right"><b><?php echo $setting->currency.number_format($totalAmuount,2)?></b></td>
                                </tr>
                            </tbody>

                        </table>
                    </div><div class="row">

                        <div class="col-xs-6">

                            <p></p>
                            <p><strong><?php echo $info->invoice_details?></strong></p>

                        </div>
                        <div class="col-xs-6 inline-block">

                            <table class="table print-font-size">
                                <tr>
                                    <th class="text-left"><?php echo 'Shipping Cost' ?> : </th>
                                    <td class="text-right"><?php echo $setting->currency.$info->shipping_cost; ?></td>
                                </tr>
                                <tr>
                                    <th class="text-left grand_total"><?php echo display('grand_total') ?> :</th>
                                    <td class="text-right"><?php echo $setting->currency.$info->total_amount; ?></td>
                                </tr>

                                <tr>
                                    <th class="text-left grand_total"><?php echo display('paid_ammount') ?> :</th>
                                    
                                    <td class="text-right"><?php echo $setting->currency.$info->paid_amount; ?></td>
                                </tr>
                                <?php if ($info->total_amount > $info->due_amount) { ?>
	                                <tr>
	                                    <th class="text-left grand_total"><?php echo display('due') ?> :</th>
	                                    <td class="text-right"><?php echo $setting->currency.$info->due_amount; ?></td>
	                                </tr>
                                <?php } ?>
                            </table>

                        </div>
                    </div>

                    



					<div class="row margin-top50">
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
				<button class="btn btn-info" onclick="printDivnew('printableArea')"><span
					class="fa fa-print"></span></button>

				</div>
			</div>
		</div>
	</div>

