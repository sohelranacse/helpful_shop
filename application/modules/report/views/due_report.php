<!-- due report -->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <?php echo form_open('invoice_wise_due_report', array('class' => 'form-inline', 'method' => 'get')) ?>
                <?php
                        
                        $today = date('Y-m-d');
                        ?>
                <div class="form-group">
                    <label class="" for="from_date"><?php echo display('start_date') ?></label>
                    <input type="text" name="from_date" class="form-control datepicker" id="from_date"
                        placeholder="<?php echo display('start_date') ?>"
                        value="<?php echo (!empty($from_date)?$from_date:$today) ?>">
                </div>

                <div class="form-group">
                    <label class="" for="to_date"><?php echo display('end_date') ?></label>
                    <input type="text" name="to_date" class="form-control datepicker" id="to_date"
                        placeholder="<?php echo display('end_date') ?>"
                        value="<?php echo (!empty($to_date)?$to_date:$today) ?>">
                </div>

                <button type="button" id="btn-filter" class="btn btn-success"><?php echo display('find') ?></button>
                <a class="btn btn-warning" href="#"
                    onclick="printDiv('purchase_div')"><?php echo display('print') ?></a>
                <?php echo form_close() ?>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <span><?php echo display('due_report'); ?> </span>
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
                        <?php }?> </span>
                </div>
            </div>
            <div class="panel-body">
                <div id="purchase_div">
                    <div class="paddin5ps">
                        <table class="print-table paddin5ps" width="100%">

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
                                    <strong><?php echo display('due_report')?></strong>
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
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered" cellspacing="0" width="100%" id="reportlist">
                            <thead>
                                <tr>
                                    <th><?php echo display('sales_date') ?></th>
                                    <th><?php echo display('invoice_no') ?></th>
                                    <th><?php echo display('customer_name') ?></th>
                                    <th><?php echo display('total_amount') ?></th>
                                    <th><?php echo display('paid_amount') ?></th>
                                    <th><?php echo display('due_amount')?></th>
                                </tr>
                            </thead>

                            <tbody>
                               
                            </tbody>
                            <tfoot>
                                <th colspan="3" class="text-right"><?php echo display('total') ?>:</th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tfoot>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    "use strict";
    var csrf_test_name = $('#CSRF_TOKEN').val();
    var base_url = $('#base_url').val();
    var currency = $("#currency").val();
    var report = $('#reportlist').DataTable({
        responsive: true,

        "aaSorting": [
            [1, "asc"]
        ],
        "columnDefs": [{
                "bSortable": false,
                "aTargets": [0, 2, 3]
            },

        ],
        'processing': true,
        'serverSide': true,


        'lengthMenu': [
            [10, 25, 50, 100, 250, 500],
            [10, 25, 50, 100, 250, 500]
        ],

        dom: "'<'col-sm-4'l><'col-sm-4 text-center'><'col-sm-4'>Bfrtip",
        buttons: [{
            extend: "copy",
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5] //Your Colume value those you want
            },
            className: "btn-sm prints"
        }, {
            extend: "csv",
            title: "Report List",
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5] //Your Colume value those you want print
            },
            className: "btn-sm prints"
        }, {
            extend: "excel",
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5] //Your Colume value those you want print
            },
            title: "Report List",
            className: "btn-sm prints"
        }, {
            extend: "pdf",
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5] //Your Colume value those you want print
            },
            title: "Report List",
            className: "btn-sm prints"
        }, {
            extend: "print",
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5] //Your Colume value those you want print
            },
            title: "<center>Report List</center>",
            className: "btn-sm prints"
        }],

        'serverMethod': 'post',
        'ajax': {
            'url': base_url + 'report/report/get_retrieve_dateWise_DueReports',
            "data": function(data) {
                data.fromdate = $('#from_date').val();
                data.todate = $('#to_date').val();
                data.csrf_test_name = csrf_test_name;
            }
        },
        'columns': [{
                data: 'date'
            },
            {
                data: 'invoice_id'
            },
            {
                data: 'customer_name'
            },
            {
                data: 'total_amount',
                class: "total_amount text-right",
                render: $.fn.dataTable.render.number(',', '.', 2, currency)
            },
            {
                data: 'paid_amount',
                class: "paid_amount text-right",
                render: $.fn.dataTable.render.number(',', '.', 2, currency)
            },
            {
                data: 'due_amount',
                class: "due_amount text-right",
                render: $.fn.dataTable.render.number(',', '.', 2, currency)
            },
        ],

        "footerCallback": function(row, data, start, end, display) {
            var api = this.api();
            api.columns('.total_amount,.paid_amount,.due_amount', {
                page: 'current'
            }).every(function() {
                var sum = this
                    .data()
                    .reduce(function(a, b) {
                        var x = parseFloat(a) || 0;
                        var y = parseFloat(b) || 0;
                        return x + y;
                    }, 0);
                $(this.footer()).html(currency + ' ' + sum.toLocaleString(undefined, {
                    minimumFractionDigits: 2,
                    maximumFractionDigits: 2
                }));
            });
        }
    });

    $('#btn-filter').click(function() {
        report.ajax.reload();
    });
});
</script>