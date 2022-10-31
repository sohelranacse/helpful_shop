
<div class="row">
    <?php echo  form_open_multipart('account/accounts/bulk_voucher_approve', array('onsubmit'=>'return checkValue();')) ?>
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4>
                        <?php if($this->permission1->method('aprove_v','update')->access()) {?>
                           <input type="submit" name="bulkapproved" id="bulkapproved" value="Approve All" class="btn btn-success" >

                        <?php } ?>
                      
                    </h4>
                </div>
            </div>
            <div class="panel-body">

                <div class="table-responsive">
                    <table class="datatableReport table table-bordered table-hover" cellspacing="0" width="100%" id="vpproveList">
                        <thead>
                            <tr>
                                <th><input type="checkbox" value="1" name="selectAll" id="selectAll" onclick="checkAll(this)"/> &nbsp; <?php echo display('sl_no') ?></th>
                                <th><?php echo display('invoice_no') ?></th>
                                <th><?php echo display('voucher_no') ?></th>
                                <th><?php echo display('account') ?></th>
                                <th><?php echo display('remark') ?></th>
                                <th><?php echo display('debit') ?></th>
                                <th><?php echo display('credit') ?></th>
                                <th><?php echo display('action') ?></th> 
                            </tr>
                        </thead>
                        <tbody>
                         
                            
                        </tbody> 
                    </table>
                 
                </div>
            </div> 
        </div>
        <input type="hidden" id="currency" value="<?php echo $currency;?>" name="">
    </div>
     <?php echo form_close()?>
</div>
<script src="<?php echo base_url('my-assets/js/admin_js/voucher_approval.js') ?>" type="text/javascript"></script>
