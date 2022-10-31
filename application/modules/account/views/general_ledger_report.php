
<script src="<?php echo base_url('application/modules/account/assets/js/general_ledger_report_script.js'); ?>"
    type="text/javascript"></script>
<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd lobidrag">

            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo display('general_ledger_search') ?></h4>
                </div>
            </div>

            <div class="panel-body">
                <?php echo form_open('accounts_report_search',array('class' => 'form-inline','method'=>'post'))?>
                <div class="form-group form-group-margin">
                    <label for="employeelist"><?php echo display('transaction_head')?>:</label>

                </div>
                <div class="form-group form-group-new empdropdown">

                    <select class="form-control" name="cmbCode" id="cmbCode">
                        <option></option>
                        <?php
                                    foreach($general_ledger as $g_data){
                                        ?>
                        <option value="<?php echo $g_data->HeadCode;?>"
                            <?php echo  $g_data->HeadCode == $cmbCode  ? 'selected' : '' ;?>>
                            <?php echo $g_data->HeadName;?></option>
                        <?php
                                    }
                                    ?>
                    </select>
                </div>
                <div class="form-group form-group-new">
                    <label for="dtpFromDate"><?php echo display('from_date')?> :</label>
                    <input type="text" name="dtpFromDate" value="<?php echo   isset($dtpFromDate)? $dtpFromDate : date('Y-m-d'); ?>" class="datepicker form-control" />
                </div>
                <div class="form-group form-group-new">
                    <label for="dtpToDate"><?php echo display('to_date')?> :</label>
                    <input type="text" class="datepicker form-control" name="dtpToDate"
                        value="<?php echo  isset($dtpToDate)? $dtpToDate : date('Y-m-d'); ?>" />
                </div>
                <button type="submit" class="btn btn-success"><?php echo display('search') ?></button>

                <?php echo form_close()?>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4>
                        <?php echo display('general_ledger');?>
                    </h4>
                </div>
                <div id="printableArea">
                    <table class="print-table print-font-size" width="100%">
                        <tr>
                            <td align="left" class="print-table-tr">
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
                            <?php $CurBalance =$prebalance;?>
                            <td align="right" class="print-table-tr">
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
                    <div class="table-responsive " id="printArea">
                        <table width="99%" class="datatable table-bordered table table-striped print-font-size table-hover general_ledger_report_tble">
                            <caption class="text-center">
                                <strong>
                                    <?php echo display('general_ledger_of').' '.$ledger->HeadName.' on '.date('d-m-Y', strtotime($dtpFromDate)). ' To '  .date('d-m-Y', strtotime($dtpToDate));?>
                                </strong>
                            </caption>
                            <thead>
                                
                                
                                    <th height="25" width="5%"><strong><?php echo display('sl');?></strong></th>
                                    <th width="10%"><strong><?php echo display('date');?></strong></th>
                                    <th width="10%"><strong><?php echo display('voucher_no');?></strong></th>
                                    <th width="8%"><strong><?php echo display('voucher_type');?></strong></th>

                                    <th width="12%"><strong><?php echo display('head_name');?></strong></th>

                                    <th width="15%"><strong><?php echo display('ledger_comment')?></strong></th>

                                    <th width="10%" align="right"><strong><?php echo display('debit');?></strong></th>
                                    <th width="10%" align="right"><strong><?php echo display('credit');?></strong></th>
                                    <th width="10%" align="right"><strong><?php echo display('balance');?></strong></th>
                                
                            </thead>
                            <tbody>
                                <?php              
                                $TotalCredit=0;
                                $TotalDebit  = 0;
                                $CurBalance =$prebalance;
                                $openid = 1; ?>
                                <tr>
                                    <td height="25"><?php echo $openid ;?></td>
                                    <td><?php echo date('d-m-Y', strtotime($dtpFromDate)); ?></td>

                                    <td colspan="4" align="right"> <strong>Opening Balance</strong></td>
                                    <td align="right"><?php echo $currency. ' '. number_format(0,2,'.',','); ?></td>
                                    <td align="right"><?php echo $currency. ' '. number_format(0,2,'.',','); ?></td>
                                    <td align="right">
                                        <strong><?php echo $currency. ' '. number_format($prebalance,2,'.',','); ?></strong>
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

                                    <td align="right"><?php echo $currency. ' '. number_format($data->Debit,2,'.',','); ?></td>
                                    <td align="right"><?php echo $currency. ' '. number_format($data->Credit,2,'.',','); ?></td>

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
                                        } 
                                    } ?>
                                    <td align="right"><?php echo $currency. ' '.  number_format($CurBalance,2,'.',','); ?></td>
                                </tr>
                                <?php } ?>
                                <tr class="table_data">
                                    
                                    <td colspan="6" align="right"><strong><?php echo display('total')?></strong></td>
                                    <td align="right">
                                        <strong><?php echo $currency. ' '. number_format($TotalDebit,2,'.',','); ?></strong>
                                    </td>
                                    <td align="right">
                                        <strong><?php echo $currency. ' '. number_format($TotalCredit,2,'.',','); ?></strong>
                                    </td>
                                    <td align="right">
                                        <strong><?php echo $currency. ' '. number_format($CurBalance,2,'.',','); ?></strong>
                                    </td>
                                </tr>
                            </tbody>    
                        </table>
                        <table class="signature m-t-20 print-font-size"  width="100%">
                            <tr>
                                <td align="left" class="noborder">
                                    <div class="border-top"><?php echo display('prepared_by')?></div>
                                </td>
                                <td align="center" class="noborder">
                                    <div class="border-top"><?php echo display('checked_by')?></div>
                                </td>
                                <td align="right" class="noborder">
                                    <div class="border-top"><?php echo display('authorised_by')?></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="text-center" id="print">
                    <button class="btn btn-warning btn-md" name="btnPrint" id="btnPrint" onclick="printDivnew('printableArea');"><i class="fa fa-print"></i> Print </button>
                    <a href="<?php echo base_url('account/accounts/general_ledger_report_excel/'.$dtpFromDate.'/'.$dtpToDate.'/'.$cmbCode)?>" target="_blank" title="download Excel">
                        <button class="btn btn-primary btn-md" name="btnexcel" id="btnexcel"><i class="fa fa-file-excel-o"></i> Excel</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>