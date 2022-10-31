    "use strict";
  function load_dbtvouchercode(id,sl){
 var base_url = $("#base_url").val();
    $.ajax({
        url : base_url + "account/account/debtvouchercode/" + id,
        type: "GET",
        dataType: "json",
        success: function(data)
        {
          
           $('#txtCode_'+sl).val(data);
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

    "use strict";
    function addaccountdbt(divName){
       var optionval = $("#headoption").val();
    var row = $("#debtAccVoucher tbody tr").length;
    var count = row + 1;
    var limits = 500;
    var tabin = 0;
    if (count == limits) alert("You have reached the limit of adding " + count + " inputs");
    else {
          var newdiv = document.createElement('tr');
          var tabin="cmbCode_"+count;
          var tabindex = count * 2;
          newdiv = document.createElement("tr");
           
          newdiv.innerHTML ="<td> <select name='cmbCode[]' id='cmbCode_"+ count +"' class='form-control' onchange='load_dbtvouchercode(this.value,"+ count +")' required></select></td><td><input type='text' name='txtCode[]' class='form-control'  id='txtCode_"+ count +"' ></td><td><input type='number' name='txtAmount[]' class='form-control total_price text-right' id='txtAmount_"+ count +"' onkeyup='dbtvouchercalculation("+ count +")' required></td><td><button class='btn btn-danger red' type='button'  onclick='deleteRowdbtvoucher(this)'><i class='fa fa-trash-o'></i></button></td>";
          document.getElementById(divName).appendChild(newdiv);
          document.getElementById(tabin).focus();
           $("#cmbCode_"+count).html(optionval);
          count++;
           
          $("select.form-control:not(.dont-select-me)").select2({
              placeholder: "Select option",
              allowClear: true
          });
        }
    }


    "use strict";
function dbtvouchercalculation(sl) {
       
        var gr_tot = 0;
        $(".total_price").each(function() {
            isNaN(this.value) || 0 == this.value.length || (gr_tot += parseFloat(this.value))
        });

        $("#grandTotal").val(gr_tot.toFixed(2,2));
    }

       "use strict";
    function deleteRowdbtvoucher(e) {
        var t = $("#debtAccVoucher > tbody > tr").length;
        if (1 == t) alert("There only one row you can't delete.");
        else {
            var a = e.parentNode.parentNode;
            a.parentNode.removeChild(a)
        }
        dbtvouchercalculation()
    }




    "use strict";
    function addaccountContravoucher(divName){
    var optionval = $("#headoption").val();
    var row = $("#debtAccVoucher tbody tr").length;
    var count = row + 1;
    var limits = 500;
    var tabin = 0;
    if (count == limits) alert("You have reached the limit of adding " + count + " inputs");
    else {
          var newdiv = document.createElement('tr');
          var tabin="cmbCode_"+count;
          var tabindex = count * 2;
          newdiv = document.createElement("tr");
           
          newdiv.innerHTML ="<td> <select name='cmbCode[]' id='cmbCode_"+ count +"' class='form-control' onchange='load_dbtvouchercode(this.value,"+ count +")' required></select></td><td><input type='text' name='txtCode[]' class='form-control'  id='txtCode_"+ count +"' ></td><td><input type='number' name='txtAmount[]' class='form-control total_price text-right' value='0' id='txtAmount_"+ count +"' onkeyup='calculationContravoucher("+ count +")'></td><td><input type='number' name='txtAmountcr[]' class='form-control total_price1 text-right' id='txtAmount1_"+ count +"' value='0' onkeyup='calculationContravoucher("+ count +")'></td><td><button  class='btn btn-danger red' type='button'  onclick='deleteRowContravoucher(this)'><i class='fa fa-trash-o'></i></button></td>";
          document.getElementById(divName).appendChild(newdiv);
          document.getElementById(tabin).focus();
           $("#cmbCode_"+count).html(optionval);
          count++;
           
          $("select.form-control:not(.dont-select-me)").select2({
              placeholder: "Select option",
              allowClear: true
          });
        }
    }


    "use strict";
function calculationContravoucher(sl) {
        var gr_tot1=0;
        var gr_tot = 0;
        $(".total_price").each(function() {
            isNaN(this.value) || 0 == this.value.length || (gr_tot += parseFloat(this.value))
        });

 $(".total_price1").each(function() {
            isNaN(this.value) || 0 == this.value.length || (gr_tot1 += parseFloat(this.value))
        });
        $("#grandTotal").val(gr_tot.toFixed(2,2));
         $("#grandTotal1").val(gr_tot1.toFixed(2,2));
    }


      "use strict";
    function deleteRowContravoucher(e) {
        var t = $("#debtAccVoucher > tbody > tr").length;
        if (1 == t) alert("There only one row you can't delete.");
        else {
            var a = e.parentNode.parentNode;
            a.parentNode.removeChild(a)
        }
        calculationContravoucher()
    }

    "use strict";
      function bank_paymet(val){
        if(val==2){
           var style = 'block'; 
           document.getElementById('bank_id').setAttribute("required", true);
        }else{
   var style ='none';
    document.getElementById('bank_id').removeAttribute("required");
        }
           
    document.getElementById('bank_div').style.display = style;
    }
    
     $( document ).ready(function() {
  

      $(".bankpayment").css("width", "100%");
    });


/*supplier receive part*/
    "use strict";
 function load_supplier_code(id,sl){
   var base_url = $("#base_url").val();
   var csrf_test_name = $('[name="csrf_test_name"]').val();
    $.ajax({
        url : base_url + "account/accounts/supplier_dueheadcode",
        type: "POST",
        data: {
             supplier_id: id,
             csrf_test_name: csrf_test_name

                },
        success: function(data)
        {
          
            var obj = jQuery.parseJSON(data);

            
           $('#txtCode_'+sl).val(obj.headcode);
           $('#voucher_no_1').html(obj.vouchers);
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}


    "use strict";
function supplierRcvcalculation(sl) {
       var due_amount = $('#due_'+sl).val();
       var paid = $("#txtAmount_"+sl).val();
       if(parseFloat((due_amount?due_amount:0)) < parseFloat((paid?paid:0))){
        toastr.error('Paid Amount Can not be greater than  Due Amount');
        $("#txtAmount_"+sl).val('');
        $("#txtAmount_"+sl).focus();
        return false;
       }
       
        var gr_tot = 0;
        $(".total_price").each(function() {
            isNaN(this.value) || 0 == this.value.length || (gr_tot += parseFloat(this.value))
        });

        $("#grandTotal").val(gr_tot.toFixed(2,2));
        var length = $(".number").length;
        $(".number:eq(0)").val(parseFloat(gr_tot.toFixed(2,2)));
    }

    /*customer receive part*/
        "use strict";
      function load_customer_code(id,sl){
        
       var base_url = $("#base_url").val();
        var csrf_test_name = $('[name="csrf_test_name"]').val();
        $.ajax({
        url : base_url + "account/accounts/customer_headcode",
        type: "POST",
         data: {
             customer_id: id,
             csrf_test_name: csrf_test_name

                },
        success: function(data)
        {
            var obj = jQuery.parseJSON(data);
           $('#txtCode_'+sl).val(obj.headcode);
           $('#voucher_no_1').html(obj.vouchers);
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

    "use strict";
function CustomerRcvcalculation(sl) {

    var due_amount = $('#due_'+sl).val();
    var paid = $("#txtAmount_"+sl).val();
    if(parseFloat((due_amount?due_amount:0)) < parseFloat((paid?paid:0))){
     toastr.error('Paid Amount Can not be greater than  Due Amount');
     $("#txtAmount_"+sl).val('');
     $("#txtAmount_"+sl).focus();
     return false;
    }
    var gr_tot = 0;
    $(".total_price").each(function() {
        isNaN(this.value) || 0 == this.value.length || (gr_tot += parseFloat(this.value))
    });

    $("#grandTotal").val(gr_tot.toFixed(2,2));

    var length = $(".number").length;
    $(".number:eq(0)").val(parseFloat(gr_tot.toFixed(2,2)));
    }

    /*report part start */
    "use strict";
        function cmbCode_bankbookonchange(){
      var Sel=$('#cmbCode').val();
      var Text=$('#cmbCode').text();
      var select= $("option:selected", $("#cmbCode")).text()
        $("#txtName").val(select);
        $("#txtCode").val(Sel);
    }


      $(document).ready(function(){
            "use strict";
        var csrf_test_name = $('[name="csrf_test_name"]').val();
        var base_url = $("#base_url").val();
        $('#cmbGLCode').on('change',function(){
           var Headid=$(this).val();
            $.ajax({
                 url: base_url + 'account/account/general_led',
                type: 'POST',
                data: {
                    Headid: Headid,
                    csrf_test_name:csrf_test_name,
                },
                success: function (data) {
                   $("#ShowmbGLCode").html(data);
                }
            });

        });
    });

 $('body').on('keypress', '.valid_number', function(event) {
    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode != 46 && charCode != 45 && charCode > 31 &&
        (charCode < 48 || charCode > 57)) {
        toastr["error"]('Please Input Valid Number');
        return false;
    }


    return true;

});


    /*service payment part*/
    "use strict";
    function load_customer_service_code(id,sl){
      
     var base_url = $("#base_url").val();
      var csrf_test_name = $('[name="csrf_test_name"]').val();
      $.ajax({
      url : base_url + "account/accounts/customer_service_headcode",
      type: "POST",
       data: {
           customer_id: id,
           csrf_test_name: csrf_test_name

              },
      success: function(data)
      {
          var obj = jQuery.parseJSON(data);
         $('#txtCode_'+sl).val(obj.headcode);
         $('#due_'+sl).val(null);
         $('#txtAmount_'+sl).val(null);
         $('#voucher_no_1').html(obj.vouchers);
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
          alert('Error get data from ajax');
      }
  });
}

  "use strict";
function CustomerServiceRcvcalculation(sl) {

  var due_amount = $('#due_'+sl).val();
  var paid = $("#txtAmount_"+sl).val();
  if(parseFloat((due_amount?due_amount:0)) < parseFloat((paid?paid:0))){
   toastr.error('Paid Amount Can not be greater than  Due Amount');
   $("#txtAmount_"+sl).val('');
   $("#txtAmount_"+sl).focus();
   return false;
  }
  var gr_tot = 0;
  $(".total_price").each(function() {
      isNaN(this.value) || 0 == this.value.length || (gr_tot += parseFloat(this.value))
  });

  $("#grandTotal").val(gr_tot.toFixed(2,2));

  var length = $(".number").length;
  $(".number:eq(0)").val(parseFloat(gr_tot.toFixed(2,2)));
  }

