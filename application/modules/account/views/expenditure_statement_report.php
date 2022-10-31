
<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd lobidrag">

            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo display('expenditure_statement') ?></h4>
                </div>
            </div>

            <div class="panel-body">
                <?php echo form_open('expenditure_statement_report',array('class' => 'form-inline','method'=>'post'))?>

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
                        <table border="0" width="100%">
                        <caption class="text-center">
                                <table class="print-font-size" width="100%">
                                    <tr>
                                        <td align="left" style="border-bottom: 2px #333 solid;" width="33.333%">
                                            <img src="<?php echo base_url().$setting->logo;?>"
                                                class="img-bottom-m print-logo" alt="logo">
                                        </td>
                                        <td align="center" style="border-bottom: 2px #333 solid;" width="33.333%>
                                            <strong
                                                class=""><?php echo html_escape($company_info[0]['company_name'])?></strong><br>
                                            
                                            <?php echo html_escape($company_info[0]['address']);?>
                                            <br>
                                            <?php echo html_escape($company_info[0]['email']);?>
                                            <br>
                                            <?php echo html_escape($company_info[0]['mobile']);?>
                                        </td>
                                        <td align=" right" style="border-bottom: 2px #333 solid;" width="33.333%">
                                            <date> <?php echo display('date')?>: <?php echo date('d-M-Y'); ?> </date><br>
    
                                        </td>
                                    </tr>
                                </table>
                            </caption>
                            
                            <caption class="text-center" style="border-bottom: 1px #c9c9c9 solid;">
                                <strong><?php echo display('expenditure_statement')?><?php echo display('from')?>
                                    <?php echo $dtpFromDate ?> <?php echo display('to')?>
                                    <?php echo $dtpToDate;?>
                                </strong>
                            </caption>
                        <table>
                        <table width="99%" align="left"  class="datatableReport table table-striped table-bordered print-font-size table-hover general_ledger_report_tble">
                            
                            <thead class="table-bordered">
                                
                                <tr>
                                    <th width="60%" bgcolor="#E7E0EE" align="center"><?php echo display('particulars')?>
                                    </th>
                                    <th width="20%" bgcolor="#E7E0EE" align="right" class="text-right" class="profitamount">
                                        <?php echo display('amount')?></th>
                                    <th width="20%" bgcolor="#E7E0EE" align="right" class="text-right" class="profitamount">
                                        <?php echo display('amount')?></th>
                                </tr>
                            </thead>
                            <tbody class="table-bordered">
    
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
                                <?php } }  } } } ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total');?></strong></td>
                                    <td align="right" class="profitamount" colspan="2">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal']  ,2); ?></strong>
                                    </td>
    
                                </tr>
    
    
                            </tbody>
                            
    
    
                        </table>
                        <table width="100%" cellpadding="1" cellspacing="20" class="print-font-size" style="margin-top: 200px;">
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
                <div class="text-center" id="print">
    
    
                    <button class="btn btn-warning btn-md" name="btnPrint" id="btnPrint" onclick="printDivnew('printArea');"><i
                            class="fa fa-print"></i> Print </button>
                   
                    <a href="<?php echo base_url('account/accounts/expenditure_statement_report_excel/'.$dtpFromDate.'/'.$dtpToDate)?>"
                        target="_blank" title="download Excel">
                        <button class="btn btn-primary btn-md" name="btnexcel" id="btnexcel"><i
                                class="fa fa-file-excel-o"></i> Excel</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>