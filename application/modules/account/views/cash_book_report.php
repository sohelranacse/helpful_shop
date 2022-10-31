<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4>
                        <?php echo display('cash_book')?>
                    </h4>
                </div>
            </div>
            <div class="panel-body">
                <?php echo  form_open_multipart('','id="form1" name="form1"') ?>
                <div class="row" id="">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label"><?php echo display('cash')?></label>
                            <div class="col-sm-8">

                                <select name="cmbCode" class="form-control" id="cmbCode">
                                    <option value="">Select Bank</option>
                                    <?php  foreach($cashs as $cash) { echo $cash->HeadName; ?>
                                    <option value="<?php echo $cash->HeadCode;?>"
                                        <?php echo $cash->HeadCode==$cmbCode? 'selected' :'';?>>
                                        <?php echo $cash->HeadName;?></option>

                                    <?php  }   ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label"><?php echo display('from_date') ?></label>
                            <div class="col-sm-8">
                                <input type="text" name="dtpFromDate"
                                    value="<?php echo (!empty($dtpFromDate)?$dtpFromDate:'')?>"
                                    placeholder="<?php echo display('date') ?>" class="datepicker form-control">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label"><?php echo display('to_date') ?></label>
                            <div class="col-sm-8">
                                <input type="text" name="dtpToDate"
                                    value="<?php echo (!empty($dtpToDate)?$dtpToDate:'')?>"
                                    placeholder="<?php echo display('date') ?>" class="datepicker form-control">
                            </div>
                        </div>

                        <div class="form-group form-group-margin text-right">
                            <button type="submit" name="btnSave"
                                class="btn btn-success w-md m-b-5"><?php echo display('find') ?></button>
                        </div>
                    </div>
                </div>
                <?php echo form_close() ?>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div id="printableArea">
                    <div class="panel-body print-font-size">
                        <tr align="center">
                            <td id="ReportName"><b><?php echo display('cash_book_voucher')?></b></td>
                        </tr>
                        <div>
                            
                            <!-- <table class="print-table print-font-size" width="100%">
                                <tr>
                                    <td align="left" class="print-table-tr">
                                        <img src="<?php echo base_url().$setting->logo;?>" class="img-bottom-m print-logo"  alt="logo">
                                    </td>
                                    <td align="center" style="border-bottom: 2px #333 solid;">
                                    <strong class=""><?php echo html_escape($company_info[0]['company_name'])?></strong><br>
                                        
                                        <?php echo html_escape($company_info[0]['address']);?>
                                        <br>
                                        <?php echo html_escape($company_info[0]['email']);?>
                                        <br>
                                        <?php echo html_escape($company_info[0]['mobile']);?>
                                    </td>
                                    <?php $CurBalance =$prebalance;?>
                                    <td align="right" class="print-table-tr">
                                        <date> <?php echo display('date')?>: <?php echo date('d-M-Y'); ?> </date><br>
                                        <span  style="margin-left: 10px; margin-top: 15px;font-weight: 600;">
                                            <?php echo display('opening_balance')?> :
                                            <?php echo $currency. ' '.  number_format($prebalance,2,'.',','); ?>
                                            <br /> <?php echo display('closing_balance')?> :
                                            <?php echo $currency. ' '.  number_format($CurBalance,2,'.',','); ?>
                                        </span>
                                    </td>
                                </tr>

                            </table> -->

                            <div class="table-responsive">
                                <table width="100%" class="datatable table table-stripped table-hover print-font-size" cellpadding="6" cellspacing="1">

                                    
                                    <thead class="table-bordered">
                                        <tr>
                                            <td height="25" width="5%"><strong><?php echo display('sl');?></strong></td>
                                            <td width="10%"><strong><?php echo display('date');?></strong></td>
                                            <td width="10%"><strong><?php echo display('voucher_no');?></strong></td>
                                            <td width="8%"><strong><?php echo display('voucher_type');?></strong></td>

                                            <td width="12%"><strong><?php echo display('head_name');?></strong></td>

                                            <td width="12%"><strong><?php echo display('ledger_comment')?></strong></td>

                                            <td width="10%" align="right">
                                                <strong><?php echo display('debit');?></strong>
                                            </td>
                                            <td width="10%" align="right">
                                                <strong><?php echo display('credit');?></strong>
                                            </td>
                                            <td width="10%" align="right">
                                                <strong><?php echo display('balance');?></strong>
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody class="table-bordered">
                                        <?php              
                                        $TotalCredit=0;
                                        $TotalDebit  = 0;
                                        $CurBalance =$prebalance;
                                        $openid = 1; ?>
                                        <tr>
                                            <td height="25"><?php echo $openid ;?></td>
                                            <td><?php echo date('d-m-Y', strtotime($dtpFromDate)); ?></td>

                                            <td colspan="4" align="right"> <strong>Opening Balance</strong></td>
                                            <td align="right"><?php echo $currency. ' '.  number_format(0,2,'.',','); ?>
                                            </td>
                                            <td align="right"><?php echo $currency. ' '.  number_format(0,2,'.',','); ?>
                                            </td>
                                            <td align="right">
                                                <strong><?php echo $currency. ' '.  number_format($prebalance,2,'.',','); ?></strong>
                                            </td>
                                        </tr>
                                        <?php  
                                        foreach($HeadName2 as $key=>$data) { ?>
                                        <tr>
                                            <td height="25"><?php echo (++$key + $openid) ;?></td>
                                            <td><?php echo date('d-m-Y', strtotime($data->VDate)); ?></td>
                                            <td><?php echo $data->VNo; ?></td>
                                            <td><?php if($data->Vtype=='DV') {echo 'Debit';} else if($data->Vtype=='CV') { echo 'Credit';} else if ($data->Vtype=='JV') { echo 'Journal';} else { echo 'Contra';} ?>
                                            </td>
                                            <td><?php echo $data->HeadName; ?></td>
                                            <td><?php echo $data->ledgerComment; ?></td>

                                            <td align="right">
                                                <?php echo $currency. ' '.  number_format($data->Debit,2,'.',','); ?>
                                            </td>
                                            <td align="right">
                                                <?php echo $currency. ' '.  number_format($data->Credit,2,'.',','); ?>
                                            </td>

                                            <?php 
                                                $TotalDebit += $data->Debit;
                                                $TotalCredit += $data->Credit;
                                                if($HeadName->HeadType == 'A' || $HeadName->HeadType == 'E') {
                                                    if($data->Debit > 0) {
                                                        $CurBalance += $data->Debit;
                                                    }
                                                    if($data->Credit > 0) {
                                                        $CurBalance -= $data->Credit;
                                                    }                          
                                                } else {                       
                                                    if($data->Debit > 0) {
                                                        $CurBalance -= $data->Debit;
                                                    }                          
                                                    if($data->Credit > 0) {
                                                        $CurBalance += $data->Credit;
                                                    }                      } ?>
                                            <td align="right">
                                                <?php echo $currency. ' '.   number_format($CurBalance,2,'.',','); ?>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                    <tfoot class="table-bordered">
                                        <tr class="table_data">
                                            <td colspan="6" align="right"><strong><?php echo display('total')?></strong>
                                            </td>
                                            <td align="right">
                                                <strong><?php echo $currency. ' '.  number_format($TotalDebit,2,'.',','); ?></strong>
                                            </td>
                                            <td align="right">
                                                <strong><?php echo $currency. ' '.  number_format($TotalCredit,2,'.',','); ?></strong>
                                            </td>
                                            <td align="right">
                                                <strong><?php echo $currency. ' '.  number_format($CurBalance,2,'.',','); ?></strong>
                                            </td>
                                        </tr>
                                    </tfoot>
                                    </tbody>
                                    <caption class="text-center">
                                        <table class=" print-font-size" width="100%">
                                            <tr>
                                                <td align="left" style="border-bottom: 2px #333 solid;">
                                                    <img src="<?php echo base_url().$setting->logo;?>" class="img-bottom-m print-logo"
                                                        alt="logo">
                                                </td>
                                                <td align="center" style="border-bottom: 2px #333 solid;">
                                                    <strong
                                                        class=""><?php echo html_escape($company_info[0]['company_name'])?></strong><br>
                                                    
                                                    <?php echo html_escape($company_info[0]['address']);?>
                                                    <br>
                                                    <?php echo html_escape($company_info[0]['email']);?>
                                                    <br>
                                                    <?php echo html_escape($company_info[0]['mobile']);?>
                                                </td>
                                                <td align="right" style="border-bottom: 2px #333 solid;">
                                                    <date> <?php echo display('date')?>: <?php echo date('d-M-Y'); ?> </date><br>
                                                    <span style="margin-left: 10px; margin-top: 15px;font-weight: 600;">
                                                        <?php echo display('opening_balance')?> :
                                                        <?php echo $currency. ' '.  number_format($prebalance,2,'.',','); ?>
                                                        <br /> <?php echo display('closing_balance')?> :
                                                        <?php echo $currency. ' '.  number_format($CurBalance,2,'.',','); ?>
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </caption>
                                
                                    <caption class="text-center" style="border-bottom: 1px #c9c9c9 solid;">
                                        <strong> <?php echo display('cash_book_report')?>
                                                (<?php echo display('from')?>
                                                <?php echo (!empty($dtpFromDate)?$dtpFromDate:''); ?>
                                                <?php echo display('to')?>
                                                <?php echo (!empty($dtpToDate)?$dtpToDate:'');?>)
                                        <strong>
                                    </caption>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="text-center" id="print">
                    <input type="button" class="btn btn-warning" name="btnPrint" id="btnPrint" value="Print" onclick="printDivnew('printableArea');" />
                </div>
            </div>
        </div>
    </div>
</div>