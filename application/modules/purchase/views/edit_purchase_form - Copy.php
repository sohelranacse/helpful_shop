<script src="<?php echo base_url()?>my-assets/js/admin_js/purchase.js" type="text/javascript"></script>

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo display('edit_purchase') ?></h4>
                </div>
            </div>

            <?php echo form_open_multipart('purchase/purchase/update_purchase',array('class' => 'form-vertical', 'id' => 'purchase_update', 'autocomplete' => 'off'))?>
            <div class="panel-body">


                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="supplier_sss" class="col-sm-4 col-form-label"><?php echo display('supplier') ?>
                                <i class="text-danger">*</i>
                            </label>
                            <div class="col-sm-6">
                                <select name="supplier_id" id="supplier_id" class="form-control " required="">
                                    <option value="">Select Supplier</option>
                                    <?php foreach($supplier_list as $suppliers){?>
                                    <option value="<?php echo  $suppliers['supplier_id']?>"
                                        <?php if($suppliers['supplier_id'] == $supplier_id){echo 'selected';}?>>
                                        <?php echo  $suppliers['supplier_name']?></option>
                                    <?php }?>

                                </select>
                            </div>


                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label"><?php echo display('purchase_date') ?>
                                <i class="text-danger">*</i>
                            </label>
                            <div class="col-sm-6">
                                <?php $date = date('Y-m-d'); ?>
                                <input type="text" tabindex="2" class="form-control datepicker" name="purchase_date"
                                    value="<?php echo $purchase_date?>" id="date" required />
                                <input type="hidden" name="purchase_id" value="<?php echo $purchase_id?>">
                                <input type="hidden" name="dbpurs_id" value="<?php echo $dbpurs_id?>">

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="invoice_no" class="col-sm-4 col-form-label"><?php echo display('invoice_no') ?>
                                <i class="text-danger">*</i>
                            </label>
                            <div class="col-sm-6">
                                <input type="text" tabindex="3" class="form-control" name="chalan_no"
                                    placeholder="<?php echo display('invoice_no') ?>" id="invoice_no" required
                                    value="<?php echo $chalan_no;?>" />
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="adress" class="col-sm-4 col-form-label"><?php echo display('details') ?>
                            </label>
                            <div class="col-sm-6">
                                <textarea class="form-control" tabindex="4" id="adress" name="purchase_details"
                                    placeholder=" <?php echo display('details') ?>"
                                    rows="1"><?php echo $purchase_details;?></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6" id="bank_div">
                        <div class="form-group row">
                            <label for="bank" class="col-sm-4 col-form-label"><?php
                                    echo display('bank');
                                    ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <select name="bank_id" class="form-control bankpayment" id="bank_id">
                                    <option value="">Select Location</option>
                                    <?php foreach($bank_list as $bank){?>
                                    <option value="<?php echo $bank['bank_id']?>"
                                        <?php if($bank['bank_id'] == $bank_id){echo 'selected';}?>>
                                        <?php echo $bank['bank_name'];?></option>
                                    <?php }?>
                                </select>
                                <input type="hidden" id="editpayment_type" value="<?php echo $paytype;?>" name="">

                            </div>

                        </div>
                    </div>
                </div>

                <br>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="purchaseTable">
                        <thead>
                            <tr>
                                <th class="text-center" width="20%"><?php echo display('item_information') ?><i
                                        class="text-danger">*</i></th>
                                <th class="text-center"><?php echo display('stock_ctn') ?></th>
                                <th class="text-center"><?php echo display('expiry_date') ?></th>
                                <th class="text-center"><?php echo display('batch_no') ?></th>
                                <th class="text-center"><?php echo display('quantity') ?> <i class="text-danger">*</i>
                                </th>
                                <th class="text-center"><?php echo display('rate') ?><i class="text-danger">*</i></th>
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
                                <th class="text-center"><?php echo display('total') ?></th>
                                <th class="text-center"><?php echo display('action') ?></th>
                            </tr>
                        </thead>
                        <tbody id="addPurchaseItem">
                            <?php foreach($purchase_info as $purchases){?>
                            <tr>
                                <td class="span3 supplier">
                                    <input type="text" name="product_name" required
                                        class="form-control product_name productSelection"
                                        onkeypress="product_pur_or_list(<?php echo $purchases['sl']?>);"
                                        placeholder="<?php echo display('product_name') ?>"
                                        id="product_name_<?php echo $purchases['sl']?>" tabindex="5"
                                        value="<?php echo $purchases['product_name']?>">

                                    <input type="hidden"
                                        class="autocomplete_hidden_value product_id_<?php echo $purchases['sl']?>"
                                        name="product_id[]" id="SchoolHiddenId"
                                        value="<?php echo $purchases['product_id']?>" />

                                    <input type="hidden" class="sl" value="<?php echo $purchases['sl']?>">
                                </td>

                                <td class="wt">
                                    <input type="text" id="available_quantity_<?php echo $purchases['sl']?>"
                                        class="form-control text-right stock_ctn_<?php echo $purchases['sl']?>"
                                        placeholder="0.00" readonly />
                                </td>
                                <td class="wt">
                                    <input type="text" id="expiry_date_<?php echo $purchases['sl']?>" class="form-control expiry_date_<?php echo $purchases['sl']?>"
                                        placeholder="Expiry Date" name="expiry_date[]" value="<?php echo $purchases['expiry_date']?>"/>
                                </td>

                                <td class="wt">
                                    <input type="text" id="batch_no_<?php echo $purchases['sl']?>" class="form-control text-right batch_no_<?php echo $purchases['sl']?>"
                                    value="<?php echo $purchases['batch_id']?>"  placeholder="Batch No" name="batch_no[]" />
                                </td>
                                <td class="text-right">
                                    <input type="text" name="product_quantity[]"
                                        id="cartoon_<?php echo $purchases['sl']?>"
                                        class="form-control text-right store_cal_<?php echo $purchases['sl']?>"
                                        onkeyup="calculate_store(<?php echo $purchases['sl']?>);"
                                        onchange="calculate_store(<?php echo $purchases['sl']?>);" placeholder="0.00"
                                        value="<?php echo $purchases['quantity']?>" min="0" tabindex="6" />
                                </td>
                                <td class="test">
                                    <input type="text" name="product_rate[]"
                                        onkeyup="calculate_store(<?php echo $purchases['sl']?>);"
                                        onchange="calculate_store(<?php echo $purchases['sl']?>);"
                                        id="product_rate_<?php echo $purchases['sl']?>"
                                        class="form-control product_rate_<?php echo $purchases['sl']?> text-right"
                                        placeholder="0.00" value="<?php echo $purchases['rate']?>" min="0"
                                        tabindex="7" />
                                </td>
                                <!-- Discount start-->
                                <td>
                                    <input type="text" name="discount_per[]" onkeyup="calculate_store(<?php echo $purchases['sl']?>);"
                                        onchange="calculate_store(<?php echo $purchases['sl']?>);" id="discount_<?php echo $purchases['sl']?>" class="form-control text-right"
                                        value="<?php echo $purchases['discount']?>" min="0" tabindex="11" placeholder="0.00" />
                                    <input type="hidden" value="<?php echo $discount_type?>" name="discount_type"
                                        id="discount_type_<?php echo $purchases['sl']?>">

                                </td>
                                <td>
                                    <input type="text" name="discountvalue[]" id="discount_value_<?php echo $purchases['sl']?>"
                                        class="form-control text-right total_discount_val" min="0" tabindex="12"
                                        value="<?php echo $purchases['discount_amnt']?>" placeholder="0.00" readonly />
                                </td>
                                <!-- Discount end-->
                                <!-- VAT  start-->
                                <td>
                                    <input type="text" name="vatpercent[]" onkeyup="calculate_store(<?php echo $purchases['sl']?>);"
                                        onchange="calculate_store(<?php echo $purchases['sl']?>);" id="vat_percent_<?php echo $purchases['sl']?>"
                                        value="<?php echo $purchases['vat_amnt_per']?>" class="form-control text-right" min="0" tabindex="13" placeholder="0.00" />


                                </td>
                                <td>
                                    <input type="text" name="vatvalue[]" id="vat_value_<?php echo $purchases['sl']?>"
                                        class="form-control text-right total_vatamnt" min="0" tabindex="14"
                                        value="<?php echo $purchases['vat_amnt']?>" placeholder="0.00" readonly />
                                </td>
                                <!-- VAT  end-->

                                <td class="text-right">
                                    <input class="form-control total_price text-right" type="text" name="total_price[]"
                                        id="total_price_<?php echo $purchases['sl']?>"
                                        value="<?php echo $purchases['total_amount']?>" readonly="readonly" />
                                </td>
                                <td>



                                    <button class="btn btn-danger text-right red" type="button"
                                        value="<?php echo display('delete')?>" onclick="deleteRow(this)" tabindex="8"><i
                                            class="fa fa-close"></i></button>
                                </td>
                            </tr>
                            <?php }?>
                        </tbody>
                        <tfoot>
                            <tfoot>
                                <tr>

                                    <td class="text-right" colspan="10"><b><?php echo display('total') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="Total" class="text-right form-control" name="total"
                                            value="<?php echo $total;?>" readonly="readonly" />
                                    </td>
                                    <td> <button type="button" id="add_invoice_item" class="btn btn-info"
                                            name="add-invoice-item" onClick="addPurchaseOrderField1('addPurchaseItem')"
                                            tabindex="9"><i class="fa fa-plus"></i></button>

                                        <input type="hidden" name="baseUrl" class="baseUrl"
                                            value="<?php echo base_url();?>" />
                                    </td>
                                </tr>
                                <tr>

                                    <td class="text-right" colspan="10">
                                        <b><?php echo display('purchase_discount') ?>:</b>
                                    </td>
                                    <td class="text-right">
                                        <input type="text" id="discount" class="text-right form-control total_discount_val discount"
                                            onkeyup="calculate_store(1)" name="discount" placeholder="0.00"
                                            value="<?php echo $total_discount;?>" />
                                    </td>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right" colspan="10"><b><?php echo display('total_discount') ?>:</b>
                                    </td>
                                    <td class="text-right">
                                        <input type="text" id="total_discount_ammount" class="form-control text-right"
                                        value="<?php echo $invoice_discount;?>" name="total_discount" value="0.00" readonly="readonly" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right" colspan="10"><b><?php echo display('ttl_val') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="total_vat_amnt" class="form-control text-right"
                                        value="<?php echo $total_vat_amnt;?>"  name="total_vat_amnt" value="0.00" readonly="readonly" />
                                    </td>
                                </tr>
                                <tr>

                                    <td class="text-right" colspan="10"><b><?php echo display('grand_total') ?>:</b>
                                    </td>
                                    <td class="text-right">
                                        <input type="text" id="grandTotal"
                                            class="text-right grandTotalamnt form-control" name="grand_total_price"
                                            value="<?php echo $grand_total;?>" readonly="readonly" />
                                    </td>
                                    <td> </td>
                                </tr>
                                <tr>

                                    <td class="text-right" colspan="10"><b><?php echo display('paid_amount') ?>:</b>
                                    </td>
                                    <td class="text-right">
                                        <input type="text" id="paidAmount" class="text-right form-control"
                                            onKeyup="invoice_paidamount()" name="paid_amount"
                                            value="<?php echo $paid_amount;?>" />
                                    </td>
                                    <td> </td>
                                </tr>
                                <tr>
                                   
                                    <td class="text-right" colspan="10"><b><?php echo display('due_amount') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="dueAmmount" class="text-right form-control"
                                            name="due_amount" value="<?php echo $due_amount;?>" readonly="readonly" />
                                    </td>
                                    <td></td>
                                </tr>
                            </tfoot>
                        </tfoot>
                    </table>
                    <input type="hidden" name="finyear" value="<?php echo financial_year(); ?>">
                    <p hidden id="pay-amount"><?php echo $paid_amount;?></p>
                    <p hidden id="change-amount"></p>
                    <div class="col-sm-6 table-bordered p-20">
                        <div id="adddiscount" class="display-none">
                            
                            <input type="hidden" id="purchase_edit_page" value="1">
                            <input type="hidden" id="is_credit_edit" value="<?php echo $is_credit?>">
                            <div class="" id="add_new_payment">
                                
                                <?php if ($is_credit != 1) { 
                                foreach($multi_paytype as $all_paytype){?>
                                <div class="row no-gutters">
                                    <div class="form-group col-md-6">
                                        <label for="payments"
                                            class="col-form-label pb-2"><?php echo display('payment_type');?></label>

                                        <?php 
                                                    echo form_dropdown('multipaytype[]',$all_pmethod,(!empty($all_paytype)?$all_paytype->RevCodde:null),'class="card_typesl postform resizeselect form-control "') ?>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="4digit"
                                            class="col-form-label pb-2"><?php echo display('paid_amount');?></label>

                                        <input type="text" id="pamount_by_method"
                                            class="form-control number pay firstpay" name="pamount_by_method[]"
                                            value="<?php echo $all_paytype->Debit?>" onkeyup="changedueamount()"
                                            placeholder="0" />

                                    </div>
                                </div>
                                <?php } }else{ ?>
                                    <div class="row no-gutters">
                                    <div class="form-group col-md-6">
                                        <label for="payments"
                                            class="col-form-label pb-2"><?php echo display('payment_type');?></label>

                                        <?php 
                                        echo form_dropdown('multipaytype[]',$all_pmethodwith_cr,0,'onchange = "check_creditsale()" required class="card_typesl postform resizeselect form-control "') ?>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="4digit"
                                            class="col-form-label pb-2"><?php echo display('paid_amount');?></label>

                                        <input type="text" id="pamount_by_method"
                                            class="form-control number pay firstpay" name="pamount_by_method[]"
                                            value="<?php echo $paid_amount?>" onkeyup="changedueamount()"
                                            placeholder="0" />

                                    </div>
                                </div>
                                <?php }?>


                            </div>
                            <div class="form-group text-right">
                                <div class="col-sm-12 pr-0">
                                    <button <?php if(empty($multi_paytype)){echo 'disabled';}?> type="button" id="add_new_payment_type"
                                        class="btn btn-success w-md m-b-5"><?php echo display('new_p_method');?></button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="form-group row text-right">
                    <div class="col-sm-12 p-20">
                        <input type="submit" id="add_purchase" class="btn btn-primary btn-large" name="add-purchase"
                            value="<?php echo display('submit') ?>" />

                    </div>
                </div>
            </div>
            <?php echo form_close()?>

        </div>
    </div>
</div>
</div>