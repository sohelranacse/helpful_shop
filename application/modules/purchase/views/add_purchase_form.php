<!-- <script src="<?php // echo base_url()?>my-assets/js/admin_js/purchase.js" type="text/javascript"></script> -->

<style type="text/css">
    input::placeholder {
        font-size: 12px;
    }
    table input {
        padding: 0px;
        min-width: 90px;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <span><?php echo $title; ?></span>
                    <span class="padding-lefttitle">
                        <?php if($this->permission1->method('manage_purchase','read')->access()){ ?>
                        <a href="<?php echo base_url('purchase_list') ?>" class="btn btn-info m-b-5 m-r-2"><i
                                class="ti-align-justify"> </i> <?php echo display('manage_purchase') ?> </a>
                        <?php }?>
                    </span>
                </div>
            </div>

            <div class="panel-body">
                <?php echo form_open('purchase/purchase/save_purchase',array('class' => 'form-vertical', 'id' => 'insert_purchase','name' => 'insert_purchase', 'autocomplete' => 'off'))?>

                <div class="row">

                    <?php if($this->session->userdata('user_type') == 1) { ?>
                        <div class="col-sm-6">
                            <div class="form-group row">
                                <label for="supplier_sss" class="col-sm-4 col-form-label"><?php echo display('warehouse') ?> <i class="text-danger">*</i></label>
                                <div class="col-sm-6">
                                    <select name="warehouse_id" id="warehouse_id" class="form-control " required="1" tabindex="1" onchange="return refresh_item_list();">
                                        <option value=""><?php echo display('select_one') ?></option>
                                        <?php if(sizeof($warehouse_list)) foreach($warehouse_list as $value){ ?>
                                        <option value="<?php echo $value->warehouse_id; ?>">
                                            <?php echo $value->warehouse_name; ?></option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                    <?php } else { ?>
                        <input type="hidden" value="<?php echo $this->session->userdata('warehouse_id'); ?>" name="warehouse_id" id="warehouse_id">
                    <?php } ?>
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="supplier_sss" class="col-sm-4 col-form-label"><?php echo display('payment_method') ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <select name="payment_method_id" id="payment_method_id" class="form-control " required="1" tabindex="1">
                                    <option value=""><?php echo display('select_one') ?></option>
                                    <?php if(sizeof($payment_method)) foreach($payment_method as $value){ ?>
                                    <option value="<?php echo $value->payment_method_id; ?>">
                                        <?php echo $value->payment_method_name; ?></option>
                                    <?php }?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="supplier_sss" class="col-sm-4 col-form-label"><?php echo display('supplier') ?>
                                <i class="text-danger">*</i>
                            </label>
                            <div class="col-sm-6">
                                <select name="supplier_id" id="supplier_id" class="form-control " required="" tabindex="1" onchange="return refresh_item_list();">
                                    <option value=""><?php echo display('select_one') ?></option>
                                    <?php if(sizeof($all_supplier))  foreach($all_supplier as $suppliers){?>
                                    <option value="<?php echo $suppliers['supplier_id']; ?>">
                                        <?php echo $suppliers['supplier_name']; ?></option>
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

                <br>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="purchaseTable" style="font-size: 12px">
                        <thead>
                            <tr>
                                <th class="text-center" width="20%"><?php echo display('product_name') ?><i
                                        class="text-danger">*</i></th>
                                <th class="text-center"><?php echo display('unit') ?></th>
                                <th class="text-center"><?php echo display('stock_ctn') ?></th>
                                <th class="text-center"><?php echo display('supplier_price') ?><i class="text-danger">*</i></th>
                                <th class="text-center"><?php echo display('quantity') ?> <i class="text-danger">*</i></th>
                                <th class="text-center invoice_fields"><?php echo display('discount_percentage') ?> %</th>
                                <th class="text-center invoice_fields"><?php echo display('dis_val') ?> </th>
                                <th class="text-center"><?php echo display('total') ?></th>
                                <th class="text-center"><?php echo display('action') ?></th>
                            </tr>
                        </thead>
                        <tbody id="addPurchaseItem">
                            
                        </tbody>
                        <tfoot>
                            <tr>
                                <td class="text-right" colspan="7"><b><?php echo display('total_discount') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="total_discount_ammount" class="form-control text-right"
                                        name="total_discount" value="0.00" readonly="readonly" />
                                </td>
                                <td>
                                    <button type="button" id="add_invoice_item" class="btn btn-info" name="add-invoice-item" onClick="addPurchaseOrderField1('addPurchaseItem')"
                                        tabindex="9"><i class="fa fa-plus"></i></button>
                                    <input type="hidden" name="baseUrl" class="baseUrl" value="<?php echo base_url();?>" />
                                </td>
                            </tr>

                            <tr>

                                <td class="text-right" colspan="7"><b><?php echo display('grand_total') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="grandTotal" class="text-right form-control grandTotalamnt"
                                        name="grand_total_price" placeholder="0.00" readonly />
                                </td>
                                <td> </td>
                            </tr>
                            <tr>

                                <td class="text-right" colspan="7"><b><?php echo display('paid_amount') ?>:</b></td>
                                <td class="text-right">
                                    <input type="number" id="paidAmount" class="text-right form-control" onKeyup="invoice_paidamount(this.value)" name="paid_amount" placeholder="0.00" value="" />
                                </td>
                                <td> </td>
                            </tr>
                            <tr>
                                
                                <td class="text-right" colspan="7"><b><?php echo display('due_amount') ?>:</b></td>
                                <td class="text-right">
                                    <input type="text" id="dueAmmount" class="text-right form-control" name="due_amount"
                                        value="0.00" readonly="readonly" />
                                </td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
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

<script type="text/javascript">
    window.onload = function () {
        $('body').addClass("sidebar-mini sidebar-collapse");
    }
    function getXMLHTTP() {
        var xmlhttp = false;    
        try {
            xmlhttp = new XMLHttpRequest();
        }
        catch(e) {      
            try {           
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e) {
                try {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e1) {
                    xmlhttp = false;
                }
            }
        }
            
        return xmlhttp;
    }
    function refresh_item_list() {
        $("#addPurchaseItem").empty()
        
        $('#total_discount_ammount').val(0.00);
        $('#grandTotal').val(0.00);
        $('#paidAmount').val(0.00);
        invoice_paidamount()


        let supplier_id = $("#supplier_id").val()
        let warehouse_id = $("#warehouse_id").val()

        if(Number(supplier_id) && Number(warehouse_id))
            addPurchaseOrderField1('addPurchaseItem')
    }

    function deleteRow(e) {
        var t = $("#purchaseTable > tbody > tr").length;
        if (1 == t) alert("There only one row you can't delete.");
        else {
            var a = e.parentNode.parentNode;
            a.parentNode.removeChild(a)
        }
        summation_of_total_amount()
        summation_of_total_discount()
        invoice_paidamount()
    }
    function addPurchaseOrderField1(divName){
        var limits = 500;

        let supplier_id = $("#supplier_id").val()
        let warehouse_id = $("#warehouse_id").val()
        if(supplier_id == "" || warehouse_id == "") {
            alert('Please select first Warehouse & Supplier!')
            return false
        }
      
        var row = $("#purchaseTable tbody tr").length;
        var count = row + 1;
        var  tab1 = 0;
        var  tab2 = 0;
        var  tab3 = 0;
        var  tab4 = 0;
        var  tab5 = 0;
        var  tab6 = 0;
        var  tab7 = 0;
        var  tab8 = 0;
        var  tab9 = 0;
        var  tab10 = 0;
        var  tab11 = 0;
        var  tab12 = 0;
        var  tab13 = 0;
        var  tab14 = 0;      
  
        if (count == limits)  {
            alert("You have reached the limit of adding " + count + " inputs");
        }
        else{
            var newdiv = document.createElement('tr');
            tabindex = count * 4 ,
            newdiv = document.createElement("tr");
            tab1 = tabindex + 1;
            
            tab2 = tabindex + 2;
            tab3 = tabindex + 3;
            tab4 = tabindex + 4;
            tab5 = tabindex + 5;
            tab6 = tab5 + 1;
            tab7 = tab6 +1;
            tab11 = tabindex +11;
            tab12 = tabindex +12;
            tab13 = tabindex +13;
            tab14 = tabindex +14;
            
            var strURL = "<?php echo base_url('purchase/purchase/product_by_supplier_id/'); ?>"+supplier_id+"/"+count;
            var req = getXMLHTTP();            
            if (req) {
                req.onreadystatechange = function() {
                    if (req.readyState == 4) {
                        if (req.status == 200) {                      
                            
                            newdiv.innerHTML =`
                                <td>${req.responseText}</td>
                                <td><span id="unit_${count}" style="font-weight: bold"></span></td>

                                <td class="wt"> <input type="text" id="available_quantity_${count}" class="form-control text-right stock_ctn_${count}" placeholder="0.00" readonly/> </td>

                                <td class="test"><input type="text" name="product_rate[]" id="product_rate_${count}" class="form-control product_rate_${count} text-right" placeholder="0.00" value="" min="0" tabindex="'${tab3}'" readonly/>
                                </td>
                                <td class="text-right">
                                    <input type="number" name="product_quantity[]" tabindex="'${tab2}" required  id="quantity_${count}" class="form-control text-right store_cal_'${count}'" onkeyup="calculate_store(${count});" placeholder="0.00" value="" min="0"/>
                                </td>
                                <td class="test">
                                    <input type="number" name="discount_per[]" onkeyup="calculate_store(${count});" id="discount_${count}" class="form-control discount_${count} text-right" placeholder="0.00" value="" min="0" max="99" tabindex="'${tab11}" />
                                </td>
                                <td class="test">
                                    <input type="text" name="discountvalue[]" id="discount_value_${count}" class="form-control total_discount_val discount_value_${count} text-right" placeholder="0.00" value="" min="0" tabindex="'${tab12}'" readonly/>
                                </td>
                                <td class="text-right">
                                    <input class="form-control total_price text-right total_price_${count}" type="text" name="total_price[]" id="total_price_${count}" value="0.00" readonly="readonly" />
                                </td>
                                <td>
                                    <button style="text-align: right;" class="btn btn-danger red" type="button"  onclick="deleteRow(this)" tabindex="8"><i class="fa fa-close"></i></button>
                                </td>`;


                            document.getElementById(divName).appendChild(newdiv);
                            document.getElementById("add_invoice_item").setAttribute("tabindex", tab5);
                            document.getElementById("add_purchase").setAttribute("tabindex", tab6); 
                            count++;

                            $("select.form-control:not(.dont-select-me)").select2({
                                placeholder: "Select option",
                                allowClear: true
                            });

                            $(document).ready(function() {
                                $('.combo').select2();
                            });

                        } else {
                            alert("Have a problem!");
                        }
                    }
                    
                }
                req.open("GET", strURL, true);
                req.send(null);
            }

        }
    }
    function reset(count) {
        $('#expiry_date_'+count).val('');
        $('#batch_no_'+count).val('');
        $('#quantity_'+count).val('');
        $('#discount_'+count).val('');
        $('#discount_value_'+count).val('');
        $('#total_price_'+count).val(0.00);

        summation_of_total_amount()
        summation_of_total_discount()
        invoice_paidamount()
    }
    function product_information(product_id, count) {
        if(product_id == "") {
            $('#available_quantity_'+count).val('');
            $('#product_rate_'+count).val('');
            $('#unit_'+count).html('');
            reset(count)
        } else {

            var warehouse_id = $('#warehouse_id').val();
            var supplier_id = $('#supplier_id').val();
            var base_url = $('#base_url').val();
            var csrf_test_name = $('[name="csrf_test_name"]').val();

            var product_id_A = document.getElementsByName('product_id[]');
            for(p = 0; p < product_id_A.length; p++)
            {
                if (product_id_A[p].value !=="" && product_id_A[p].id !== "product_id"+count) {
                    if (product_id_A[p].value == product_id) {
                        alert('You have already selected this item.');
                        $("#product_id"+count).val('').trigger('change')

                        $('#available_quantity_'+count).val('');
                        $('#product_rate_'+count).val('');
                        $('#unit_'+count).html('');
                        reset(count)
                        return true;
                    }
                }
            }

            $.ajax({
                type: "POST",
                url: base_url+"purchase/purchase/retrieve_product_data",
                 data: {product_id:product_id,warehouse_id:warehouse_id,supplier_id:supplier_id,csrf_test_name:csrf_test_name},
                cache: false,
                success: function(data)
                {                    
                    obj = JSON.parse(data);
                    reset(count)
                    $('#available_quantity_'+count).val(obj.total_product);
                    $('#product_rate_'+count).val(obj.supplier_price);
                    $('#unit_'+count).html(obj.unit);

                    // console.log(product_id, count)
                  
                } 
            });

        }
    }
    function calculate_store(count) {
        var quantity    = $("#quantity_"+count).val();
        var supplier_price = $("#product_rate_"+count).val();
        var discount = $("#discount_"+count).val();

        var total_price = quantity * supplier_price;

        if(Number(discount)) {
            var price = quantity * supplier_price;
            var discountAmount = +(price * discount / 100);
            $("#discount_value_"+count).val(discountAmount);

            $("#total_price_"+count).val(Number(total_price-discountAmount).toFixed(2));
        } else {
            $("#discount_value_"+count).val('');
            $("#total_price_"+count).val(total_price.toFixed(2));
        }

        summation_of_total_amount()
        summation_of_total_discount()
        invoice_paidamount()
    }
    function summation_of_total_amount() {
        var arr = document.getElementsByName('total_price[]');
        var tot=0;
        for(var i=0;i<arr.length;i++){
            if(parseInt(arr[i].value))
                tot += parseInt(arr[i].value);
        }
        $("#grandTotal").val(tot);
    }
    function summation_of_total_discount() {
        var arr = document.getElementsByName('discountvalue[]');
        var tot=0;
        for(var i=0;i<arr.length;i++){
            if(parseInt(arr[i].value))
                tot += parseInt(arr[i].value);
        }
        $("#total_discount_ammount").val(tot);
    }
    function invoice_paidamount() {
        var paidAmount = $("#paidAmount").val()
        var grandTotal = $("#grandTotal").val()
        if(Number(grandTotal) && Number(paidAmount))
            $("#dueAmmount").val(Number(grandTotal - paidAmount).toFixed(2,2))
        else {
            $("#dueAmmount").val(0)
            $("#paidAmount").val('')
        }

        $("#add_new_payment").empty();
        $("#pamount_by_method").val(paidAmount);
        $("#pay-amount").text('0');
    }
</script>