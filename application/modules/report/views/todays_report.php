<!-- Todays sales report -->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <span><?php echo display('todays_sales_report') ?> </span>
                    <span class="padding-lefttitle">
                        <?php if($this->permission1->method('todays_sales_report','read')->access()){ ?>
                        <a href="<?php echo base_url('sales_report') ?>" class="btn btn-info m-b-5 m-r-2"><i
                                class="ti-align-justify"> </i> <?php echo display('sales_report') ?> </a>
                        <?php }?>
                        <?php if($this->permission1->method('todays_purchase_report','read')->access()){ ?>
                        <a href="<?php echo base_url('purchase_report') ?>" class="btn btn-success m-b-5 m-r-2"><i
                                class="ti-align-justify"> </i> <?php echo display('purchase_report') ?> </a>
                        <?php }?>
                        <?php if($this->permission1->method('product_sales_reports_date_wise','read')->access()){ ?>
                        <a href="<?php echo base_url('product_wise_sales_report') ?>"
                            class="btn btn-primary m-b-5 m-r-2"><i class="ti-align-justify"> </i>
                            <?php echo display('sales_report_product_wise') ?> </a>
                        <?php }?>
                        <?php if($this->permission1->method('todays_sales_report','read')->access() && $this->permission1->method('todays_purchase_report','read')->access()){ ?>
                        <a href="<?php echo base_url('profit_report') ?>" class="btn btn-warning m-b-5 m-r-2"><i
                                class="ti-align-justify"> </i> <?php echo display('profit_report') ?> </a>
                        <?php }?>

                        <a class="btn btn-success m-b-5 m-r-2" href="#"
                            onclick="printDiv('printableArea')"><?php echo display('print') ?></a>
                    </span>
                </div>
            </div>
            <div class="panel-body">
                <div id="printableArea">
                    <div class="paddin5ps">
                        <table class="print-table" width="100%">

                            <tr>
                                <td align="left" class="print-table-tr">
                                    <img src="<?php echo base_url().$setting->logo;?>" alt="logo">
                                </td>
                                <td align="center" class="print-cominfo">
                                    <span class="company-txt">
                                        <?php echo $company_info[0]['company_name'];?>

                                    </span><br>
                                    <?php echo $company_info[0]['address'];?>
                                    <br>
                                    <?php echo $company_info[0]['email'];?>
                                    <br>
                                    <?php echo $company_info[0]['mobile'];?>
                                    <br>
                                    <strong><?php echo display('todays_sales_report')?></strong>

                                </td>
                                
                                <td align="right" class="print-table-tr">
                                    <date>
                                        <?php echo display('date')?>: <?php
                                                    echo date('d-M-Y');
                                                    ?>
                                    </date>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <div class="table-responsive paddin5ps">
                        <table class="table  table-striped table-bordered"  cellspacing="0" width="100%" id="reportlist">
                            <thead>
                                <tr>
                                    <th><?php echo display('sales_date') ?></th>
                                    <th><?php echo display('invoice_no') ?></th>
                                    <th><?php echo display('customer_name') ?></th>
                                    <th class="text-right"><?php echo display('total_amount') ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                            <tfoot>
                                <th colspan="3" class="text-right"><?php echo display('total_sales') ?>:</th>
                                <th></th>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Todays purchase report -->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo display('todays_purchase_report') ?></h4>
                    <p class="text-right">
                        <a class="btn btn-warning" href="#"
                            onclick="printDiv('purchase_div')"><?php echo display('print') ?></a>
                    </p>
                </div>
            </div>
            <div class="panel-body">


                <div id="purchase_div">
                    <table class="print-table" width="100%">

                        <tr>
                            <td align="left" class="print-table-tr">
                                <img src="<?php echo base_url().$setting->logo;?>" alt="logo">
                            </td>
                            <td align="center" class="print-cominfo">
                                <span class="company-txt">
                                    <?php echo $company_info[0]['company_name'];?>

                                </span><br>
                                <?php echo $company_info[0]['address'];?>
                                <br>
                                <?php echo $company_info[0]['email'];?>
                                <br>
                                <?php echo $company_info[0]['mobile'];?>
                                <br>
                                <strong><?php echo display('todays_purchase_report')?></strong>
                            </td>

                            <td align="right" class="print-table-tr">
                                <date>
                                    <?php echo display('date')?>: <?php
                                                    echo date('d-M-Y');
                                                    ?>
                                </date>

                            </td>
                        </tr>

                    </table>
                    <div class="table-responsive paddin5ps">
                        <table class="table table-bordered table-striped table-hover" cellspacing="0" width="100%"  id="todays_report">
                            <thead>
                                <tr>
                                    <th><?php echo display('purchase_date') ?></th>
                                    <th><?php echo display('invoice_no') ?></th>
                                    <th><?php echo display('supplier_name') ?></th>
                                    <th class="text-right"><?php echo display('total_amount') ?></th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                            <tfoot>
                                <th colspan="3" class="text-right"><?php echo display('total_purchase') ?>:</th>
                                <th></th>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="today" value="<?php echo date("Y-m-d"); ?>">

<script src="<?php echo base_url('my-assets/js/admin_js/today_report.js') ?>" type="text/javascript"></script>
