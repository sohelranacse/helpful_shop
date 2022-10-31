<script src="<?php echo base_url()?>my-assets/js/admin_js/purchase.js" type="text/javascript"></script>


<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo display('add_purchase') ?></h4>
                </div>
            </div>

            <div class="panel-body">
                <?php echo form_open_multipart('purchase/purchase/bdtask_save_purchase',array('class' => 'form-vertical', 'id' => 'insert_purchase','name' => 'insert_purchase'))?>


                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="supplier_sss" class="col-sm-4 col-form-label"><?php echo display('supplier') ?>
                                <i class="text-danger">*</i>
                            </label>
                            <div class="col-sm-6">
                                <select name="supplier_id" id="supplier_id" class="form-control " required="" tabindex="1" onchange="return refresh_item_list(this.value);">
                                    <option value=" "><?php echo display('select_one') ?></option>
                                    <?php foreach($all_supplier as $suppliers){?>
                                    <option value="<?php echo $suppliers['supplier_id']?>">
                                        <?php echo $suppliers['supplier_name']?></option>
                                    <?php }?>
                                </select>
                            </div>
                            <?php if($this->permission1->method('add_supplier','create')->access()){ ?>
                            <div class="col-sm-2">
                                <a class="btn btn-success" title="Add New Supplier"
                                    href="<?php echo base_url('add_supplier'); ?>"><i class="fa fa-user"></i></a>
                            </div>
                            <?php }?>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label"><?php echo display('purchase_date') ?>
                                <i class="text-danger">*</i>
                            </label>
                            <div class="col-sm-8">
                                <?php $date = date('Y-m-d'); ?>
                                <input type="text" required tabindex="2" class="form-control datepicker"
                                    name="purchase_date" value="<?php echo $date; ?>" id="date" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="chalan_no" class="col-sm-4 col-form-label"><?php echo display('chalan_no') ?>
                                <i class="text-danger">*</i>
                            </label>
                            <div class="col-sm-6">
                                <input type="text" tabindex="3" class="form-control" name="chalan_no"
                                    placeholder="<?php echo display('chalan_no') ?>" id="chalan_no" required />
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="adress" class="col-sm-4 col-form-label"><?php echo display('details') ?>
                            </label>
                            <div class="col-sm-8">
                                <textarea class="form-control" tabindex="4" id="adress" name="purchase_details"
                                    placeholder=" <?php echo display('details') ?>" rows="1"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="supplier_sss" class="col-sm-4 col-form-label"><?php echo display('warehouse') ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <select name="warehouse_id" id="warehouse_id" class="form-control " required="1" tabindex="1">
                                    <option value=" "><?php echo display('select_one') ?></option>
                                    <?php if(sizeof($warehouse_list)) foreach($warehouse_list as $value){ ?>
                                    <option value="<?php echo $value->warehouse_id; ?>">
                                        <?php echo $value->warehouse_name; ?></option>
                                    <?php }?>
                                </select>
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
                                <th class="text-center"><?php echo display('batch_no') ?><i class="text-danger">*</i></th>
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
                            <tr>
                                <td class="span3 supplier">
                                    <input type="text" name="product_name" required
                                        class="form-control product_name productSelection"
                                        onkeypress="product_pur_or_list(1);"
                                        placeholder="<?php echo display('product_name') ?>" id="product_name_1"
                                        tabindex="5" autocomplete="off">

                                    <input type="hidden" class="autocomplete_hidden_value product_id_1"
                                        name="product_id[]" id="SchoolHiddenId">

                                    <input type="hidden" class="sl" value="1">
                                </td>

                                <td class="wt">
                                    <input type="text" id="available_quantity_1"
                                        class="form-control text-right stock_ctn_1" placeholder="0.00" readonly />
                                </td>

                                <td class="wt">
                                    <input type="text" id="expiry_date_1" autocomplete="off" class="form-control datepicker expiry_date_1"
                                        placeholder="Expiry Date" name="expiry_date[]" />
                                </td>

                                <td class="wt">
                                    <input type="text" id="batch_no_1" class="form-control text-right batch_no_1"
                                        placeholder="Batch No" name="batch_no[]" required/>
                                </td>

                                <td class="text-right">
                                    <input type="text" name="product_quantity[]" id="cartoon_1" required="" min="0"
                                        class="form-control text-right store_cal_1" onkeyup="calculate_store(1);"
                                        onchange="calculate_store(1);" placeholder="0.00" value="" tabindex="6" />
                                </td>
                                <td class="test">
                                    <input type="text" name="product_rate[]" required="" onkeyup="calculate_store(1);"
                                        onchange="calculate_store(1);" id="product_rate_1"
                                        class="form-control product_rate_1 text-right" placeholder="0.00" value=""
                                        min="0" tabindex="7" />
                                </td>
                                <!-- Discount start-->
                                <td>
                                    <input type="text" name="discount_per[]" onkeyup="calculate_store(1);"
                                        onchange="calculate_store(1);" id="discount_1" class="form-control text-right"
                                        min="0" tabindex="11" placeholder="0.00" />
                                    <input type="hidden" value="<?php echo $discount_type?>" name="discount_type"
                                        id="discount_type_1">

                                </td>
                                <td>
                                    <input type="text" name="discountvalue[]" id="discount_value_1"
                                        class="form-control text-right total_discount_val" min="0" tabindex="12"
                                        placeholder="0.00" readonly />
                                </td>
                                <!-- Discount end-->
                                <!-- VAT  start-->
                                <td>
                                    <input type="text" name="vatpercent[]" onkeyup="calculate_store(1);"
                                        onchange="calculate_store(1);" id="vat_percent_1"
                                        class="form-control text-right" min="0" tabindex="13" placeholder="0.00" />


                                </td>
                                <td>
                                    <input type="text" name="vatvalue[]" id="vat_value_1"
                                        class="form-control text-right total_vatamnt" min="0" tabindex="14"
                                        placeholder="0.00" readonly />
                                </td>
                                <!-- VAT  end-->

                                <td class="text-right">
                                    <input class="form-control total_price text-right" type="text" name="total_price[]"
                                        id="total_price_1" value="0.00" readonly="readonly" />

                                    <input type="hidden" id="all_discount_1" class="total_discount dppr"
                                        name="discount_amount[]" />
                                    <input type="hidden" id="total_discount_1" class="" />
                                </td>
                                <td>
                                    <button class="btn btn-danger text-right red" type="button"
                                        value="<?php echo display('delete')?>" onclick="deleteRow(this)" tabindex="8"><i
                                            class="fa fa-close"></i></button>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>

                                <td class="text-right" colspan="10"><b><?php echo display('total') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="Total" class="text-right form-control" name="total"
                                        value="0.00" readonly="readonly" />
                                </td>
                                <td> <button type="button" id="add_invoice_item" class="btn btn-info"
                                        name="add-invoice-item" onClick="addPurchaseOrderField1('addPurchaseItem')"
                                        tabindex="9"><i class="fa fa-plus"></i></button>

                                    <input type="hidden" name="baseUrl" class="baseUrl"
                                        value="<?php echo base_url();?>" />
                                </td>
                            </tr>
                            <tr>

                                <td class="text-right" colspan="10"><b><?php echo display('purchase_discount') ?>:</b>
                                </td>
                                <td class="text-right">
                                    <input type="text" id="discount" class="text-right form-control discount total_discount_val"
                                        onkeyup="calculate_store(1)" name="discount" placeholder="0.00" value="" />
                                </td>

                                <td>

                                </td>
                            </tr>
                            <tr>
                                <td class="text-right" colspan="10"><b><?php echo display('total_discount') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="total_discount_ammount" class="form-control text-right"
                                        name="total_discount" value="0.00" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right" colspan="10"><b><?php echo display('ttl_val') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="total_vat_amnt" class="form-control text-right"
                                        name="total_vat_amnt" value="0.00" readonly="readonly" />
                                </td>
                            </tr>

                            <tr>

                                <td class="text-right" colspan="10"><b><?php echo display('grand_total') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="grandTotal" class="text-right form-control grandTotalamnt"
                                        name="grand_total_price" placeholder="0.00" value="00" readonly />
                                </td>
                                <td> </td>
                            </tr>
                            <tr>

                                <td class="text-right" colspan="10"><b><?php echo display('paid_amount') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="paidAmount" class="text-right form-control"
                                        onKeyup="invoice_paidamount()" name="paid_amount" placeholder="0.00" value="" />
                                </td>
                                <td> </td>
                            </tr>
                            <tr>
                                
                                <td class="text-right" colspan="10"><b><?php echo display('due_amount') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="dueAmmount" class="text-right form-control" name="due_amount"
                                        value="0.00" readonly="readonly" />
                                </td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                    <input type="hidden" name="finyear" value="<?php echo financial_year(); ?>">
                    <p hidden id="pay-amount"></p>
                    <p hidden id="change-amount"></p>
                    <div class="col-sm-6 table-bordered p-20">
                        <div id="adddiscount" class="display-none">
                            <div class="row no-gutters">
                                <div class="form-group col-md-6">
                                    <label for="payments"
                                        class="col-form-label pb-2"><?php echo display('payment_type');?></label>

                                    <?php $card_type=111000001;
                                                echo form_dropdown('multipaytype[]',$all_pmethod,(!empty($card_type)?$card_type:null),'onchange = "check_creditsale()" required class="card_typesl postform resizeselect form-control "') ?>

                                </div>
                                <div class="form-group col-md-6">
                                    <label for="4digit"
                                        class="col-form-label pb-2"><?php echo display('paid_amount');?></label>

                                    <input type="number" id="pamount_by_method" class="form-control number pay "
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

                <div class="form-group row text-right">
                    <div class="col-sm-12 p-20">
                        <input type="submit" id="add_purchase" class="btn btn-primary btn-large" name="add-purchase"
                            value="<?php echo display('submit') ?>" />

                    </div>
                </div>
                <?php echo form_close()?>
            </div>
        </div>

    </div>
</div>