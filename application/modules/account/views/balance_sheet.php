<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4>
                        <strong><?php echo display('balance_sheet');?></strong>
                    </h4>
                </div>
            </div>

            <div class="panel-body">
                <?php echo form_open('balance_sheet', array('class' => 'form-inline', 'method' => 'post')) ?>
                <?php
            $today = date('Y-m-d');
            ?>
                <div class="form-group">
                    <label class="" for="dtpFromDate"><?php echo display('start_date') ?></label>
                    <input type="text" name="dtpFromDate" class="form-control datepicker" id="from_date"
                        placeholder="<?php echo display('start_date') ?>" value="<?php echo $dtpFromDate ?>">
                </div>

                <div class="form-group">
                    <label class="" for="dtpToDate"><?php echo display('end_date') ?></label>
                    <input type="text" name="dtpToDate" class="form-control datepicker" id="dtpToDate"
                        placeholder="<?php echo display('end_date') ?>" value="<?php echo $dtpToDate ?>">
                </div>

                <button type="submit" class="btn btn-success"><?php echo display('search') ?></button>

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
                        <table width="100%">
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
                                <strong><?php echo display('balance_sheet').'  on '.date('d-m-Y', strtotime($dtpFromDate)). ' To '  . date('d-m-Y', strtotime($dtpToDate));?></strong>
                            </caption>
                        </table>
                        <table width="99%" align="left" class=" table table-striped table-bordered table-hover print-font-size general_ledger_report_tble">
                            
    
                            <thead class="table-bordered">
                                <tr>
                                    <td width="40%" bgcolor="#E7E0EE" align="center"> 
                                        <strong><?php echo display('particulars')?></strong>
                                    </td>
                                    <td width="15%" bgcolor="#E7E0EE" align="right" class="profitamount">
                                        <strong><?php echo $this->session->userdata('fyearName')?></strong>
                                    </td>
                                    <?php foreach($financialyears as $financialyear) { ?>

                                    <td width="15%" bgcolor="#E7E0EE" align="right" class="profitamount">
                                        <strong><?php echo $financialyear ;?></strong>
                                    </td>

                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody class="table-bordered">
    
                                <?php foreach($assets as $asset) { ?>
                                <tr>
                                    <td align="left"><?php echo $asset['head'];?></td>
                                    <td align="right" colspan="4"></td>
                                </tr>
                                <?php  if(count($asset['nextlevel']) > 0) { foreach ($asset['nextlevel'] as  $value) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 80px;"><?php echo $value['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($value['subtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['ssubtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['tsubtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['fsubtotal'],2); ?></td>
    
                                </tr>
                                <?php if(count($value['innerHead']) > 0) { foreach($value['innerHead'] as $inner) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['amount'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['secondyear'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['thirdyear'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['fourthyear'],2); ?></td>
    
                                </tr>
                                <?php } }  } } } ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_assets');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($assets[0]['gtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($assets[0]['sgtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($assets[0]['tgtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($assets[0]['fgtotal'] ,2); ?></strong>
                                    </td>
    
                                </tr>
    
    
    
    
    
    
                                <tr bgcolor="#E7E0EE">
                                    <td colspan="5"> &nbsp;</td>
                                </tr>
    
                                <?php foreach($liabilities as $liability) { ?>
                                <tr>
                                    <td align="left"><?php echo $liability['head'];?></td>
                                    <td align="right" colspan="4"></td>
                                </tr>
                                <?php  if(count($liability['nextlevel']) > 0) { foreach ($liability['nextlevel'] as  $value) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 80px;"><?php echo $value['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['subtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['ssubtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['tsubtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['fsubtotal'],2); ?></td>
    
                                </tr>
                                <?php if(count($value['innerHead']) > 0) { foreach($value['innerHead'] as $inner) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['amount'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['secondyear'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['thirdyear'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['fourthyear'],2); ?></td>
    
                                </tr>
                                <?php } }  } } } ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_liabilities');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($liabilities[0]['gtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($liabilities[0]['sgtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($liabilities[0]['tgtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($liabilities[0]['fgtotal'] ,2); ?></strong>
                                    </td>
    
                                </tr>
    
    
    
                                <tr bgcolor="#E7E0EE">
                                    <td colspan="5"> &nbsp;</td>
                                </tr>
    
                                <?php foreach($equitys as $equity) { ?>
                                <tr>
                                    <td align="left"><?php echo $equity['head'];?></td>
                                    <td align="right" colspan="4"></td>
                                </tr>
                                <?php  if(count($equity['nextlevel']) > 0) { foreach ($equity['nextlevel'] as  $value) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 80px;"><?php echo $value['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['subtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['ssubtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['tsubtotal'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($value['fsubtotal'],2); ?></td>
    
                                </tr>
                                <?php if(count($value['innerHead']) > 0) { foreach($value['innerHead'] as $inner) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['amount'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['secondyear'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['thirdyear'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '.  number_format($inner['fourthyear'],2); ?></td>
    
                                </tr>
                                <?php } }  } } } ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_equity');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($equitys[0]['gtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($equitys[0]['sgtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($equitys[0]['tgtotal'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format($equitys[0]['fgtotal'] ,2); ?></strong>
                                    </td>
    
                                </tr>
    
    
    
                            </tbody>
                            <tfoot class="table-bordered">
                                <tr>
                                    <td align="right"><strong><?php echo display('total_liabilities_equity');?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format(($liabilities[0]['gtotal'] + $equitys[0]['gtotal'] ),2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format(($liabilities[0]['sgtotal'] + $equitys[0]['sgtotal']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format(($liabilities[0]['tgtotal'] + $equitys[0]['tgtotal']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '.  number_format(($liabilities[0]['fgtotal'] + $equitys[0]['fgtotal']) ,2); ?></strong>
                                    </td>
                                </tr>
                            </tfoot>
    
    
                        </table>
                    </div>
                </div>
                <div class="text-center" id="print">
                    <button class="btn btn-warning btn-md" name="btnPrint" id="btnPrint"
                    onclick="printDivnew('printableArea');"><i class="fa fa-print"></i> Print </button>
                    
                    <a href="<?php echo base_url('account/accounts/balance_sheet_excel/'.$dtpFromDate.'/'.$dtpToDate)?>"
                        target="_blank" title="download pdf">
                        <button class="btn btn-primary btn-md" name="btnPdf" id="btnPdf"><i class="fa fa-file-excel-o"></i>
                            Excel</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
    

