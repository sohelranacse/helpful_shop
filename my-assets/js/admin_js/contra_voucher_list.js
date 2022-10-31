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
var divName = "vaucherPrintArea";
var printContents = document.getElementById(divName).innerHTML;
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