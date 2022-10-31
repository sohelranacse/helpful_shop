<link href="<?php echo base_url('assets/css/return.css') ?>" rel="stylesheet" type="text/css"/>
<script src="<?php echo base_url() ?>my-assets/js/admin_js/return.js" type="text/javascript"></script>
<script src="<?php echo base_url() ?>my-assets/js/admin_js/invoice_return.js" type="text/javascript"></script>

        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo display('return_invoice') ?></h4>
                        </div>
                    </div>
                    <?php echo form_open('return/returns/return_invoice', array('class' => 'form-vertical', 'id' => 'invoice_update')) ?>
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-sm-6" id="payment_from_1">
                                <div class="form-group row">
                                    <label for="product_name" class="col-sm-4 col-form-label"><?php echo display('customer_name') ?> <i class="text-danger"></i></label>
                                    <div class="col-sm-8">
                                        <input type="text" name="customer_name" value="<?php echo $customer_name?>" class="form-control customerSelection" placeholder='<?php echo display('customer_name') ?>' required id="customer_name" tabindex="1" readonly="">

                                        <input type="hidden" class="customer_hidden_value" name="customer_id" value="<?php echo $customer_id?>" id="SchoolHiddenId"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="product_name" class="col-sm-4 col-form-label"><?php echo display('date') ?> <i class="text-danger"></i></label>
                                    <div class="col-sm-8">
                                        <input type="text" tabindex="2" class="form-control" name="invoice_date" value="<?php echo $date?>"  required readonly="" />
                                    </div>
                                </div>
                            </div>
                        </div>

                       <!-- ret part -->
                       


 <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="normalinvoice">
                                <thead>
                                    <tr>
                                        <th class="text-center"><?php echo display('item_information') ?> <i class="text-danger"></i></th>
                                        <th class="text-center"><?php echo display('sold_qty') ?></th>
                                        <th class="text-center"><?php echo display('batch_no') ?></th>
                                        <th class="text-center"><?php echo display('ret_quantity') ?>  <i class="text-danger">*</i></th>
                                        <th class="text-center"><?php echo display('rate') ?> <i class="text-danger"></i></th>
                                        <th class="text-center"><?php echo display('deduction') ?> %</th>
                                        <th class="text-center"><?php echo display('total') ?></th>
                                        <th class="text-center"><?php echo display('check_return') ?> <i class="text-danger">*</i></th>
                                    </tr>
                                </thead>
                                <tbody id="addinvoiceItemret">
                                    
                                    <?php foreach($invoice_all_data as $details){?>
                                    <tr>
                                        <td class="product_field">
                                            <input type="text" name="product_nameret" onclick="invoice_productList(<?php echo $details['sl']?>);" value="<?php echo $details['product_name']?>-(<?php echo $details['product_model']?>)" class="form-control productSelection" required placeholder='<?php echo display('product_name') ?>' id="product_names" tabindex="3" readonly="">

                                            <input type="hidden" class="product_idret_<?php echo $details['sl']?>  autocomplete_hidden_value"  value="<?php echo $details['product_id']?>" id="product_idret_<?php echo $details['sl']?>"/>
                                        </td>
                                        <td>
                                            <input type="text" name="sold_qtyret[]" id="sold_qtyret_<?php echo $details['sl']?>" class="form-control text-right available_quantityret_1" value="<?php echo $details['sum_quantity']?>" readonly="" />
                                        </td>
                                        <td>
                                            <input type="text" class="form-control text-right "
                                                value="<?php echo $details['batch_id']?>" readonly=""
                                                id="batch_no_<?php echo $details['sl']?>" />
                                        </td>
                                        <td>
                                            <input type="text"  onkeyup="quantity_calculate(<?php echo $details['sl']?>);" onchange="quantity_calculate(<?php echo $details['sl']?>);"  class="total_qnttret_<?php echo $details['sl']?> form-control text-right" id="total_qnttret_<?php echo $details['sl']?>" min="0" placeholder="0.00" tabindex="4" />
                                        </td>

                                        <td>
                                            <input type="text" name="product_rateret[]" onkeyup="quantity_calculate(<?php echo $details['sl']?>);" onchange="quantity_calculate(<?php echo $details['sl']?>);" value="<?php echo $details['rate']?>" id="price_itemret_<?php echo $details['sl']?>" class="price_itemret<?php echo $details['sl']?> form-control text-right" min="0" tabindex="5" required="" placeholder="0.00" readonly=""/>
                                        </td>
                                        <!-- Discount -->
                                        <td>
                                            <input type="text"  onkeyup="quantity_calculate(<?php echo $details['sl']?>);"  onchange="quantity_calculate(<?php echo $details['sl']?>);" id="discountret_<?php echo $details['sl']?>" class="form-control text-right" placeholder="0.00" value="" min="0" tabindex="6"/>

                                            <input type="hidden" value="<?php echo $discount_type ?>" name="discount_typeret" id="discount_typeret_<?php echo $details['sl']?>">
                                        </td>

                                        <td>
                                            <input class="total_priceret form-control text-right" type="text"  id="total_priceret_<?php echo $details['sl']?>" value="" readonly="readonly" />

                                            <input type="hidden" name="invoice_details_id[]" id="invoice_details_id" value="{invoice_details_id}"/>
                                        </td>
                                        <td>

                                            <!-- Tax calculate start-->
                                            <input id="total_tax_<?php echo $details['sl']?>" class="total_tax_<?php echo $details['sl']?>" type="hidden" value="{tax}">
                                            <input id="all_tax_<?php echo $details['sl']?>" class="total_tax" type="hidden" value="0" name="tax[]">
                                            <!-- Tax calculate end-->

                                            <!-- Discount calculate start-->
                                            <input type="hidden" id="total_discountret_<?php echo $details['sl']?>" class="" value=""/>

                                            <input type="hidden" id="all_discountret_<?php echo $details['sl']?>" class="total_discountret" value="" />
                                            <!-- Discount calculate end -->



                                            <input type="checkbox" name='rtn[]' onclick="checkboxcheck(<?php echo $details['sl']?>)" id="check_id_<?php echo $details['sl']?>" value="<?php echo $details['sl']?>" class="chk" >


                                        </td>
                                    </tr>
                                    <?php }?>
                                </tbody>

                                <tfoot>

                                    <tr>
                                        <td colspan="5" rowspan="3">
                                <center><label  for="details" class="  col-form-label text-center"><?php echo display('reason') ?></label></center>
                                <textarea class="form-control" name="details" id="details" placeholder="<?php echo display('reason') ?>"></textarea> <br>
                                <span class="usablity"><?php echo display('usablilties') ?> </span><br>
                                
                                <label class="ab"><?php echo display('adjs_with_stck') ?>
                                    <input type="radio" checked="checked" name="radio" value="1">
                                    <span class="checkmark"></span>
                                </label><br>

                               
                                <label class="ab"><?php echo display('wastage') ?>
                                    <input type="radio"  name="radio" value="3">
                                    <span class="checkmark"></span>
                                </label>

                                </td>
                                <td class="text-right" colspan="1"><b><?php echo display('to_deduction') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="total_discountret_ammount" class="form-control text-right" name="total_discountret" value="" readonly="readonly" />
                                </td>
                                </tr>
                               
                                <tr>
                                    <td colspan="1"  class="text-right"><b><?php echo display('nt_return') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="grandTotalret" class="form-control text-right" name="grand_total_priceret" value="" readonly="readonly" />
                                    </td>
                                    <input type="hidden" name="baseUrl" class="baseUrl" value="<?php echo base_url(); ?>"/>
                                    <input type="hidden" name="invoice_id" id="invoice_id" value="<?php echo $invoice_id?>"/>
                                    <input type="hidden" name="dbinv_id" id="dbinv_id" value="<?php echo $dbinv_id?>"/>
                                </tr>


                                </tfoot>
                            </table>
                        </div>

                       <!-- ret part end -->
                        <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="normalinvoice">
                        <thead>
                            <tr>
                                <th class="text-center product_field"><?php echo display('item_information') ?> <i
                                        class="text-danger">*</i></th>
                                <th class="text-center"><?php echo display('item_description')?></th>
                                <th class="text-center"><?php echo display('batch_no')?><i class="text-danger">*</i>
                                </th>
                                <th class="text-center"><?php echo display('available_qnty') ?></th>
                                <th class="text-center"><?php echo display('unit') ?></th>
                                <th class="text-center"><?php echo display('quantity') ?> <i class="text-danger">*</i>
                                </th>
                                <th class="text-center"><?php echo display('rate') ?> <i class="text-danger">*</i></th>

                                <?php if ($discount_type == 1) { ?>
                                <th class="text-center invoice_fields"><?php echo display('discount_percentage') ?> %
                                </th>
                                <?php } elseif ($discount_type == 2) { ?>
                                <th class="text-center invoice_fields"><?php echo display('discount') ?> </th>
                                <?php } elseif ($discount_type == 3) { ?>
                                <th class="text-center invoice_fields"><?php echo display('fixed_dis') ?> </th>
                                <?php } ?>
                                <th class="text-center invoice_fields"><?php echo display('dis_val') ?> </th>
                                <th class="text-center invoice_fields"><?php echo display('vat').' %' ?> </th>
                                <th class="text-center invoice_fields"><?php echo display('vat_val') ?> </th>
                                <th class="text-center invoice_fields"><?php echo display('total') ?>
                                </th>
                                <th class="text-center"><?php echo display('action') ?></th>
                            </tr>
                        </thead>
                        <tbody id="addinvoiceItem">
                            <tr>
                                <td class="product_field">
                                    <input type="text" required name="product_name" onkeypress="invoice_productList(1)"
                                        id="product_name_1" class="form-control productSelection"
                                        placeholder="<?php echo display('product_name') ?>" tabindex="5">

                                    <input type="hidden" class="autocomplete_hidden_value product_id_1"
                                        name="product_id[]" id="SchoolHiddenId" />

                                    <input type="hidden" class="baseUrl" value="<?php echo base_url(); ?>" />
                                </td>
                                <td>
                                    <input type="text" name="desc[]" class="form-control text-right " tabindex="6" />
                                </td>
                                <td class="invoice_fields">
                                    <select class="form-control basic-single" onchange="invoice_product_batch(1)"
                                        id="serial_no_1" required name="serial_no[]" tabindex="7">
                                        <option></option>
                                    </select>
                                </td>
                                <td>
                                    <input type="text" name="available_quantity[]"
                                        class="form-control text-right available_quantity_1" value="0" readonly="" />
                                </td>
                                <td>
                                    <input name="" id="" class="form-control text-right unit_1 valid" value="None"
                                        readonly="" aria-invalid="false" type="text">
                                </td>
                                <td>
                                    <input type="text" name="product_quantity[]" required=""
                                        onkeyup="bdtask_invoice_quantity_calculate(1);"
                                        onchange="bdtask_invoice_quantity_calculate(1);"
                                        class="total_qntt_1 form-control text-right" id="total_qntt_1"
                                        placeholder="0.00" min="0" tabindex="8" value="1" />
                                </td>
                                <td class="invoice_fields">
                                    <input type="text" name="product_rate[]" id="price_item_1"
                                        class="price_item1 price_item form-control text-right" tabindex="9" required=""
                                        onkeyup="bdtask_invoice_quantity_calculate(1);"
                                        onchange="bdtask_invoice_quantity_calculate(1);" placeholder="0.00" min="0" />
                                </td>
                                <!-- Discount -->
                                <td>
                                    <input type="text" name="discount[]" onkeyup="bdtask_invoice_quantity_calculate(1);"
                                        onchange="bdtask_invoice_quantity_calculate(1);" id="discount_1"
                                        class="form-control text-right" min="0" tabindex="10" placeholder="0.00" />
                                    <input type="hidden" value="<?php echo $discount_type?>" name="discount_type"
                                        id="discount_type_1">

                                </td>
                                <td>
                                    <input type="text" name="discountvalue[]" id="discount_value_1"
                                        class="form-control text-right" min="0" tabindex="18" placeholder="0.00"
                                        readonly />
                                </td>

                                <!-- VAT  -->
                                <td>
                                    <input type="text" name="vatpercent[]"
                                        onkeyup="bdtask_invoice_quantity_calculate(1);"
                                        onchange="bdtask_invoice_quantity_calculate(1);" id="vat_percent_1"
                                        class="form-control text-right" min="0" tabindex="19" placeholder="0.00" />

                                </td>
                                <td>
                                    <input type="text" name="vatvalue[]" id="vat_value_1"
                                        class="form-control text-right total_vatamnt" min="0" tabindex="20"
                                        placeholder="0.00" readonly />
                                </td>
                                <!-- VAT end -->

                                <td class="invoice_fields">
                                    <input class="total_price form-control text-right" type="text" name="total_price[]"
                                        id="total_price_1" value="0.00" readonly="readonly" />
                                </td>

                                <td>


                                    <!-- Discount calculate start-->
                                    <input type="hidden" id="total_discount_1" class="" />
                                    <input type="hidden" id="all_discount_1" class="total_discount dppr"
                                        name="discount_amount[]" />
                                    <!-- Discount calculate end -->

                                    <button class='btn btn-danger text-right' type='button' value='Delete'
                                        onclick='deleteRow_invoice(this)'><i class='fa fa-close'></i></button>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="10" rowspan="2">
                                    <center><label for="details"
                                            class="  col-form-label text-center"><?php echo display('invoice_details') ?></label>
                                    </center>
                                    <textarea name="inva_details" id="details" class="form-control"
                                        placeholder="<?php echo display('invoice_details') ?>" tabindex="12"></textarea>
                                </td>
                                <td class="text-right" colspan="1"><b><?php echo display('total_discount') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="total_discount_ammount" class="form-control text-right"
                                        name="total_discount" value="0.00" readonly="readonly" />
                                </td>
                                
                                <td><a href="javascript:void(0)" id="add_invoice_item" class="btn btn-info"
                                        name="add-invoice-item" onClick="addInputField_invoice('addinvoiceItem');"
                                        tabindex="11"><i class="fa fa-plus"></i></a></td>
                            </tr>
                            
                            <tr>
                                <td class="text-right" colspan="1"><b><?php echo display('ttl_val') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="total_vat_amnt" class="form-control text-right"
                                        name="total_vat_amnt" value="0.00" readonly="readonly" />
                                </td>
                            </tr>

                            <tr>
                            <tr>
                                <td class="text-right" colspan="11"><b><?php echo display('shipping_cost') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="shipping_cost" class="form-control text-right"
                                        name="shipping_cost" onkeyup="bdtask_invoice_quantity_calculate(1);"
                                        onchange="bdtask_invoice_quantity_calculate(1);" placeholder="0.00"
                                        tabindex="14" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="11" class="text-right"><b><?php echo display('grand_total') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="grandTotal" class="form-control text-right grandTotalamnt"
                                        name="grand_total_price" value="0.00" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="11" class="text-right"><b><?php echo display('previous'); ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="previous" class="form-control text-right" name="previous"
                                        value="0.00" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="11" class="text-right"><b><?php echo display('net_total'); ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="n_total" class="form-control text-right" name="n_total"
                                        value="0" readonly="readonly" placeholder="" />
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right" colspan="11"><b><?php echo display('paid_ammount') ?>:</b></td>
                                <td class="text-right">
                                    <input type="hidden" name="baseUrl" class="baseUrl"
                                        value="<?php echo base_url(); ?>" />
                                    <input type="text" id="paidAmount" onkeyup="invoice_paidamount();"
                                        class="form-control text-right" name="paid_amount" placeholder="0.00"
                                        tabindex="15" value="" />
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right" colspan="11"><b><?php echo display('due') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="dueAmmount" class="form-control text-right" name="due_amount"
                                        value="0.00" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>

                                <td colspan="11" class="text-right"><b><?php echo display('change'); ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="change" class="form-control text-right" name="change"
                                        value="0" readonly="readonly" placeholder="" />
                                    <input type="hidden" name="is_normal" value="1">
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                    <input type="hidden" name="finyear" value="<?php echo financial_year(); ?>">
                    <p hidden id="old-amount"><?php echo 0;?></p>
                    <p hidden id="pay-amount"></p>
                    <p hidden id="change-amount"></p>
                    <div class="col-sm-6 table-bordered p-20">
                        <div id="adddiscount" class="display-none">
                            <div class="row no-gutters">
                                <div class="form-group col-md-6">
                                    <label for="payments"
                                        class="col-form-label pb-2"><?php echo display('payment_type');?></label>

                                    <?php 
                                    $card_type=1020101; 
                                    echo form_dropdown('multipaytype[]',$all_pmethod,(!empty($card_type)?$card_type:null),' onchange = "check_creditsale()" class="card_typesl postform resizeselect form-control "') ?>

                                </div>
                                <div class="form-group col-md-6">
                                    <label for="4digit"
                                        class="col-form-label pb-2"><?php echo display('paid_amount');?></label>

                                    <input type="text" id="pamount_by_method" class="form-control number pay "
                                        name="pamount_by_method[]" value="" onkeyup="changedueamount()"
                                        placeholder="0" />

                                </div>
                            </div>

                            <div class="" id="add_new_payment">



                            </div>
                            <div class="form-group text-right">
                                <div class="col-sm-12 pr-0">

                                    <button type="button" id="add_new_payment_type"
                                        class="btn btn-success w-md m-b-5"><?php echo display('new_p_method');?></button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                        <div class="form-group row">
                            <label for="example-text-input" class=" col-form-label"></label>
                            <div class="col-sm-12 text-right" >

                                <input type="" id="add_invoice" class="btn btn-success btn-large" onclick="checkreturnamount()" name="add-invoice"  value="<?php echo display('return') ?>" readonly="readonly" tabindex="9"/>

                            </div>
                        </div>
                    </div>
                    <?php echo form_close() ?>
                </div>
            </div>
        </div>


        <script>
            function checkreturnamount() {
        var vatamnt = 0;
        var gt      = $("#grandTotal").val();
        var gtret   = $("#grandTotalret").val(); 
        vatamnt     = $("#total_vat_amnt").val();
        
        var grnt_totals = parseFloat(gt) + parseFloat(vatamnt);
    
        if (gtret > grnt_totals) {

            toastr["error"]('Grand Total Must Greater Then Net Return Amount');
        }
    }
        </script>

  

