<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4>
                        <?php echo display('sub_ledger')?>
                    </h4>
                </div>
            </div>
            <div class="panel-body">
                <?php echo  form_open_multipart('sub_ledger_report')?>
                <div class="row" id="">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label"><?php echo display('subtype')?></label>
                            <div class="col-sm-8">
                                <select class="form-control" name="subtype" id="subtype"
                                    onchange="showAccountSubhead(this.value);">
                                    <option></option>
                                    <?php
                                    foreach($general_ledger as $g_data){
                                        ?>
                                    <option value="<?php echo $g_data->id;?>"
                                        <?php echo  $g_data->id == $subtype  ? 'selected' : '' ;?>>
                                        <?php echo $g_data->subtypeName;?></option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="date"
                                class="col-sm-4 col-form-label"><?php  echo display('account_head')?></label>
                            <div class="col-sm-8">
                                <?php  if($subtype != 1 ) { ?>
                                <select name="accounthead" class="form-control" id="accounthead"
                                    onchange="showTransationSubhead(this.value);">
                                    <?php
                                    foreach($acchead as $ac){  ?>
                                    <option value="<?php echo $ac->HeadCode;?>"
                                        <?php echo  $ac->HeadCode == $accounthead? 'selected' : '' ; ?>>
                                        <?php echo $ac->HeadName;?></option>
                                    <?php  } ?>
                                </select>
                                <?php  } else { ?>
                                <select name="accounthead" class="form-control" id="accounthead"
                                    onchange="showTransationSubhead(this.value);"></select>
                                <?php } ?>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="date"
                                class="col-sm-4 col-form-label"><?php  echo display('transaction_head')?></label>
                            <div class="col-sm-8">
                                <?php  if($subtype != 1 ) { ?>
                                <select name="subcode" class="form-control" id="subcode">
                                    <?php
                                    foreach($subcodes as $sc){  ?>
                                    <option value="<?php echo $sc->id;?>"
                                        <?php echo  $sc->id == $subcode? 'selected' : '' ; ?>><?php echo $sc->name;?>
                                    </option>
                                    <?php  } ?>
                                </select>
                                <?php  } else { ?>
                                <select name="subcode" class="form-control" id="subcode"> </select>
                                <?php } ?>

                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label"><?php echo display('from_date') ?></label>
                            <div class="col-sm-8">
                                <input type="text" name="dtpFromDate" value="<?php echo $dtpFromDate;?>"
                                    placeholder="<?php echo display('date') ?>" class="datepicker form-control">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="date" class="col-sm-4 col-form-label"><?php echo display('to_date') ?></label>
                            <div class="col-sm-8">
                                <input type="text" name="dtpToDate" value="<?php echo $dtpToDate;?>"
                                    placeholder="<?php echo display('date') ?>" class="datepicker form-control">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <button type="submit"
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
                    <table width="99%" class="datatable  table table-striped table-hover print-font-size general_ledger_report_tble">
                        <thead class="table-bordered">
                            <tr>
                                <td height="25" width="5%"><strong><?php echo display('sl');?></strong></td>
                                <td width="10%"><strong><?php echo display('date');?></strong></td>
                                <td width="10%"><strong><?php echo display('voucher_no');?></strong></td>
                                <td width="8%"><strong><?php echo display('voucher_type');?></strong></td>
                                <td width="12%"><strong><?php echo display('head_name');?></strong></td>
                                <td width="15%"><strong><?php echo display('ledger_comment')?></strong></td>
                                <td width="10%" align="right"><strong><?php echo display('debit');?></strong></td>
                                <td width="10%" align="right"><strong><?php echo display('credit');?></strong></td>
                                <td width="10%" align="right"><strong><?php echo display('balance');?></strong></td>
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

                                <td align="right"><?php echo $currency. ' '. number_format($data->Debit,2,'.',','); ?>
                                </td>
                                <td align="right"><?php echo $currency. ' '. number_format($data->Credit,2,'.',','); ?>
                                </td>

                                <?php 
                            $TotalDebit += $data->Debit;
                            $TotalCredit += $data->Credit;
                            if($ledger->HeadType == 'A' || $ledger->HeadType == 'E') {
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
                                <td align="right"><?php echo $currency. ' '.  number_format($CurBalance,2,'.',','); ?>
                                </td>
                            </tr>
                            <?php } ?>
                        <tfoot class="table-bordered">
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
                            <strong><?php echo display('sub_ledger_of').' '.$ledger->HeadName.' ('.$subLedger->name.') on '.date('d-m-Y', strtotime($dtpFromDate)). ' To '  .date('d-m-Y', strtotime($dtpToDate));?></strong>
                        </caption>
                    </table>
                </div>
                <div class="text-center general_ledger_report_btn" id="print">
                    <input type="button" class="btn btn-warning" name="btnPrint" id="btnPrint" value="Print"
                        onclick="printDivnew('printableArea');" />
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url('application/modules/account/assets/js/sub_ledger_script.js'); ?>"
    type="text/javascript"></script>