<div class="col-md-12" id="vaucherPrintArea">
    <div class="row p-b-20 voucher-center">
        <div class="col-md-3">
            <img src="<?php echo base_url() . $settings_info->logo; ?>" alt="Logo" height="40px"><br><br>
        </div>
        <div class="col-md-6 text-center">
            <h2><?php echo $company_info[0]['company_name'] ?></h2>

            <strong><u class="pt-4"><?php echo 'Contra Voucher'; ?></u></strong>
        </div>
        <div class="col-md-3">
        <div class="pull-right" style="margin-right:20px;">
                <label class="font-weight-600 mb-0"><?php echo display('voucher_no');?></label> :
                <?php echo $results->VNo;?><br>
                <label class="font-weight-600 mb-0"><?php echo display('date');?></label> :
                <?php echo date('d/m/Y', strtotime($results->VDate));?>
            </div>
        </div>
        
    </div>

    <table class="table table-bordered table-sm mt-2">

        <thead>
            <tr>
                <th class="text-center"><?php echo display('particulars');?></th>
                <th class="text-center"><?php echo display('debit')?></th>
                <th class="text-center"><?php echo display('credit')?></th>

            </tr>


        </thead>
        <tbody>
            <?php
        	$Debit = 0;
        	$Credit = 0;
            if(!empty($results)){
            	foreach($results->details as $row){ 
            		$Debit = $row->Debit + ($row->Debit == '0.00'?$row->Credit:0);
            		$Credit = $row->Credit + ($row->Credit == '0.00'?$row->Debit:0);
            	?>
            <tr>
                <td><strong style="font-size: 15px;;"><?php echo $row->HeadName;?></strong><br>
                    <span> <?php echo $row->ledgerComment?></span>
                </td>
                <td class="text-right"><?php echo $settings_info->currency. ' '. $row->Debit;?></td>
                <td class="text-right"><?php echo $settings_info->currency. ' '. $row->Credit;?></td>
            </tr>
            <?php } }else{ ?>
            <tr>
                <td colspan="3" class="text-center text-danger"><?php echo get_notify('data_is_not_available');?></td>
            </tr>
            <?php }?>
            <tr>
                <td class="text-left"><strong style="font-size: 15px;"><?php echo $results->dbtcrdHead;?></strong></td>
                <td class="text-right">
                    <?php echo $settings_info->currency. ' '.  ($row->Debit == '0.00'?$row->Credit:0);?></td>
                <td class="text-right">
                    <?php echo $settings_info->currency. ' '.  ($row->Credit == '0.00'?$row->Debit:0);?></td>

            </tr>
        </tbody>
        <tfoot>
            <tr>
                <th class="text-right"><?php echo display('total');?></th>
                <th class="text-right"><?php echo $settings_info->currency. ' '. number_format($Debit, 2); ?>
                </th>
                <th class="text-right"><?php echo $settings_info->currency. ' '. number_format($Credit, 2); ?>
                </th>
            </tr>

            <tr>


                <th class="" colspan="3"><?php echo display('remark');?> : <?php echo $results->Narration; ?></th>
            </tr>
        </tfoot>
    </table>
    <div class="form-group row mt-100-50">
        <label for="name" class="col-lg-3 col-md-3 col-sm-3  col-form-label text-center">
            <div class="border-top"><?php echo display('prepared_by')?>: <?php echo $results->created_by;?></div>
        </label>
        <label for="name" class="col-lg-3 col-md-3 col-sm-3 col-form-label text-center">
            <div class="border-top"><?php echo display('checked_by')?></div>
        </label>
        <label for="name" class="col-lg-3 col-md-3 col-sm-3 col-form-label text-center">
            <div class="border-top"><?php echo display('authorised_by')?></div>
        </label>

    </div>
</div>