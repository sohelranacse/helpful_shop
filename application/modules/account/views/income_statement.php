
<!-- New income -->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd">

            <div class="panel-heading">
                <div class="panel-title">
                    <h4>
                        <?php echo display('income_statement_form')?>
                    </h4>
                </div>
            </div>
            <div class="panel-body">
                <?php echo form_open('income_statement',array('class' => 'form-inline','method'=>'post'))?>
                <div class="form-group form-group-margin">
                    <label for="employeelist"><?php echo display('year')?>:</label>

                </div>
                <div class="form-group form-group-new empdropdown">
                    <select class="form-control" name="fyear">
                        <?php foreach($fyears as $fyear){?>
                        <option value="<?php echo $fyear->id;?>"
                            <?php echo $fyear->id== $curentYear->id? 'selected':'' ; ?>><?php echo $fyear->yearName;?>
                        </option>
                        <?php }?>
                    </select>
                </div>

                <button type="submit" class="btn btn-success"><?php echo display('search') ?></button>
                <?php echo form_close() ?>
            </div>

        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12" id="printArea">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
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
                                <strong><?php echo display('income_statement_form')?> for
                                    <?php echo $curentYear->yearName ;?></strong>
                            </caption>
                        </table>
                        <table width="99%" align="left" class="datatableReport table table-striped table-bordered table-hover general_ledger_report_tble print-font-size">
                            <thead>
                                <tr>
                                    <th width="16%" bgcolor="#E7E0EE" align="left"><?php echo display('particulars')?></th>
                                    <?php $time = strtotime($curentYear->startDate);
                                $startmonth = date('n',  strtotime($curentYear->startDate));
                                for($i=0; $i < 12; $i++) {
                                    $monthname = date("M-y", strtotime("+ ".$i." month", $time)); ?>
                                    <th width="7%" bgcolor="#E7E0EE" align="right" class="profitamount">
                                        <?php echo $monthname;?></th>
                                    <?php  } ?>
                                </tr>
    
                            </thead>
                            <tbody>
                                <?php if(count($incomes) > 0) {  foreach($incomes as $income) { ?>
                                <tr>
                                    <td align="left"><?php echo $income['head'];?></td>
                                    <td align="right" colspan="12"></td>
                                </tr>
                                <?php  if(count($income['nextlevel']) > 0) { foreach ($income['nextlevel'] as  $value) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 80px;"><?php echo $value['headName'];?></td>
                                    <td align="right" colspan="12" class="profitamount"></td>
                                </tr>
                                <?php if(count($value['innerHead']) > 0) { foreach($value['innerHead'] as $inner) { if($startmonth == 1) {  ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount1'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount2'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount3'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount4'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount5'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount6'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount7'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount8'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount9'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount10'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount11'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount12'],2); ?></td>
                                </tr>
                                <?php } else { ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount7'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount8'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount9'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount10'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount11'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount12'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount1'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount2'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount3'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount4'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount5'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount6'],2); ?></td>
                                </tr>
                                <?php } } }  } } } if($startmonth == 1) { ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_income');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal1'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal2'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal3'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal4'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal5'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal6'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal7'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal8'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal9'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal10'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal11'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal12'] ,2); ?></strong>
                                    </td>
                                </tr>
                                <?php } else { ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_income');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal1'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal2'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal3'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal4'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal5'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal6'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal7'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal8'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal9'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal10'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal11'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($incomes[0]['gtotal12'] ,2); ?></strong>
                                    </td>
                                </tr>
                                <?php } ?>
                                <tr bgcolor="#E7E0EE">
                                    <td colspan="13"> &nbsp;</td>
                                </tr>
                                <?php } ?>
    
    
    
    
    
    
                                <?php if(count($costofgoodsolds) > 0) {  foreach($costofgoodsolds as $costofgoodsold) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 80px;"><?php echo $costofgoodsold['headName'];?>
                                    </td>
                                    <td align="right" colspan="12"></td>
                                </tr>
    
                                <?php if(count($costofgoodsold['innerHead']) > 0) { foreach($costofgoodsold['innerHead'] as $inner) { if($startmonth == 1) {  ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount1'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount2'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount3'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount4'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount5'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount6'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount7'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount8'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount9'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount10'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount11'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount12'],2); ?></td>
                                </tr>
                                <?php } else { ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount7'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount8'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount9'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount10'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount11'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount12'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount1'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount2'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount3'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount4'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount5'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount6'],2); ?></td>
                                </tr>
                                <?php } } } } if($startmonth == 1) { ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_cogs');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota1'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota2'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota3'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota4'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota5'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota6'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota7'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota8'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota9'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota10'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota11'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota12'] ,2); ?></strong>
                                    </td>
                                </tr>
                                <?php } else { ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_cogs');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota1'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota2'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota3'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota4'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota5'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota6'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota7'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota8'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota9'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota10'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota11'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($costofgoodsolds[0]['subtota12'] ,2); ?></strong>
                                    </td>
                                </tr>
                                <?php }  if($startmonth == 1) {?>
                                <tr bgcolor="#E7E0EE">
                                    <td align="right"><strong><?php echo display('gross_profit');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal1']-$costofgoodsolds[0]['subtota1']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal2']-$costofgoodsolds[0]['subtota2']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal3']- $costofgoodsolds[0]['subtota3']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal4']-$costofgoodsolds[0]['subtota4']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal5']-$costofgoodsolds[0]['subtota5']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal6']-$costofgoodsolds[0]['subtota6']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal7']-$costofgoodsolds[0]['subtota7']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal8']-$costofgoodsolds[0]['subtota8']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal9']-$costofgoodsolds[0]['subtota9']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal10']-$costofgoodsolds[0]['subtota10']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal11'] -$costofgoodsolds[0]['subtota11']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal12']-$costofgoodsolds[0]['subtota12']) ,2); ?></strong>
                                    </td>
                                </tr> <?php } else { ?>
                                <tr bgcolor="#E7E0EE">
                                    <td align="right"><strong><?php echo display('gross_profit');?></strong></td>
    
    
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal7']-$costofgoodsolds[0]['subtota7']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal8']-$costofgoodsolds[0]['subtota8']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal9']-$costofgoodsolds[0]['subtota9']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal10']-$costofgoodsolds[0]['subtota10']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal11']-$costofgoodsolds[0]['subtota11']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal12']-$costofgoodsolds[0]['subtota12']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal1']-$costofgoodsolds[0]['subtota1']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal2']-$costofgoodsolds[0]['subtota2']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal3']- $costofgoodsolds[0]['subtota3']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal4']-$costofgoodsolds[0]['subtota4']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal5']-$costofgoodsolds[0]['subtota5']) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal6']-$costofgoodsolds[0]['subtota6']) ,2); ?></strong>
                                    </td>
                                </tr>
                                <?php } } ?>
    
    
    
    
    
    
    
    
    
    
    
                                <?php if(count($expenses) > 0) {  foreach($expenses as $expense) { ?>
                                <tr>
                                    <td align="left"><?php echo $expense['head'];?></td>
                                    <td align="right" colspan="12"></td>
                                </tr>
                                <?php  if(count($expense['nextlevel']) > 0) { foreach ($expense['nextlevel'] as  $value) { ?>
                                <tr>
                                    <td align="left" style="padding-left: 80px;"><?php echo $value['headName'];?></td>
                                    <td align="right" colspan="12" class="profitamount"></td>
                                </tr>
                                <?php if(count($value['innerHead']) > 0) { foreach($value['innerHead'] as $inner) { if($startmonth == 1) {  ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount1'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount2'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount3'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount4'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount5'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount6'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount7'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount8'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount9'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount10'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount11'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount12'],2); ?></td>
                                </tr>
                                <?php } else { ?>
                                <tr>
                                    <td align="left" style="padding-left: 160px;"><?php echo $inner['headName'];?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount7'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount8'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount9'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount10'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount11'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount12'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount1'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount2'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount3'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount4'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount5'],2); ?></td>
                                    <td align="right" class="profitamount">
                                        <?php echo $currency. ' '. number_format($inner['amount6'],2); ?></td>
                                </tr>
                                <?php } } }  } } } if($startmonth == 1) { ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_expense');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal1'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal2'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal3'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal4'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal5'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal6'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal7'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal8'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal9'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal10'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal11'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal12'] ,2); ?></strong>
                                    </td>
                                </tr>
                                <?php } else { ?>
    
                                <tr>
                                    <td align="right"><strong><?php echo display('total_expense');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal1'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal2'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal3'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal4'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal5'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal6'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal7'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal8'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal9'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal10'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal11'] ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format($expenses[0]['gtotal12'] ,2); ?></strong>
                                    </td>
                                </tr>
                                <?php } if($startmonth == 1) { ?>
                                <tr bgcolor="#E7E0EE">
                                    <td align="right"><strong><?php echo display('net_amount');?></strong></td>
    
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal1']- ($costofgoodsolds[0]['subtota1']+$expenses[0]['gtotal1'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal2']- ($costofgoodsolds[0]['subtota2']+$expenses[0]['gtotal2'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal3']- ($costofgoodsolds[0]['subtota3']+$expenses[0]['gtotal3'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal4']- ($costofgoodsolds[0]['subtota4']+$expenses[0]['gtotal4'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal5']- ($costofgoodsolds[0]['subtota5']+$expenses[0]['gtotal5'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal6']- ($costofgoodsolds[0]['subtota6']+$expenses[0]['gtotal6'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal7']- ($costofgoodsolds[0]['subtota7']+$expenses[0]['gtotal7'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal8']- ($costofgoodsolds[0]['subtota8']+$expenses[0]['gtotal8'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal9']- ($costofgoodsolds[0]['subtota9']+$expenses[0]['gtotal9'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal10']- ($costofgoodsolds[0]['subtota10']+$expenses[0]['gtotal10'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal11']- ($costofgoodsolds[0]['subtota11']+$expenses[0]['gtotal11'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal12']- ($costofgoodsolds[0]['subtota12']+$expenses[0]['gtotal12'])) ,2); ?></strong>
                                    </td>
                                </tr> <?php } else { ?>
                                <tr bgcolor="#E7E0EE">
                                    <td align="right"><strong><?php echo display('net_amount');?></strong></td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal7']- ($costofgoodsolds[0]['subtota7']+$expenses[0]['gtotal7'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal8']- ($costofgoodsolds[0]['subtota8']+$expenses[0]['gtotal8'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal9']- ($costofgoodsolds[0]['subtota9']+$expenses[0]['gtotal9'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal10']- ($costofgoodsolds[0]['subtota10']+$expenses[0]['gtotal10'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal11']- ($costofgoodsolds[0]['subtota11']+$expenses[0]['gtotal11'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal12']- ($costofgoodsolds[0]['subtota12']+$expenses[0]['gtotal12'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal1']- ($costofgoodsolds[0]['subtota1']+$expenses[0]['gtotal1'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal2']- ($costofgoodsolds[0]['subtota2']+$expenses[0]['gtotal2'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal3']- ($costofgoodsolds[0]['subtota3']+$expenses[0]['gtotal3'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal4']- ($costofgoodsolds[0]['subtota4']+$expenses[0]['gtotal4'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal5']- ($costofgoodsolds[0]['subtota5']+$expenses[0]['gtotal5'])) ,2); ?></strong>
                                    </td>
                                    <td align="right" class="profitamount">
                                        <strong><?php echo $currency. ' '. number_format(($incomes[0]['gtotal6']- ($costofgoodsolds[0]['subtota6']+$expenses[0]['gtotal6'])) ,2); ?></strong>
                                    </td>
    
                                </tr>
                                <?php } } ?>
    
    
    
                            </tbody>
                           
                            
                        </table>
                        <table border="0" width="100%" style="padding-top: 100px;">
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
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="text-center" id="print">
            <button class="btn btn-warning btn-md" name="btnPrint" id="btnPrint" onclick="printPageArea('printArea');"><i class="fa fa-print"></i> Print </button>
            <a href="<?php echo base_url('account/accounts/income_statement_excel/'.$curentYear->id)?>" target="_blank"
                title="download Excel">
                <button class="btn btn-primary btn-md" name="btnexcel" id="btnexcel"><i class="fa fa-file-excel-o"></i>
                    Excel</button>
            </a>
        </div>

    </div>
</div>

<script src="<?php echo base_url('my-assets/js/admin_js/income_statement.js') ?>" type="text/javascript"></script>
