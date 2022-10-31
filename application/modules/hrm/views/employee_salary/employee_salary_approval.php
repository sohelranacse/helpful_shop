<link href="<?php echo base_url('application/modules/payroll/assets/css/payslip.css'); ?>" rel="stylesheet" type="text/css"/>

<div class="container">

    <div class="panel panel-default thumbnail"> 
        
        

        <br>

        <div id="printArea">

            <div style="padding:20px;">

                <div class="row mb-10">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center fs-20">

                                    Payroll posting sheet for <?php echo $salary_sheet_generate_info->name;?>
                                    <br>(<span style="<?php echo $salary_sheet_generate_info->approved == 1?'color:#05f305;':'color:#ef1ea5;';?>"><?php echo $salary_sheet_generate_info->approved == 1?'Approved':'Not Approved';?></span>)
                                    
                                </th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="row">
                    <table class="table table-bordered">
                        <thead>
                            <tr style="background-color: #c3bfbf;color: #FFF;text-align: center;font-weight: bold;font-size: 14px;">
                                <td colspan="">Description</td>
                                <td colspan="2">Amounts</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="font-weight: bold;text-align: center;">Debit</td>
                                <td style="font-weight: bold;text-align: center;">Credit</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">Gross Salary</th>
                                <td><?php echo $currency.' '.$gross_salary;?></td>
                                <td></td>
                            </tr>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">Net Salary</th>
                                <td></td>
                                <td><?php echo $currency.' '.$net_salary;?></td>
                            </tr>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">Loans</th>
                                <td></td>
                                <td><?php echo $currency.' '.$loans;?></td>
                            </tr>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">Salary Advance</th>
                                <td></td>
                                <td><?php echo $currency.' '.$salary_advance;?></td>
                            </tr>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">State Income Tax</th>
                                <td></td>
                                <td><?php echo $currency.' '.$state_income_tax;?></td>
                            </tr>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">Employee 5% NPF Contribution</th>
                                <td></td>
                                <td><?php echo $currency.' '.$employee_npf_contribution;?></td>
                            </tr>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">Employer 10% NPF Contribution</th>
                                <td></td>
                                <td><?php echo $currency.' '.$employer_npf_contribution;?></td>
                            </tr>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">IICF Contribution</th>
                                <td></td>
                                <td><?php echo $currency.' '.$icf_amount;?></td>
                            </tr>
                            <tr style="background-color: #c3bfbf;color: #FFF;text-align: center;font-weight: bold;font-size: 14px;height: 35px;">
                                <th style="text-align: center;"><!-- Total --></th>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="form-group form-group-margin text-right">
                        <button type="button" id="post_button" class="btn btn-success w-md m-b-5" style="<?php echo $salary_sheet_generate_info->approved == 1?'display: none;':'';?>"><?php echo display('post') ?></button>
                    </div>

                </div>

                <?php echo  form_open('hrm/Payroll/save_employee_salary_approval') ?>

                <div class="row" id="payment_area">

                    <!-- Payment for Net Renumeration -->

                    <div class="col-sm-12">
                        <h3>Note: Sum of all payment amount should be equal to Net Salary.</h3>
                    </div>

                    <table class="table table-bordered" id="request_table">
                        <thead>
                            <tr>
                                <th width="50%">Payment Nature</th>
                                <th width="40%">Amount(Net Salary <?php echo $currency.' ';?><span style="color: green;"><b><?php echo ' '.$net_salary;?></b></span>)</th>
                                <th width="10%">Action</th>
                            </tr>
                        </thead>
                        <tbody id="payment_request_item">
                            <tr>
                                <td>
                                    <select name="payment_nature[]" class="form-control payment-nature-select"  required="">
                                            <option value=""> Select Payment Nature</option>
                                        <?php if ($payment_natures) { ?>
                                          <?php foreach($payment_natures as $key => $value){?>
                                            <option value="<?php echo $key;?>"><?php echo $value;?></option>
                                            
                                        <?php }} ?>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" id="amount" name="amount[]" class="form-control payment-amount" required step=".01">
                                </td>
                                <td>
                                    <a  id="add_payment_item" class="btn btn-info btn-sm" name="add-invoice-item" onClick="add_key_payment_item('payment_request_item')"  tabindex="9"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
                                    <a class="btn btn-danger btn-sm"  value="<?php echo display('delete') ?>" onclick="deleteRow(this)" tabindex="3"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>

                                <input type="hidden" id="payment_list" value='<?php if ($payment_natures) { ?><?php foreach($payment_natures as $key => $value){?><option value="<?php echo $key;?>"><?php echo $value;?></option><?php }}?>' name="">

                                <input type="hidden" id="net_renumeration" value="<?php echo $net_salary;?>" name="net_renumeration">
                                <input type="hidden" id="employee_npf_contribution" value="<?php echo $employee_npf_contribution;?>" name="employee_npf_contribution">
                                <input type="hidden" id="employer_npf_contribution" value="<?php echo $employer_npf_contribution;?>" name="employer_npf_contribution">
                                <input type="hidden" id="icf_amount" value="<?php echo $icf_amount;?>" name="icf_amount">
                                <input type="hidden" id="state_income_tax" value="<?php echo $state_income_tax;?>" name="state_income_tax">

                                <input type="hidden" id="month_year" value="<?php echo $salary_sheet_generate_info->name;?>" name="month_year">
                                <input type="hidden" id="ssg_id" value="<?php echo $ssg_id;?>" name="ssg_id">


                            </tr>
                        </tbody>
                    </table>

                    <!-- End Payment for Net Renumeration -->

                    <?php if(floatval($state_income_tax) > 0){?>

                    <!-- Payment for State Income Tax -->

                    <br>

                    <div class="col-sm-12">
                        <h3>Note: Sum of all payment amount should be equal to State Income Tax.</h3>
                    </div>

                    <table class="table table-bordered" id="tax_request_table">
                        <thead>
                            <tr>
                                <th width="50%">Payment Nature(Bank)</th>
                                <th width="40%">Amount(State Income Tax <?php echo $currency.' ';?><span style="color: green;"><b><?php echo ' '.$state_income_tax;?></b></span>)</th>
                                <th width="10%">Action</th>
                            </tr>
                        </thead>
                        <tbody id="tax_payment_request_item">
                            <tr>
                                <td>
                                    <select name="tax_payment_nature[]" class="form-control tax-payment-nature-select"  required="">
                                            <option value=""> Select Payment Nature</option>
                                        <?php if ($bank_payment_natures) { ?>
                                          <?php foreach($bank_payment_natures as $key => $value){?>
                                            <option value="<?php echo $key;?>"><?php echo $value;?></option>
                                            
                                        <?php }} ?>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" id="tax_amount" name="tax_amount[]" class="form-control tax-payment-amount" required step=".01">
                                </td>
                                <td>
                                    <a  id="add_tax_payment_item" class="btn btn-info btn-sm" name="add-invoice-item" onClick="add_key_tax_payment_item('tax_payment_request_item')"  tabindex="9"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
                                    <a class="btn btn-danger btn-sm"  value="<?php echo display('delete') ?>" onclick="deleteTaxPayRow(this)" tabindex="3"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>

                                <input type="hidden" id="tax_payment_list" value='<?php if ($bank_payment_natures) { ?><?php foreach($bank_payment_natures as $key => $value){?><option value="<?php echo $key;?>"><?php echo $value;?></option><?php }}?>' name="">
                            </tr>
                        </tbody>
                    </table>

                    <!-- End Payment for State Income Tax -->

                    <?php }?>

                    <?php if(floatval($total_npf_contribution) > 0){?>

                    <!-- Payment for NPF Contribution -->

                    <br>

                    <div class="col-sm-12">
                        <h3>Note: Sum of all payment amount should be equal to NPF Contribution Amount.</h3>
                    </div>

                    <table class="table table-bordered" id="npf_request_table">
                        <thead>
                            <tr>
                                <th width="50%">Payment Nature</th>
                                <th width="40%">15% NPF Contribution <?php echo $currency.' ';?><span style="color: green;"><b><?php echo ' '.$total_npf_contribution;?></b></span></th>
                                <!-- <th width="10%">Action</th> -->
                            </tr>
                        </thead>
                        <tbody id="npf_payment_request_item">
                            <tr>
                                <td>
                                    <select name="npf_payment_nature[]" class="form-control npf-payment-nature-select"  required="">
                                            <option value=""> Select Payment Nature</option>
                                        <?php if ($payment_natures) { ?>
                                          <?php foreach($payment_natures as $key => $value){?>
                                            <option value="<?php echo $key;?>"><?php echo $value;?></option>
                                            
                                        <?php }} ?>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" id="npf_amount" name="npf_amount[]" class="form-control npf-payment-amount" required step=".01" value="<?php echo $total_npf_contribution;?>" readonly>
                                </td>
                                

                                <input type="hidden" id="npf_payment_list" value='<?php if ($payment_natures) { ?><?php foreach($payment_natures as $key => $value){?><option value="<?php echo $key;?>"><?php echo $value;?></option><?php }}?>' name="">
                            </tr>
                        </tbody>
                    </table>

                    <!-- End Payment for NPF Contribution -->

                    <?php }?>

                    <?php if(floatval($icf_amount) > 0){?>

                    <!-- Payment for IICF Contribution -->

                    <br>

                    <div class="col-sm-12">
                        <h3>Note: Sum of all payment amount should be equal to IICF Contribution Amount.</h3>
                    </div>

                    <table class="table table-bordered" id="iicf_request_table">
                        <thead>
                            <tr>
                                <th width="50%">Payment Nature</th>
                                <th width="40%">1% IICF Contribution <?php echo $currency.' ';?><span style="color: green;"><b><?php echo ' '.$icf_amount;?></b></span></th>
                                <!-- <th width="10%">Action</th> -->
                            </tr>
                        </thead>
                        <tbody id="iicf_payment_request_item">
                            <tr>
                                <td>
                                    <select name="iicf_payment_nature[]" class="form-control iicf-payment-nature-select"  required="">
                                            <option value=""> Select Payment Nature</option>
                                        <?php if ($payment_natures) { ?>
                                          <?php foreach($payment_natures as $key => $value){?>
                                            <option value="<?php echo $key;?>"><?php echo $value;?></option>
                                            
                                        <?php }} ?>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" id="iicf_amount" name="iicf_amount[]" class="form-control iicf-payment-amount" required step=".01" value="<?php echo $icf_amount;?>" readonly>
                                </td>
                                

                                <input type="hidden" id="iicf_payment_list" value='<?php if ($payment_natures) { ?><?php foreach($payment_natures as $key => $value){?><option value="<?php echo $key;?>"><?php echo $value;?></option><?php }}?>' name="">
                            </tr>
                        </tbody>
                    </table>

                    <!-- End Payment for IICF Contribution -->

                    <?php }?>

                    <div class="form-group form-group-margin text-right">
                        <button type="submit" class="btn btn-success w-md m-b-5"><?php echo display('save') ?></button>
                    </div>

                </div>

                <?php echo form_close() ?>

            </div>

        </div>

        </div>
    </div>

</div>

<script type="text/javascript">

    //Global departments array
    var paymment_list = [];
    
    var count = 2;
    var limits = 500;

    var tax_paymment_list = [];
    
    var tax_count = 2;
    var tax_limits = 500;

    var npf_paymment_list = [];
    
    var npf_count = 2;
    var npf_limits = 500;

    var iicf_paymment_list = [];
    
    var iicf_count = 2;
    var iicf_limits = 500;
   
    "use strict";
    //Add request input field
    function add_key_payment_item(e) {

        var payment_list = $('#payment_list').val();

        var t = '<td><select name="payment_nature[]" class="form-control payment-nature-select" required=""><option value=""> Select  Payment Nature</option>'+payment_list+'</select> </td>'+

        '<td class=""><input type="number" id="amount" class="form-control payment-amount" name="amount[]" placeholder="" required step=".01"/></td>'+

        '<td> <a  id="add_payment_item" class="btn btn-info btn-sm" name="add-invoice-item" onClick="add_key_payment_item('+"payment_request_item"+')"><i class="fa fa-plus-square" aria-hidden="true"></i></a> <a class="btn btn-danger btn-sm"  value="" onclick="deleteRow(this)" ><i class="fa fa-trash" aria-hidden="true"></i></a></td>';

        count == limits ? alert("You have reached the limit of adding " + count + " inputs") : $("tbody#payment_request_item").append("<tr>" + t + "</tr>");
        count++;

        $("select.form-control:not(.dont-select-me)").select2({
            placeholder: "Select option",
            allowClear: true
        });

    }

    "use strict";
    function deleteRow(e) {
        var t = $("#request_table > tbody > tr").length;
        if (1 == t) alert("There only one row you can't delete.");
        else {
            var a = e.parentNode.parentNode;
            a.parentNode.removeChild(a)
        }

        // Setting new all paymment_nature to global paymment_list array
        paymment_list = [];
        $("tr td .payment-nature-select").each(function() {
            var paymment_select_val = $(this).val();
            paymment_list.push(paymment_select_val)
        });

        // console.log(typeof paymment_list);
        
        //Net Renumeration is exceeding, please take valid amount as input

        var net_salary = '<?php echo $net_salary;?>';
        var net_renumeration = parseFloat(net_salary);

        var total_amount = 0.0;
        $(".payment-amount").each(function() {
            total_amount = total_amount + parseFloat($(this).val());
        });

        //State Income Tax Amount is exceeding, please take valid amount as input
        var state_income_tax = 0.0;
        var tax_total_amount = 0.0;

        var income_tax = '<?php echo $state_income_tax;?>';
        if(parseFloat(income_tax) > 0){

            state_income_tax = parseFloat(income_tax);
        
            $(".tax-payment-amount").each(function() {
                tax_total_amount = tax_total_amount + parseFloat($(this).val());
            });
        }
        
        //NPF Contribution Amount is exceeding, please take valid amount as input

        var total_npf_contribution = 0.0;
        var total_npf_amount       = 0.0;

        var npf_contribution = '<?php echo $total_npf_contribution;?>';
        if(parseFloat(npf_contribution) > 0){
            
            total_npf_contribution = parseFloat(npf_contribution);
        
            $(".npf-payment-amount").each(function() {
                total_npf_amount = total_npf_amount + parseFloat($(this).val());
            });
        }

        //IICF Contribution Amount is exceeding, please take valid amount as input

        var icf_amount       = 0.0;
        var total_icf_amount = 0.0;

        var icf_contribution = '<?php echo $icf_amount;?>';
        if(parseFloat(icf_contribution) > 0){
            
            icf_amount = parseFloat(icf_contribution);
        
            $(".iicf-payment-amount").each(function() {
                total_icf_amount = total_icf_amount + parseFloat($(this).val());
            });
        }

        if(net_renumeration == total_amount && state_income_tax == tax_total_amount && total_npf_contribution == total_npf_amount && icf_amount == total_icf_amount){
            
            $(':input[type="submit"]').prop('disabled', false);
        }else{
            $(':input[type="submit"]').prop('disabled', true);
        }
       
    }

    // Store all the selected paymment_list for ignoring dulicate selection 
    $('body').on('change', '.payment-nature-select', function() {

        

        var msg = 'Payment nature already selected';    

        //check if value already exists in departments array..
        var paymment_select_val = $(this).val();
        if(paymment_list.indexOf(paymment_select_val) >= 0){

            $(this).val('').trigger('change');
            alert(msg)

        }

        paymment_list = [];
        $("tr td .payment-nature-select").each(function() {
            var paymment_select_val = $(this).val();
            paymment_list.push(paymment_select_val)
        });

        //Removing empty value
        paymment_list = paymment_list.filter(item => item);
        

    });

    $('body').on('keyup', '.payment-amount', function() {


        var msg = 'Net Salary is exceeding, please take valid amount as input !';
        var net_salary = '<?php echo $net_salary;?>';
        var net_renumeration = parseFloat(net_salary);

        var total_amount = 0.0;
        $(".payment-amount").each(function() {
            total_amount = total_amount + parseFloat($(this).val());
        });

        //State Income Tax Amount is exceeding, please take valid amount as input
        var state_income_tax = 0.0;
        var tax_total_amount = 0.0;

        var income_tax = '<?php echo $state_income_tax;?>';
        if(parseFloat(income_tax) > 0){

            state_income_tax = parseFloat(income_tax);
        
            $(".tax-payment-amount").each(function() {
                tax_total_amount = tax_total_amount + parseFloat($(this).val());
            });
        }
        
        //NPF Contribution Amount is exceeding, please take valid amount as input

        var total_npf_contribution = 0.0;
        var total_npf_amount       = 0.0;

        var npf_contribution = '<?php echo $total_npf_contribution;?>';
        if(parseFloat(npf_contribution) > 0){
            
            total_npf_contribution = parseFloat(npf_contribution);
        
            $(".npf-payment-amount").each(function() {
                total_npf_amount = total_npf_amount + parseFloat($(this).val());
            });
        }

        //IICF Contribution Amount is exceeding, please take valid amount as input

        var icf_amount       = 0.0;
        var total_icf_amount = 0.0;

        var icf_contribution = '<?php echo $icf_amount;?>';
        if(parseFloat(icf_contribution) > 0){
            
            icf_amount = parseFloat(icf_contribution);
        
            $(".iicf-payment-amount").each(function() {
                total_icf_amount = total_icf_amount + parseFloat($(this).val());
            });
        }

        if(net_renumeration == total_amount && state_income_tax == tax_total_amount && total_npf_contribution == total_npf_amount && icf_amount == total_icf_amount){
            
            $(':input[type="submit"]').prop('disabled', false);
        }else{
            $(':input[type="submit"]').prop('disabled', true);
        }
        //console.log(total_amount);

    });

    /*state Income tax Js starts*/

    "use strict";
    //Add request input field
    function add_key_tax_payment_item(e) {

        var tax_payment_list = $('#tax_payment_list').val();

        var t = '<td><select name="tax_payment_nature[]" class="form-control tax-payment-nature-select" required=""><option value=""> Select  Payment Nature</option>'+tax_payment_list+'</select> </td>'+

        '<td class=""><input type="number" id="tax_amount" class="form-control tax-payment-amount" name="tax_amount[]" placeholder="" required step=".01"/></td>'+

        '<td> <a  id="add_tax_payment_item" class="btn btn-info btn-sm" name="add-invoice-item" onClick="add_key_tax_payment_item('+"tax_payment_request_item"+')"><i class="fa fa-plus-square" aria-hidden="true"></i></a> <a class="btn btn-danger btn-sm"  value="" onclick="deleteTaxPayRow(this)" ><i class="fa fa-trash" aria-hidden="true"></i></a></td>';

        tax_count == tax_limits ? alert("You have reached the limit of adding " + tax_count + " inputs") : $("tbody#tax_payment_request_item").append("<tr>" + t + "</tr>");
        tax_count++;

        $("select.form-control:not(.dont-select-me)").select2({
            placeholder: "Select option",
            allowClear: true
        });

    }

    "use strict";
    function deleteTaxPayRow(e) {
        var t = $("#tax_request_table > tbody > tr").length;
        if (1 == t) alert("There only one row you can't delete.");
        else {
            var a = e.parentNode.parentNode;
            a.parentNode.removeChild(a)
        }

        // Setting new all paymment_nature to global paymment_list array
        tax_paymment_list = [];
        $("tr td .tax-payment-nature-select").each(function() {
            var tax_paymment_select_val = $(this).val();
            tax_paymment_list.push(tax_paymment_select_val)
        });

        // console.log(typeof tax_paymment_list);

        //Net Renumeration is exceeding, please take valid amount as input

        var net_salary = '<?php echo $net_salary;?>';
        var net_renumeration = parseFloat(net_salary);

        var total_amount = 0.0;
        $(".payment-amount").each(function() {
            total_amount = total_amount + parseFloat($(this).val());
        });
        
        //State Income Tax Amount is exceeding, please take valid amount as input

        var state_income_tax = 0.0;
        var tax_total_amount = 0.0;

        var income_tax = '<?php echo $state_income_tax;?>';
        if(parseFloat(income_tax) > 0){
            
            state_income_tax = parseFloat(income_tax);
        
            $(".tax-payment-amount").each(function() {
                tax_total_amount = tax_total_amount + parseFloat($(this).val());
            });
        }

        //NPF Contribution Amount is exceeding, please take valid amount as input

        var total_npf_contribution = 0.0;
        var total_npf_amount       = 0.0;

        var npf_contribution = '<?php echo $total_npf_contribution;?>';
        if(parseFloat(npf_contribution) > 0){
            
            total_npf_contribution = parseFloat(npf_contribution);
        
            $(".npf-payment-amount").each(function() {
                total_npf_amount = total_npf_amount + parseFloat($(this).val());
            });
        }

        //IICF Contribution Amount is exceeding, please take valid amount as input

        var icf_amount       = 0.0;
        var total_icf_amount = 0.0;

        var icf_contribution = '<?php echo $icf_amount;?>';
        if(parseFloat(icf_contribution) > 0){
            
            icf_amount = parseFloat(icf_contribution);
        
            $(".iicf-payment-amount").each(function() {
                total_icf_amount = total_icf_amount + parseFloat($(this).val());
            });
        }

        if(net_renumeration == total_amount && state_income_tax == tax_total_amount && total_npf_contribution == total_npf_amount && icf_amount == total_icf_amount){
            
            $(':input[type="submit"]').prop('disabled', false);
        }else{
            $(':input[type="submit"]').prop('disabled', true);
        }
       
    }

    // Store all the selected tax_paymment_list for ignoring dulicate selection 
    $('body').on('change', '.tax-payment-nature-select', function() {

        
        var msg = 'Payment nature for State Income Tax already selected';    

        //check if value already exists in departments array..
        var tax_paymment_select_val = $(this).val();
        if(tax_paymment_list.indexOf(tax_paymment_select_val) >= 0){

            $(this).val('').trigger('change');
            alert(msg)

        }

        tax_paymment_list = [];
        $("tr td .tax-payment-nature-select").each(function() {
            var tax_paymment_select_val = $(this).val();
            tax_paymment_list.push(tax_paymment_select_val)
        });

        //Removing empty value
        tax_paymment_list = tax_paymment_list.filter(item => item);

    });

    $('body').on('keyup', '.tax-payment-amount', function() {

        var msg = 'State income Tax is exceeding, please take valid amount as input !';

        //Net Renumeration is exceeding, please take valid amount as input
        var net_salary = '<?php echo $net_salary;?>';
        var net_renumeration = parseFloat(net_salary);

        var total_amount = 0.0;
        $(".payment-amount").each(function() {
            total_amount = total_amount + parseFloat($(this).val());
        });

        //State Income Tax Amount is exceeding, please take valid amount as input

        var state_income_tax = 0.0;
        var tax_total_amount = 0.0;

        var income_tax = '<?php echo $state_income_tax;?>';
        if(parseFloat(income_tax) > 0){
            
            state_income_tax = parseFloat(income_tax);
        
            $(".tax-payment-amount").each(function() {
                tax_total_amount = tax_total_amount + parseFloat($(this).val());
            });
        }

        //NPF Contribution Amount is exceeding, please take valid amount as input

        var total_npf_contribution = 0.0;
        var total_npf_amount       = 0.0;

        var npf_contribution = '<?php echo $total_npf_contribution;?>';
        if(parseFloat(npf_contribution) > 0){
            
            total_npf_contribution = parseFloat(npf_contribution);
        
            $(".npf-payment-amount").each(function() {
                total_npf_amount = total_npf_amount + parseFloat($(this).val());
            });
        }

        //IICF Contribution Amount is exceeding, please take valid amount as input

        var icf_amount       = 0.0;
        var total_icf_amount = 0.0;

        var icf_contribution = '<?php echo $icf_amount;?>';
        if(parseFloat(icf_contribution) > 0){
            
            icf_amount = parseFloat(icf_contribution);
        
            $(".iicf-payment-amount").each(function() {
                total_icf_amount = total_icf_amount + parseFloat($(this).val());
            });
        }

        if(net_renumeration == total_amount && state_income_tax == tax_total_amount && total_npf_contribution == total_npf_amount && icf_amount == total_icf_amount){

            $(':input[type="submit"]').prop('disabled', false);
        }else{
            $(':input[type="submit"]').prop('disabled', true);
        }
        //console.log(total_amount);

    });

    /*State income tax js ends*/

    /*NPF Contribution Js starts*/

    "use strict";
    //Add request input field
    function add_key_npf_payment_item(e) {

        var npf_payment_list = $('#npf_payment_list').val();

        var t = '<td><select name="npf_payment_nature[]" class="form-control npf-payment-nature-select" required=""><option value=""> Select  Payment Nature</option>'+npf_payment_list+'</select> </td>'+

        '<td class=""><input type="number" id="npf_amount" class="form-control npf-payment-amount" name="npf_amount[]" placeholder="" required step=".01"/></td>'+

        '<td> <a  id="add_npf_payment_item" class="btn btn-info btn-sm" name="add-invoice-item" onClick="add_key_npf_payment_item('+"npf_payment_request_item"+')"><i class="fa fa-plus-square" aria-hidden="true"></i></a> <a class="btn btn-danger btn-sm"  value="" onclick="deleteNpfPayRow(this)" ><i class="fa fa-trash" aria-hidden="true"></i></a></td>';

        npf_count == npf_limits ? alert("You have reached the limit of adding " + npf_count + " inputs") : $("tbody#npf_payment_request_item").append("<tr>" + t + "</tr>");
        npf_count++;

        $("select.form-control:not(.dont-select-me)").select2({
            placeholder: "Select option",
            allowClear: true
        });

    }

    "use strict";
    function deleteNpfPayRow(e) {
        var t = $("#npf_request_table > tbody > tr").length;
        if (1 == t) alert("There only one row you can't delete.");
        else {
            var a = e.parentNode.parentNode;
            a.parentNode.removeChild(a)
        }

        // Setting new all paymment_nature to global paymment_list array
        npf_paymment_list = [];
        $("tr td .npf-payment-nature-select").each(function() {
            var npf_paymment_select_val = $(this).val();
            npf_paymment_list.push(npf_paymment_select_val)
        });


        //NPF Contribution is exceeding, please take valid amount as input

        var net_salary = '<?php echo $net_salary;?>';
        var net_renumeration = parseFloat(net_salary);

        var total_amount = 0.0;
        $(".payment-amount").each(function() {
            total_amount = total_amount + parseFloat($(this).val());
        });
        
        //State Income Tax Amount is exceeding, please take valid amount as input

        var state_income_tax = 0.0;
        var tax_total_amount = 0.0;

        var income_tax = '<?php echo $state_income_tax;?>';
        if(parseFloat(income_tax) > 0){
            
            state_income_tax = parseFloat(income_tax);
        
            $(".tax-payment-amount").each(function() {
                tax_total_amount = tax_total_amount + parseFloat($(this).val());
            });
        }

        //NPF Contribution Amount is exceeding, please take valid amount as input

        var total_npf_contribution = 0.0;
        var total_npf_amount       = 0.0;

        var npf_contribution = '<?php echo $total_npf_contribution;?>';
        if(parseFloat(npf_contribution) > 0){
            
            total_npf_contribution = parseFloat(npf_contribution);
        
            $(".npf-payment-amount").each(function() {
                total_npf_amount = total_npf_amount + parseFloat($(this).val());
            });
        }

        //IICF Contribution Amount is exceeding, please take valid amount as input

        var icf_amount       = 0.0;
        var total_icf_amount = 0.0;

        var icf_contribution = '<?php echo $icf_amount;?>';
        if(parseFloat(icf_contribution) > 0){
            
            icf_amount = parseFloat(icf_contribution);
        
            $(".iicf-payment-amount").each(function() {
                total_icf_amount = total_icf_amount + parseFloat($(this).val());
            });
        }

        if(net_renumeration == total_amount && state_income_tax == tax_total_amount && total_npf_contribution == total_npf_amount && icf_amount == total_icf_amount){

            $(':input[type="submit"]').prop('disabled', false);
        }else{
            $(':input[type="submit"]').prop('disabled', true);
        }
       
    }

    // Store all the selected tax_paymment_list for ignoring dulicate selection 
    $('body').on('change', '.npf-payment-nature-select', function() {


        var msg = 'Payment nature for NPF Contribution already selected';    

        //check if value already exists in departments array..
        var npf_paymment_select_val = $(this).val();
        if(npf_paymment_list.indexOf(npf_paymment_select_val) >= 0){

            $(this).val('').trigger('change');
            alert(msg)

        }

        npf_paymment_list = [];
        $("tr td .npf-payment-nature-select").each(function() {
            var npf_paymment_select_val = $(this).val();
            npf_paymment_list.push(npf_paymment_select_val)
        });

        //Removing empty value
        npf_paymment_list = npf_paymment_list.filter(item => item);
        

    });

    $('body').on('keyup', '.npf-payment-amount', function() {

        var msg = 'NPF Contribution exceeding, please take valid amount as input !';

        //Net Renumeration is exceeding, please take valid amount as input
        var net_salary = '<?php echo $net_salary;?>';
        var net_renumeration = parseFloat(net_salary);

        var total_amount = 0.0;
        $(".payment-amount").each(function() {
            total_amount = total_amount + parseFloat($(this).val());
        });

        //State Income Tax Amount is exceeding, please take valid amount as input

        var state_income_tax = 0.0;
        var tax_total_amount = 0.0;

        var income_tax = '<?php echo $state_income_tax;?>';
        if(parseFloat(income_tax) > 0){
            
            state_income_tax = parseFloat(income_tax);
        
            $(".tax-payment-amount").each(function() {
                tax_total_amount = tax_total_amount + parseFloat($(this).val());
            });
        }

        //NPF Contribution Amount is exceeding, please take valid amount as input

        var total_npf_contribution = 0.0;
        var total_npf_amount       = 0.0;

        var npf_contribution = '<?php echo $total_npf_contribution;?>';
        if(parseFloat(npf_contribution) > 0){
            
            total_npf_contribution = parseFloat(npf_contribution);
        
            $(".npf-payment-amount").each(function() {
                total_npf_amount = total_npf_amount + parseFloat($(this).val());
            });
        }

        //IICF Contribution Amount is exceeding, please take valid amount as input

        var icf_amount       = 0.0;
        var total_icf_amount = 0.0;

        var icf_contribution = '<?php echo $icf_amount;?>';
        if(parseFloat(icf_contribution) > 0){
            
            icf_amount = parseFloat(icf_contribution);
        
            $(".iicf-payment-amount").each(function() {
                total_icf_amount = total_icf_amount + parseFloat($(this).val());
            });
        }

        if(net_renumeration == total_amount && state_income_tax == tax_total_amount && total_npf_contribution == total_npf_amount && icf_amount == total_icf_amount){

            $(':input[type="submit"]').prop('disabled', false);
        }else{
            $(':input[type="submit"]').prop('disabled', true);
        }
        //console.log(total_amount);

    });

    /*NPF Contribution js ends*/

   /*IICF Contribution Js starts*/

    "use strict";
    //Add request input field
    function add_key_iicf_payment_item(e) {

        var iicf_payment_list = $('#iicf_payment_list').val();

        var t = '<td><select name="iicf_payment_nature[]" class="form-control iicf-payment-nature-select" required=""><option value=""> Select  Payment Nature</option>'+iicf_payment_list+'</select> </td>'+

        '<td class=""><input type="number" id="iicf_amount" class="form-control iicf-payment-amount" name="iicf_amount[]" placeholder="" required step=".01"/></td>'+

        '<td> <a  id="add_iicf_payment_item" class="btn btn-info btn-sm" name="add-invoice-item" onClick="add_key_iicf_payment_item('+"iicf_payment_request_item"+')"><i class="fa fa-plus-square" aria-hidden="true"></i></a> <a class="btn btn-danger btn-sm"  value="" onclick="deleteIicfPayRow(this)" ><i class="fa fa-trash" aria-hidden="true"></i></a></td>';

        iicf_count == iicf_limits ? alert("You have reached the limit of adding " + iicf_count + " inputs") : $("tbody#iicf_payment_request_item").append("<tr>" + t + "</tr>");
        iicf_count++;

        $("select.form-control:not(.dont-select-me)").select2({
            placeholder: "Select option",
            allowClear: true
        });

    }

    "use strict";
    function deleteIicfPayRow(e) {
        var t = $("#iicf_request_table > tbody > tr").length;
        if (1 == t) alert("There only one row you can't delete.");
        else {
            var a = e.parentNode.parentNode;
            a.parentNode.removeChild(a)
        }

        // Setting new all paymment_nature to global paymment_list array
        iicf_paymment_list = [];
        $("tr td .iicf-payment-nature-select").each(function() {
            var iicf_paymment_select_val = $(this).val();
            iicf_paymment_list.push(iicf_paymment_select_val)
        });

        // console.log(typeof iicf_paymment_list);

        //NPF Contribution is exceeding, please take valid amount as input

        var net_salary = '<?php echo $net_salary;?>';
        var net_renumeration = parseFloat(net_salary);

        var total_amount = 0.0;
        $(".payment-amount").each(function() {
            total_amount = total_amount + parseFloat($(this).val());
        });
        
        //State Income Tax Amount is exceeding, please take valid amount as input

        var state_income_tax = 0.0;
        var tax_total_amount = 0.0;

        var income_tax = '<?php echo $state_income_tax;?>';
        if(parseFloat(income_tax) > 0){
            
            state_income_tax = parseFloat(income_tax);
        
            $(".tax-payment-amount").each(function() {
                tax_total_amount = tax_total_amount + parseFloat($(this).val());
            });
        }

        //NPF Contribution Amount is exceeding, please take valid amount as input

        var total_npf_contribution = 0.0;
        var total_npf_amount       = 0.0;

        var npf_contribution = '<?php echo $total_npf_contribution;?>';
        if(parseFloat(npf_contribution) > 0){
            
            total_npf_contribution = parseFloat(npf_contribution);
        
            $(".npf-payment-amount").each(function() {
                total_npf_amount = total_npf_amount + parseFloat($(this).val());
            });
        }

        //IICF Contribution Amount is exceeding, please take valid amount as input

        var icf_amount       = 0.0;
        var total_icf_amount = 0.0;

        var icf_contribution = '<?php echo $icf_amount;?>';
        if(parseFloat(icf_contribution) > 0){
            
            icf_amount = parseFloat(icf_contribution);
        
            $(".iicf-payment-amount").each(function() {
                total_icf_amount = total_icf_amount + parseFloat($(this).val());
            });
        }

        if(net_renumeration == total_amount && state_income_tax == tax_total_amount && total_npf_contribution == total_npf_amount && icf_amount == total_icf_amount){

            $(':input[type="submit"]').prop('disabled', false);
        }else{
            $(':input[type="submit"]').prop('disabled', true);
        }
       
    }

    // Store all the selected tax_paymment_list for ignoring dulicate selection 
    $('body').on('change', '.iicf-payment-nature-select', function() {


        var msg = 'Payment nature for IICF Contribution already selected';    

        //check if value already exists in departments array..
        var iicf_paymment_select_val = $(this).val();
        if(iicf_paymment_list.indexOf(iicf_paymment_select_val) >= 0){

            $(this).val('').trigger('change');
            alert(msg)

        }

        iicf_paymment_list = [];
        $("tr td .iicf-payment-nature-select").each(function() {
            var iicf_paymment_select_val = $(this).val();
            iicf_paymment_list.push(iicf_paymment_select_val)
        });

        //Removing empty value
        iicf_paymment_list = iicf_paymment_list.filter(item => item);

    });

    $('body').on('keyup', '.iicf-payment-amount', function() {

        var msg = 'IICF Contribution exceeding, please take valid amount as input !';

        //Net Renumeration is exceeding, please take valid amount as input
        var net_salary = '<?php echo $net_salary;?>';
        var net_renumeration = parseFloat(net_salary);

        var total_amount = 0.0;
        $(".payment-amount").each(function() {
            total_amount = total_amount + parseFloat($(this).val());
        });

        //State Income Tax Amount is exceeding, please take valid amount as input

        var state_income_tax = 0.0;
        var tax_total_amount = 0.0;

        var income_tax = '<?php echo $state_income_tax;?>';
        if(parseFloat(income_tax) > 0){
            
            state_income_tax = parseFloat(income_tax);
        
            $(".tax-payment-amount").each(function() {
                tax_total_amount = tax_total_amount + parseFloat($(this).val());
            });
        }

        //NPF Contribution Amount is exceeding, please take valid amount as input

        var total_npf_contribution = 0.0;
        var total_npf_amount       = 0.0;

        var npf_contribution = '<?php echo $total_npf_contribution;?>';
        if(parseFloat(npf_contribution) > 0){
            
            total_npf_contribution = parseFloat(npf_contribution);
        
            $(".npf-payment-amount").each(function() {
                total_npf_amount = total_npf_amount + parseFloat($(this).val());
            });
        }

        //IICF Contribution Amount is exceeding, please take valid amount as input

        var icf_amount       = 0.0;
        var total_icf_amount = 0.0;

        var icf_contribution = '<?php echo $icf_amount;?>';
        if(parseFloat(icf_contribution) > 0){
            
            icf_amount = parseFloat(icf_contribution);
        
            $(".iicf-payment-amount").each(function() {
                total_icf_amount = total_icf_amount + parseFloat($(this).val());
            });
        }

        if(net_renumeration == total_amount && state_income_tax == tax_total_amount && total_npf_contribution == total_npf_amount && icf_amount == total_icf_amount){

            $(':input[type="submit"]').prop('disabled', false);
        }else{
            $(':input[type="submit"]').prop('disabled', true);
        }
        //console.log(total_amount);

    });

    /*IICF Contribution js ends*/

    $(document).ready(function() { 

        "use strict";

        $(':input[type="submit"]').prop('disabled', true);

        var flag = 0;
        $('#payment_area').hide();
        // Check interpersonal_score can not be more than 10
        $('#post_button').on('click', function(){

            flag = flag + 1;

            if(flag%2 == 1){
                $('#payment_area').show();
            }else{
                $('#payment_area').hide();
            }
        });

    });
    

</script>