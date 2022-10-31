<div class="row">
    <!--  table area -->
    <div class="col-sm-12">

        
            <div class="panel panel-bd lobidrag"> 
            
            <div class="panel-heading">
                <div class="panel-title">
                    <span><?php echo display('journal_voucher') ?></span>
                    <span class="padding-lefttitle">
                    <?php if($this->permission1->method('journal_voucher','create')->access()): ?>
                        <a href="<?php echo base_url("create_journal_voucher") ?>" class="btn btn-primary btn-md" ><i class="fa fa-plus-circle" aria-hidden="true"></i>
                    <?php echo display('create_journal_voucher');?></a> 
                    <?php endif; ?> 
                    
                    </span>
                </div>
            </div>
            <div class="panel-body">
                <table width="100%" class="datatableReport table table-striped table-bordered table-hover" cellspacing="0" width="100%" id="journalvList" title="journalVoucher">
                    <thead>
                        <tr>
                            <th><?php echo display('sl_no') ?></th>
                            <th><?php echo display('VNo') ?></th>
                            <th><?php echo display('date') ?></th>
                            <th><?php echo display('account_name') ?></th>
                            <th><?php echo display('ledgerComment') ?></th>
                            <th><?php echo display('subtype') ?></th>
                            <th><?php echo display('debit') ?></th> 
                            <th><?php echo display('credit') ?></th>
                            <th><?php echo display('reverseHead') ?></th>
                            <th><?php echo display('action') ?></th>
                          
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>  <!-- /.table-responsive -->
            </div>
        </div>
    </div>
</div>
<!-- view all transation modal -->
<div class="modal fade " id="allvaucherModal" tabindex="-1" role="dialog" aria-labelledby="moduleModalLabel" aria-hidden="true" >
    <div class="modal-dialog custom-modal-dialog" style="min-width: 76%;">
        <div class="modal-content " >
            <div class="modal-header">
                <h5 class="modal-title font-weight-600" id="allAppointModalLabel">Vaucher Detail</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> 
            <div class="modal-body" id="all_vaucher_view"> 
                
            </div>
            <div class="p-20 text-right">
                <button class="btn btn-warning" name="btnPrint" id="btnPrint" onclick="printVaucher('all_vaucher_view');"><i class='fa fa-print'></i>  Print </button>
                
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class='fa fa-cross'></i> close</button>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url('my-assets/js/admin_js/journal_voucher_list.js') ?>" type="text/javascript"></script>
