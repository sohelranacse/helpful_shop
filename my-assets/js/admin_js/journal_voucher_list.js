function showVaucherDetail(vno,vtype) {
       
    var base_url = $("#base_url").val(); 
    var submit_url = base_url+'account/accounts/voucherDetails';
     
    $.ajax({
        type: 'POST',
        url: submit_url,
        dataType : 'JSON',
        data: {vno:vno, vtype:vtype},
        success: function(res) {
                   
          $('#all_vaucher_view').html(res.data);
          $("a#pdfDownload").prop("href", base_url+"/"+ res.pdf);
          $('#allvaucherModal').modal('show');
        }
    });   

}

"use strict";
function printVaucher(modald) {    
var printContents = document.getElementById(modald).innerHTML;
var originalContents = document.body.innerHTML;
document.body.innerHTML = printContents;

window.print();
document.body.innerHTML = originalContents;
setTimeout(function() {
 
    location.reload();
   }, 100);
}
// Delete voucher
"use strict";
function deleteVoucher(vno) {  
var conf = confirm('Are You Sure ?');
if(conf) {
var base_url = $("#base_url").val();
$.ajax({
    url : base_url + "account/accounts/deleteVoucher/",
    type: "POST",
    dataType: "json",
    data: { vno: vno},
    success: function(data)
    {   
        if(data.success == "ok") {
            location.reload();
        }
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
        alert('Error get data from ajax');
    }
});
}
}
// reverse voucher
"use strict";
function reverseVoucher(vno) {  
var conf = confirm('Are You Sure ?');
if(conf) {
var base_url = $("#base_url").val();
$.ajax({
    url : base_url + "account/accounts/reverseVoucher/",
    type: "POST",
    dataType: "json",
    data: { vno: vno},
    success: function(data)
    {   
        if(data.success == "nofiscalyeal") {
            toastr["error"]('Please Create Financial Year First ');
        }
        
        if(data.success == "ok") {
            location.reload();
        }
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
        alert('Error get data from ajax');
    }
});
}
}


$(document).ready(function() {
    "use strict";
var csrf_test_name = $('#CSRF_TOKEN').val();

var base_url = $("#base_url").val();
 var currency = $("#currency").val();
var journalvList = $('#journalvList').DataTable({ 
       responsive: true,

       "aaSorting": [[2, "desc" ]],
       "columnDefs": [
        { "bSortable": false, "aTargets": [0,3,4,5,6,7,8,9] },

      ],
     'processing': true,
     'serverSide': true,

    
     'lengthMenu':[[10, 25, 50,100,250,500,1000], [10, 25, 50,100,250,500,1000]],

       dom:"'<'col-sm-4'l><'col-sm-4 text-center'><'col-sm-4'>Bfrtip", buttons:[ {
          extend: "copy",exportOptions: {
                 columns: [ 0,1,2,3,4,5,6,7,8 ] //Your Colume value those you want
                     }, className: "btn-sm prints"
      }
      , {
          extend: "csv", title: "JournalVoucher",exportOptions: {
                 columns: [ 0,1,2,3,4,5,6,7,8] //Your Colume value those you want print
                     }, className: "btn-sm prints"
      }
      , {
          extend: "excel",exportOptions: {
                 columns: [0,1,2,3,4,5 ,6,7,8] //Your Colume value those you want print
                     }, title: "JournalVoucher", className: "btn-sm prints"
      }
      , {
          extend: "pdf",exportOptions: {
                 columns: [0,1,2,3,4,5,6,7,8] //Your Colume value those you want print
                     }, title: "JournalVoucher", className: "btn-sm prints"
      }
      , {
          extend: "print",exportOptions: {
                 columns: [ 0,1,2,3,4,5,6,7,8] //Your Colume value those you want print
                     },title: "<center> JournalVoucher</center>", className: "btn-sm prints"
      }
      ],

      
      'serverMethod': 'post',
      'ajax': {
         'url':base_url + 'account/accounts/CheckjournalvoucherList',
           "data": function ( data) {
            data.csrf_test_name = csrf_test_name;
  
}
      },
    'columns': [
       { data: 'sl' },
       { data: 'VNo'},
       { data: 'VDate'},
       { data: 'HeadName'},
       { data: 'ledgerComment' },
       { data: 'name' },
       { data: 'Debit',class:"total_sale text-right",render: $.fn.dataTable.render.number( ',', '.', 2, currency)},
       { data: 'Credit',class:"total_sale text-right",render: $.fn.dataTable.render.number( ',', '.', 2, currency )},
       { data: 'reverseHead' },
       { data: 'button'},
    ],


});


$('#btn-filter').click(function(){ 
    journalvList.ajax.reload();  
});

});