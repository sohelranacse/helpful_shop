
$(document).ready(function() { 
    "use strict";
var csrf_test_name = $('#CSRF_TOKEN').val();

var base_url = $("#base_url").val();
 var currency = $("#currency").val();
var vpproveList = $('#vpproveList').DataTable({ 
       responsive: true,

       "aaSorting": [[2, "desc" ]],
       "columnDefs": [
        { "bSortable": false, "aTargets": [0,1,3,4,5,6,7] },

      ],
     'processing': true,
     'serverSide': true,

    
     'lengthMenu':[[10, 25, 50,100,250,500,1000], [10, 25, 50,100,250,500,1000]],

       dom:"'<'col-sm-4'l><'col-sm-4 text-center'><'col-sm-4'>Bfrtip", buttons:[ {
          extend: "copy",exportOptions: {
                 columns: [ 0,1,2,3,4,5 ] //Your Colume value those you want
                     }, className: "btn-sm prints"
      }
      , {
          extend: "csv", title: "voucherApproval",exportOptions: {
                 columns: [ 0,1,2,3,4,5] //Your Colume value those you want print
                     }, className: "btn-sm prints"
      }
      , {
          extend: "excel",exportOptions: {
                 columns: [0,1,2,3,4,5 ] //Your Colume value those you want print
                     }, title: "voucherApproval", className: "btn-sm prints"
      }
      , {
          extend: "pdf",exportOptions: {
                 columns: [0,1,2,3,4,5] //Your Colume value those you want print
                     }, title: "voucherApproval", className: "btn-sm prints"
      }
      , {
          extend: "print",exportOptions: {
                 columns: [ 0,1,2,3,4,5] //Your Colume value those you want print
                     },title: "<center> voucherApproval</center>", className: "btn-sm prints"
      }
      ],

      
      'serverMethod': 'post',
      'ajax': {
         'url':base_url + 'account/accounts/CheckvoucherList',
           "data": function ( data) {
            data.csrf_test_name = csrf_test_name;
  
}
      },
    'columns': [
       { data: 'checkbox' },
       { data: 'referenceNo'},
       { data: 'VNo'},
       { data: 'HeadName'},
       { data: 'Narration' },
       { data: 'Debit',class:"total_sale text-right",render: $.fn.dataTable.render.number( ',', '.', 2, currency)},
       { data: 'Credit',class:"total_sale text-right",render: $.fn.dataTable.render.number( ',', '.', 2, currency )},
       { data: 'button'},
    ],


});


$('#btn-filter').click(function(){ 
    vpproveList.ajax.reload();  
});

});


"use strict";
function checkAll(el) {
    if (el.checked){
      $(":checkbox").prop('checked', true);
   }else{
       $(":checkbox").prop('checked', false);
   }        
}
function checkValue() {
   
   var checkBoxes = document.getElementsByClassName( 'approvalCheckbox' );
   if(checkBoxes.length > 0) {
       var isChecked = false;
       for (var i = 0; i < checkBoxes.length; i++) {
           if ( checkBoxes[i].checked ) {
               isChecked = true;
           }
       }
       if ( isChecked ) {
          var conf = confirm('Are you sure approve all voucher?');
           if(conf) {
               return true;
           } else {
               return false;
           }
       } else {
           alert('Please select voucher to approve!');
           return false;
       }   
    } else {
      alert('There is no voucher to approve!');
      return false;
  }


   
}