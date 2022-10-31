
<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd lobidrag">

            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo display('profit_loss') ?></h4>
                </div>
            </div>

            <div class="panel-body">
                <?php echo form_open('profit_loss_report_search',array('class' => 'form-inline','method'=>'post'))?>

                <div class="form-group form-group-new">
                    <label for="dtpFromDate"><?php echo display('from_date')?> :</label>
                    <input type="text" name="dtpFromDate"
                        value="<?php echo   isset($dtpFromDate)? $dtpFromDate : date('Y-m-d'); ?>"
                        class="datepicker form-control" />
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

                <div id="printArea">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table border="0" width="100%">
                            <caption class="text-center">
                                    <table class="print-font-size" width="100%">
                                        <tr>
                                            <td align="left" style="border-bottom: 2px #333 solid;" width="33.333%">
                                                <img src="<?php echo base_url().$setting->logo;?>"
                                                    class="img-bottom-m print-logo" alt="logo">
                                            </td>
                                            <td align="center" style="border-bottom: 2px #333 solid;" width="33.333%">
                                                <strong
                                                    class=""><?php echo html_escape($company_info[0]['company_name'])?></strong><br>
                                                
                                                <?php echo html_escape($company_info[0]['address']);?>
                                                <br>
                                                <?php echo html_escape($company_info[0]['email']);?>
                                                <br>
                                                <?php echo html_escape($company_info[0]['mobile']);?>
                                            </td>
                                            <td align=" right" style="border-bottom: 2px #333 solid;" width="33.333%">
                                                <date> <?php echo display('date')?>: <?php echo date('d-M-Y'); ?> </date>
                                                <br>
    
                                            </td>
                                        </tr>
                                    </table>
                                </caption>
                                <caption class="text-center" style="border-bottom: 1px #c9c9c9 solid;">
                                    <b><?php echo display('statement_of_comprehensive_income')?><?php echo display('from')?>
                                        <?php echo $dtpFromDate ?> <?php echo display('to')?>
                                        <?php echo $dtpToDate;?>
                                    </b>
                                </caption>
                            </table>

                            <table width="100%" class="datatable table table-stripped table-bordered table-hover print-font-size" cellpadding="6" cellspacing="1">
                                
                                <thead class="table-bordered">
                                    <tr>
                                        <th width="60%" bgcolor="#E7E0EE" align="center"><?php echo display('particulars')?>
                                        </th>
                                        <th width="20%" class="text-right" bgcolor="#E7E0EE" align="right" class="profitamount">
                                            <?php echo display('amount')?></th>
                                        <th width="20%" class="text-right" bgcolor="#E7E0EE" align="right" class="profitamount">
                                            <?php echo display('amount')?></th>
                                    </tr>
                                </thead>
                                <tbody class="table-bordered">
                                    <?php foreach($incomes as $income) { ?>
                                    <tr>
                                        <td align="left"><?php echo $income['head'];?></td>
                                        <td align="right" colspan="2"></td>
                                    </tr>
                                    <?php  if(count($income['nextlevel']) > 0) { foreach ($income['nextlevel'] as  $value) { ?>
                                    <tr>
                                        <td align="left" style="padding-left: 80px;"><?php echo $value['headName'];?></td>
                                        <td align="right" class="profitamount"> </td>
                                        <td align="right" class="profitamount">
                                            <?php echo $currency. ' '. number_format($value['subtotal'],2); ?></td>
    
                                    </tr>
                                    <?php if(count($value['innerHead']) > 0) { foreach($value['innerHead'] as $inner) { ?>
                                    <tr>
                                        <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                        <td align="right" class="profitamount">
                                            <?php echo $currency. ' '. number_format($inner['amount'],2); ?></td>
                                        <td> </td>
                                    </tr>
                                    <?php } }  } } } 
                                    if($incomes[0]['gtotal'] < $expenses[0]['gtotal']) { ?>
                                    <tr bgcolor="#E7E0EE">
                                        <td align="right"><strong><?php echo display('profit_loss')?></strong></td>
                                        <td align="right" class="profitlossassetstyle" colspan="2">
                                            <strong><?php echo $currency. ' '. number_format(($expenses[0]['gtotal'] - $incomes[0]['gtotal'] ),2); ?></strong>
                                        </td>
    
                                    </tr>
                                    <tr>
                                        <td align="right"><strong><?php echo display('total');?></strong></td>
                                        <td align="right" class="profitamount" colspan="2">
                                            <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal'] + ($expenses[0]['gtotal'] - $incomes[0]['gtotal']) ),2); ?></strong>
                                        </td>
    
                                    </tr>
                                    <?php } else {?>
                                    <tr>
                                        <td align="right"><strong><?php echo display('total');?></strong></td>
                                        <td align="right" class="profitamount" colspan="2">
                                            <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal'] ,2); ?></strong>
                                        </td>
    
                                    </tr>
    
    
                                    <?php } ?>
    
    
    
                                    <tr bgcolor="#E7E0EE">
                                        <td colspan="3"> &nbsp;</td>
                                    </tr>
                                    <?php foreach($expenses as $expense) { ?>
                                    <tr>
                                        <td align="left"><?php echo $expense['head'];?></td>
                                        <td align="right" colspan="2"></td>
                                    </tr>
                                    <?php  if(count($expense['nextlevel']) > 0) { foreach ($expense['nextlevel'] as  $value) { ?>
                                    <tr>
                                        <td align="left" style="padding-left: 80px;"><?php echo $value['headName'];?></td>
                                        <td align="right" class="profitamount"> &nbsp;</td>
                                        <td align="right" class="profitamount">
                                            <?php echo $currency. ' '. number_format($value['subtotal'],2); ?></td>
                                    </tr>
                                    <?php if(count($value['innerHead']) > 0) { foreach($value['innerHead'] as $inner) { ?>
                                    <tr>
                                        <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                        <td align="right" class="profitamount">
                                            <?php echo $currency. ' '. number_format($inner['amount'],2); ?></td>
                                        <td> &nbsp; </td>
                                    </tr>
                                    <?php } }  } } } 
                                    if($incomes[0]['gtotal'] > $expenses[0]['gtotal']) { ?>
                                    <tr bgcolor="#E7E0EE">
                                        <td align="right"><strong><?php echo display('profit_loss')?></strong></td>
                                        <td align="right" class="profitlossassetstyle" colspan="2">
                                            <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal'] - $expenses[0]['gtotal']),2); ?></strong>
                                        </td>
    
                                    </tr>
                                    <tr>
                                        <td align="right"><strong><?php echo display('total');?></strong></td>
                                        <td align="right" class="profitamount" colspan="2">
                                            <strong><?php echo $currency. ' '. number_format(($expenses[0]['gtotal'] + ($incomes[0]['gtotal'] - $expenses[0]['gtotal'])) ,2); ?></strong>
                                        </td>
    
                                    </tr>
    
                                    <?php } else {?>
    
                                    <tr>
                                        <td align="right"><strong><?php echo display('total');?></strong></td>
                                        <td align="right" class="profitamount" colspan="2">
                                            <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal']  ,2); ?></strong>
                                        </td>
    
                                    </tr>
    
    
                                    <?php } ?>
    
                                </tbody>
    
    
                            </table>
                        </div>


                        <table width="100%" cellpadding="1" cellspacing="20" class="print-font-size">
                            <tr>
                                <td width="20%" class="noborder" align="center">
                                    <?php echo display('prepared_by')?></td>
                                <td width="20%" class="noborder" align="center">
                                    <?php echo display('accounts')?></td>
                                <td width="20%" class="noborder" align="center">
                                    <?php echo display('authorized_signature')?></td>
                                <td width="20%" class="noborder" align='center'>
                                    <?php echo display('chairman')?></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-warning btn-md" name="btnPrint" id="btnPrint"
                        onclick="printDivnew('printArea');"><i class="fa fa-print"></i> Print </button>
                    <a href="<?php echo base_url('account/accounts/profit_loss_report_excel/'.$dtpFromDate.'/'.$dtpToDate)?>"
                        target="_blank" title="download Excel">
                        <button class="btn btn-primary btn-md" name="btnexcel" id="btnexcel"><i
                                class="fa fa-file-excel-o"></i> Excel</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>