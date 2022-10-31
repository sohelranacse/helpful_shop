
        <div class="row">
            <div class="col-sm-12">
                

                    <a href="<?php echo base_url('closing_report') ?>" class="btn btn-primary m-b-5 m-r-2"><i class="ti-align-justify"> </i>  <?php echo display('closing_report') ?> </a>

              
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo display('closing_account') ?></h4>
                        </div>
                    </div>
                    <div class="panel-body">

                        <div class="text-center">
                            
                            <h3> <?php echo $company_info[0]['company_name']?> </h3>
                            <h4><?php echo $company_info[0]['address']?> </h4>
                            <h4><?php echo display('cash_closing') ?> </h4>
                          
                            <h4> <?php echo display('date') ?>:<?php echo date("d/m/Y"); ?> </h4>
                        </div>

                      <hr>

                         <?php if($pay_methods){
                            $key = 1;
                        foreach($pay_methods as $pmethods){
                            $seller_id = $this->session->userdata('id');
                            $headcode = $pmethods->HeadCode;
                            $total_in = $this->report_model->received_bypayment_method($seller_id,$headcode);
                            $total_out = $this->report_model->paid_bypayment_method($seller_id,$headcode);
                            $closing_bal = ($total_in?$total_in:0) - ($total_out?$total_out:0);
                        ?>

                        <div class="text-center"><h3><?php echo $pmethods->HeadName ?></h3></div>
                        
                          <div class="form-group row">
                            <label for="cash_in_hand" class="col-sm-3 col-form-label"><?php echo display('opening_balance') ?></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control valid_number text-right" id="opening_balance_<?php echo $key;?>" name="opening_balance" value=""  onkeyup="closing_balance_calculation(<?php echo $key;?>)" onchange="closing_balance_calculation(<?php echo $key;?>)" />
                               
                            </div>
                        </div>

                         <div class="form-group row">
                            <label for="total_received" class="col-sm-3 col-form-label"><?php echo display('total_received') ?></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control valid_number text-right" id="total_received_<?php echo $key;?>" name="total_received" readonly="" value="<?php echo ($total_in?$total_in:0)?>"  required />
                               
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="total_paid" class="col-sm-3 col-form-label"><?php echo display('total_paid') ?></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control valid_number text-right" id="total_paid_<?php echo $key;?>" name="total_paid" readonly="" value="<?php echo ($total_out?$total_out:0)?>"  required />
                               
                            </div>
                        </div>

                         <div class="form-group row">
                            <label for="closing_balance" class="col-sm-3 col-form-label"><?php echo display('closing_balance') ?></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control valid_number text-right" id="closing_balance_<?php echo $key;?>" name="closing_balance" readonly="" value="<?php echo number_format($closing_bal,2)?>"  required />
                               
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="save_closing" class="col-sm-3 col-form-label"> <input type="hidden" name="headcode" id="head_code_<?php echo $key;?>" value="<?php echo $pmethods->HeadCode?>"></label>
                            <div class="col-sm-6">
                                <button type="button" id="save_closing" class="btn btn-success form-control" name="save_closing"   onclick="save_closing(<?php echo $key;?>)">save</button>
                            </div>
                        </div>
                        <hr>
                    <?php $key++;}}?>
                    </div>

                   
                </div>
            </div>
            <div class="col-sm-6">   
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo display('cash_in_hand') ?></h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center"><?php echo display('note_name') ?></th>
                                    <th class="text-center"><?php echo display('pcs') ?></th>
                                    <th class="text-center"><?php echo display('ammount') ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                 <tr>
                                    <td class="2000"><?php echo '2000'; ?></td>
                                    <td><input type="number" class="form-control text_0 text-right" name="thousands" onkeyup="cashCalculator()"  onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_0_bal text-right" readonly=""></td>
                                </tr> 
                                <tr>
                                    <td class="1000"><?php echo display('1000') ?></td>
                                    <td><input type="number" class="form-control text_1 text-right" name="thousands" onkeyup="cashCalculator()"  onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_1_bal text-right" readonly=""></td>
                                </tr> 
                                <tr>
                                    <td class="500"><?php echo display('500') ?></td>
                                    <td><input type="number" class="form-control text_2 text-right" name="fivehnd" onkeyup="cashCalculator()" onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_2_bal text-right" readonly=""></td>
                                </tr>   
                                <tr>
                                    <td class="100"><?php echo display('100') ?></td>
                                    <td><input type="number" class="form-control text_3 text-right" name="hundrad" onkeyup="cashCalculator()" onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_3_bal text-right" readonly=""></td>
                                </tr>   
                                <tr>
                                    <td class="50"><?php echo display('50') ?></td>
                                    <td><input type="number" class="form-control text_4 text-right" name="fifty" onkeyup="cashCalculator()" onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_4_bal text-right" readonly=""></td>
                                </tr>   
                                <tr>
                                    <td class="20"><?php echo display('20') ?></td>
                                    <td><input type="number" class="form-control text_5 text-right" name="twenty" onkeyup="cashCalculator()" onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_5_bal text-right" readonly=""></td>
                                </tr>   
                                <tr>
                                    <td class="10"><?php echo display('10') ?></td>
                                    <td><input type="number" class="form-control text_6 text-right" name="ten" onkeyup="cashCalculator()" onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_6_bal text-right" readonly=""></td>
                                </tr>   
                                <tr>
                                    <td class="5"><?php echo display('5') ?></td>
                                    <td><input type="number" class="form-control text_7 text-right" name="five" onkeyup="cashCalculator()" onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_7_bal text-right" readonly=""></td>
                                </tr>   
                                <tr>
                                    <td class="2"><?php echo display('2') ?></td>
                                    <td><input type="number" class="form-control text_8 text-right" name="two" onkeyup="cashCalculator()" onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_8_bal text-right" readonly=""></td>
                                </tr>
                                <tr>
                                    <td class="1"><?php echo display('1') ?></td>
                                    <td><input type="number" class="form-control text_9 text-right" name="one" onkeyup="cashCalculator()" onchange="cashCalculator()"></td>
                                    <td><input type="text" class="form-control text_9_bal text-right" readonly=""></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2" align="right"><b><?php echo display('grand_total') ?></b></td>
                                    <td class=""><input type="text" class="form-control total_money text-right" readonly="" name="grndtotal"></td>
                                </tr>
                              
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
  <script type="text/javascript">
          $('body').on('keypress','.valid_number', function(event) {
        var charCode = (event.which) ? event.which : event.keyCode;
        if (charCode != 46 && charCode != 45 && charCode > 31 &&
            (charCode < 48 || charCode > 57)){
            toastr.error('Please Input Valid Number');
            return false;
        }

        return true;

    }); 

        function closing_balance_calculation(sl) {
        var opening_balance = $("#opening_balance_"+sl).val(); 
        var total_received  = $("#total_received_"+sl).val(); 
        var total_paid      = $("#total_paid_"+sl).val();
        var closing = (opening_balance?parseFloat(opening_balance):0) + (total_received?parseFloat(total_received):0) - (total_paid?parseFloat(total_paid):0); 
        $("#closing_balance_"+sl).val(closing.toFixed(2, 2));      
      
          }

      function save_closing(sl) {
            var csrf_test_name   = $('[name="csrf_test_name"]').val();  
            var url              = $("#base_url").val();
            var opening_bal      = $("#opening_balance_"+sl).val(); 
            var total_received   = $("#total_received_"+sl).val();
            var total_paid       = $("#total_paid_"+sl).val();
            var closing          = $("#closing_balance_"+sl).val(); 
            var head_code        = $("#head_code_"+sl).val();     
            $.ajax({
                    url: url + "report/report/bdtask_add_closing",
                    type: "POST",
                    data: {opening_bal:opening_bal,total_received :total_received,total_paid:total_paid,closing:closing,head_code:head_code,csrf_test_name: csrf_test_name},
                    success: function(data) {
                        var obj = jQuery.parseJSON(data);
                      if(obj.status == 1){
                    toastr.success(obj.message);
                    }else{
                    toastr.error(obj.message);
                  }
                    },
                    error: function(xhr) {
                        alert('failed!');
                    }
                });
      }
  </script>




