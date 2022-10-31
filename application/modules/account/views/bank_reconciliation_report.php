<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo display('bank_reconciliation_report') ?></h4>
                </div>
            </div>
            <div class="panel-body">

                <?php echo  form_open_multipart('bank_reconciliation_report',array('class' => 'form-inline','method'=>'post')) ?>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group row">
                            <label for="dtpFromDate"
                                class="col-sm-4 col-form-label"><?php echo display('from_date') ?></label>
                            <div class="col-sm-8">
                                <input type="text" name="dtpFromDate"
                                    value="<?php echo   isset($dtpFromDate)? $dtpFromDate : date('Y-m-d',strtotime('first day of this month')); ?>"
                                    placeholder="<?php echo display('date') ?>" class="datepicker form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group row">
                            <label for="dtpToDate"
                                class="col-sm-4 col-form-label"><?php echo display('to_date') ?></label>
                            <div class="col-sm-8">
                                <input type="text" name="dtpToDate"
                                    value="<?php echo  isset($dtpToDate)? $dtpToDate : date('Y-m-d'); ?>"
                                    placeholder="<?php echo display('date') ?>" class="datepicker form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group row">
                            <label for="dtpToDate"
                                class="col-sm-5 col-form-label"><?php echo display('bank_name') ?></label>
                            <div class="col-sm-7">
                                <select class="form-control" name="bankCode" id="bankCode">
                                    <option value=""> Select Bank</option>
                                    <?php foreach($banks as $bank){  ?>
                                    <option value="<?php echo $bank->HeadCode;?>"
                                        <?php  if(isset($bankCode)) { echo  $bank->HeadCode == $bankCode  ? 'selected' : '' ; } ?>>
                                        <?php echo $bank->HeadName;?></option>
                                    <?php  }  ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group row">
                            <div class="col-sm-8">
                                <button type="submit" name="btnSave"
                                    class="btn btn-success w-md m-b-5"><?php echo display('find') ?></button>
                            </div>
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
                    <div class="panel-body" id="printArea">
                        <div class="table-responsive">


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
                                                <date> <?php echo display('date')?>: <?php echo date('d-M-Y'); ?>
                                                </date>
                                                <br>

                                            </td>
                                        </tr>
                                    </table>
                                </caption>
                                <caption class="text-center" style="border-bottom: 1px #c9c9c9 solid;">
                                    <b><?php echo display('bank_reconciliation_report').'  on '.date('d-m-Y', strtotime($dtpFromDate)). ' To '  . date('d-m-Y', strtotime($dtpToDate));?></b>
                                </caption>
                            </table>
                            <?php if($vauchers) { ?>
                            <table width="100%" class="datatableReport table table-bordered table-hover">

                                <thead>
                                    <tr>
                                        <th colspan="6" style="background-color:#151B8D; color: #fff;">
                                            <?php echo display('approved') ?></th>
                                        <th colspan="5" style="background-color:#5d61af; color: #fff;">
                                            <?php echo display('unapproved') ?></th>
                                    </tr>
                                    <tr>
                                        <th><?php echo display('sl_no') ?></th>
                                        <th><?php echo display('voucher_no') ?></th>
                                        <th><?php echo display('particulars') ?></th>
                                        <th><?php echo display('check_no') ?></th>
                                        <th><?php echo display('date') ?></th>
                                        <th><?php echo display('amount') ?></th>
                                        <th><?php echo display('voucher_no') ?></th>
                                        <th><?php echo display('particulars') ?></th>
                                        <th><?php echo display('check_no') ?></th>
                                        <th><?php echo display('date') ?></th>
                                        <th><?php echo display('amount') ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $sl = 1; $hsum = 0;$nsum = 0;
                                        foreach($vauchers as $appr) {   ?>
                                    <tr>
                                        <td><?php echo $sl; ?></td>
                                        <?php if($appr->isHonour == 1) { $hsum += $appr->Debit; ?>
                                        <td><?php echo $appr->VNo; ?></td>
                                        <td><?php echo $appr->accountName; ?></td>
                                        <td><?php echo $appr->chequeno; ?></td>
                                        <td><?php echo $appr->chequeDate; ?></td>
                                        <td><?php echo $currency. ' '. $appr->Debit; ?></td>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <?php  } else { $nsum += $appr->Debit;?>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <td><?php echo $appr->VNo; ?></td>
                                        <td><?php echo $appr->accountName; ?></td>
                                        <td><?php echo $appr->chequeno; ?></td>
                                        <td><?php echo $appr->chequeDate; ?></td>
                                        <td><?php echo $currency. ' '. $appr->Debit; ?></td>
                                        <?php } ?>
                                    </tr>
                                    <?php $sl++;}?>
                                    <tr>
                                        <td style="border-bottom: 1px solid #ddd;"></td>
                                        <td style="border-bottom: 1px solid #ddd;" colspan="4" align="right">
                                            <strong><?php echo display('total');?> </strong>
                                        </td>
                                        <td style="border-bottom: 1px solid #ddd;">
                                            <strong><?php echo $currency. ' '. $hsum; ?></strong>
                                        </td>
                                        <td style="border-bottom: 1px solid #ddd;" colspan="4" align="right">
                                            <strong><?php echo display('total');?> </strong>
                                        </td>
                                        <td style="border-bottom: 1px solid #ddd;">
                                            <strong><?php echo $currency. ' '. $nsum; ?></strong>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr bgcolor="#FFF" style="margin-top: 200px;">
                                        <td colspan="11" align="center" height="120" valign="bottom">
                                            <table width="100%" cellpadding="1" cellspacing="20">
                                                <tr>
                                                    <td width="30%" class="noborder" align="center">
                                                        <?php echo display('prepared_by')?></td>
                                                    <td width="30%" class="noborder" align="center">
                                                        <?php echo display('checked_by')?></td>
                                                    <td width="30%" class="noborder" align="center">
                                                        <?php echo display('authorised_by')?></td>

                                                </tr>
                                            </table>
                                        </td>
                                    </tr>

                                </tfoot>
                            </table>
                            <?php } else { ?>
                            <h3> <?php echo display('no_result_found');?> </h3>
                            <?php } ?>


                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <?php echo form_close()?>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="text-center" id="print">

            <button class="btn btn-warning btn-md" name="btnPrint" id="btnPrint"
                onclick="printPageArea('printArea');"><i class="fa fa-print"></i> Print </button>

            <a href="<?php echo base_url('account/accounts/bank_reconciliation_report_excel/'.$dtpFromDate.'/'.$dtpToDate.'/'.$bankCode)?>"
                target="_blank" title="download Excel">
                <button class="btn btn-primary btn-md" name="btnexcel" id="btnexcel"><i class="fa fa-file-excel-o"></i>
                    Excel</button>
            </a>
        </div>
    </div>
</div>

<script src="<?php echo base_url('my-assets/js/admin_js/bank_reconciliation_report.js') ?>" type="text/javascript"></script>
