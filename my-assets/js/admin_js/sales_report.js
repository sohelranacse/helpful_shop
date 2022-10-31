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
                columns: [0, 1, 2, 3] //Your Colume value those you want
            },
            className: "btn-sm prints"
        }, {
            extend: "csv",
            title: "Report List",
            exportOptions: {
                columns: [0, 1, 2, 3] //Your Colume value those you want print
            },
            className: "btn-sm prints"
        }, {
            extend: "excel",
            exportOptions: {
                columns: [0, 1, 2, 3] //Your Colume value those you want print
            },
            title: "Report List",
            className: "btn-sm prints"
        }, {
            extend: "pdf",
            exportOptions: {
                columns: [0, 1, 2, 3] //Your Colume value those you want print
            },
            title: "Report List",
            className: "btn-sm prints"
        }, {
            extend: "print",
            exportOptions: {
                columns: [0, 1, 2, 3] //Your Colume value those you want print
            },
            title: "<center>Report List</center>",
            className: "btn-sm prints"
        }],

        'serverMethod': 'post',
        'ajax': {
            'url': base_url + 'report/report/getSalesReportList',
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
        ],

        "footerCallback": function(row, data, start, end, display) {
            var api = this.api();
            api.columns('.total_amount', {
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