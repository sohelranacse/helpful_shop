//Add Input Field Of Row
    "use strict";
function addInputField(t) {
    var row = $("#normalinvoice tbody tr").length;
    var count = row + 1;
       var tab1 = 0;
       var tab2 = 0;
       var tab3 = 0;
       var tab4 = 0;
       var tab5 = 0;
       var tab6 = 0;
       var tab7 = 0;
       var tab8 = 0;
       var tab9 = 0;
       var tab10 = 0;
       var tab11 = 0;
       var tab12 = 0;
    var limits = 500;
    var taxnumber = $("#txfieldnum").val();
    var tbfild ='';
    for(var i=0;i<taxnumber;i++){
        var taxincrefield = '<input id="total_tax'+i+'_'+count+'" class="total_tax'+i+'_'+count+'" type="hidden"><input id="all_tax'+i+'_'+count+'" class="total_tax'+i+'" type="hidden" name="tax[]">';
         tbfild +=taxincrefield;
    }
    if (count == limits)
        alert("You have reached the limit of adding " + count + " inputs");
    else {
        var a = "service_name" + count,
                tabindex = count * 5,
                e = document.createElement("tr");
        tab1 = tabindex + 1;
        tab2 = tabindex + 2;
        tab3 = tabindex + 3;
        tab4 = tabindex + 4;
        tab5 = tabindex + 5;
        tab6 = tabindex + 6;
        tab7 = tabindex + 7;
        tab8 = tabindex + 8;
        tab9 = tabindex + 9;
        tab10 = tabindex + 10;
        tab11 = tabindex + 11;
        tab12 = tabindex + 12;
        e.innerHTML = "<td><input type='text' name='service_name' onkeypress='invoice_serviceList(" + count + 
        ");' class='form-control serviceSelection common_product' placeholder='Service Name' id='" + a + 
        "' required tabindex='" + tab1 + "'><input type='hidden' class='common_product autocomplete_hidden_value  service_id_" + count + 
        "' name='service_id[]' id='SchoolHiddenId'/></td><td> <input type='text' name='product_quantity[]' required='required' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='total_qntt_" + count + "'value='1' class='common_qnt total_qntt_" + count + 
        " form-control text-right'  placeholder='0.00' min='0' tabindex='" + tab2 + "'/></td><td><input type='text' name='product_rate[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='price_item_" + count + "' class='common_rate price_item" + count + 
        " form-control text-right' required placeholder='0.00' min='0' tabindex='" + tab3 + "'/></td><td><input type='text' name='discount[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='discount_" + count + "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab4 + 
        "' /> <input type='hidden' value='' name='discount_type' id='discount_type_" + count + 
        "' ></td><td><input type='text' name='discountvalue[]' readonly id='discount_value_" + count + "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab10 + 
        "' /></td><td><input type='text' name='vatpercent[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='vat_percent_" + count + "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab11 + 
        "' /></td><td><input type='text' name='vatvalue[]' id='vat_value_" + count + "' class='form-control text-right total_vatamnt common_discount' readonly placeholder='0.00' min='0' tabindex='" + tab12 + 
        "' /></td><td class='text-right'><input class='common_total_price total_price form-control text-right' type='text' name='total_price[]' id='total_price_" + count + 
        "' value='0.00' readonly='readonly'/></td><td>"+tbfild+"<input type='hidden'  id='total_discount_" + count + "' /><input type='hidden' id='all_discount_" + count + 
        "' class='total_discount dppr' name='discount_amount[]'/><button tabindex='" + tab5 + 
        "' style='text-align: right;' class='btn btn-danger' type='button' value='Delete' onclick='deleteRow(this)'><i class='fa fa-close'></i></button></td>",
                document.getElementById(t).appendChild(e),
                document.getElementById(a).focus(),
                document.getElementById("add_invoice_item").setAttribute("tabindex", tab6);
        document.getElementById("paidAmount").setAttribute("tabindex", tab7);
        document.getElementById("add_invoice").setAttribute("tabindex", tab9);
        count++
    }
}
function addInputField_dynamic(t) {
    var row = $("#normalinvoice tbody tr").length;
    var count = row + 1;
       var tab1 = 0;
       var tab2 = 0;
       var tab3 = 0;
       var tab4 = 0;
       var tab5 = 0;
       var tab6 = 0;
       var tab7 = 0;
       var tab8 = 0;
       var tab9 = 0;
       var tab10 = 0;
       var tab11 = 0;
       var tab12 = 0;
    var limits = 500;
    var taxnumber = $("#txfieldnum").val();
    var tbfild ='';
    for(var i=0;i<taxnumber;i++){
        var taxincrefield = '<input id="total_tax'+i+'_'+count+'" class="total_tax'+i+'_'+count+'" type="hidden"><input id="all_tax'+i+'_'+count+'" class="total_tax'+i+'" type="hidden" name="tax[]">';
         tbfild +=taxincrefield;
    }
    if (count == limits)
        alert("You have reached the limit of adding " + count + " inputs");
    else {
        var a = "service_name" + count,
                tabindex = count * 5,
                e = document.createElement("tr");
        tab1 = tabindex + 1;
        tab2 = tabindex + 2;
        tab3 = tabindex + 3;
        tab4 = tabindex + 4;
        tab5 = tabindex + 5;
        tab6 = tabindex + 6;
        tab7 = tabindex + 7;
        tab8 = tabindex + 8;
        tab9 = tabindex + 9;
        tab10 = tabindex + 10;
        tab11 = tabindex + 11;
        tab12 = tabindex + 12;
        e.innerHTML = "<td><input type='text' name='service_name' onkeypress='invoice_serviceList(" + count + 
        ");' class='form-control serviceSelection common_product' placeholder='Service Name' id='" + a + 
        "' required tabindex='" + tab1 + "'><input type='hidden' class='common_product autocomplete_hidden_value  service_id_" + count + 
        "' name='service_id[]' id='SchoolHiddenId'/></td><td> <input type='text' name='product_quantity[]' required='required' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='total_qntt_" + count + "'value='1' class='common_qnt total_qntt_" + count + 
        " form-control text-right'  placeholder='0.00' min='0' tabindex='" + tab2 + "'/></td><td><input type='text' name='product_rate[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='price_item_" + count + "' class='common_rate price_item" + count + 
        " form-control text-right' required placeholder='0.00' min='0' tabindex='" + tab3 + "'/></td><td><input type='text' name='discount[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='discount_" + count + "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab4 + 
        "' /> <input type='hidden' value='' name='discount_type' id='discount_type_" + count + 
        "' ></td><td><input type='text' name='discountvalue[]' readonly id='discount_value_" + count + "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab10 + 
        "' /></td><td class='text-right'><input class='common_total_price total_price form-control text-right' type='text' name='total_price[]' id='total_price_" + count + 
        "' value='0.00' readonly='readonly'/></td><td>"+tbfild+"<input type='hidden'  id='total_discount_" + count + "' /><input type='hidden' id='all_discount_" + count + 
        "' class='total_discount dppr' name='discount_amount[]'/><button tabindex='" + tab5 + 
        "' style='text-align: right;' class='btn btn-danger' type='button' value='Delete' onclick='deleteRow(this)'><i class='fa fa-close'></i></button></td>",
                document.getElementById(t).appendChild(e),
                document.getElementById(a).focus(),
                document.getElementById("add_invoice_item").setAttribute("tabindex", tab6);
        document.getElementById("paidAmount").setAttribute("tabindex", tab7);
        document.getElementById("add_invoice").setAttribute("tabindex", tab9);
        count++
    }
}
//Quantity calculat
    "use strict";
function quantity_calculate(item) {
    var quantity = $("#total_qntt_" + item).val();
    var price_item = $("#price_item_" + item).val();
    var invoice_discount = $("#invoice_discount").val();
    var discount = $("#discount_" + item).val();
    var vat_percent = $("#vat_percent_" + item).val();
    var taxnumber = $("#txfieldnum").val();
    var total_discount = $("#total_discount_" + item).val();
    var dis_type = $("#discount_type").val();


    if (quantity > 0 || discount > 0 || vat_percent > 0) {
        if (dis_type == 1) {
            var price = quantity * price_item;

            // Discount cal per product
            var dis = +(price * discount / 100);
            
            $("#discount_value_" + item).val(dis);
            $("#all_discount_" + item).val(dis);

            //Total price calculate per product
            var temp = price - dis;
             // product wise vat start
             var vat =+(temp * vat_percent / 100);
             $("#vat_value_" + item).val(vat);
             // product wise vat end
            var ttletax = 0;
            $("#total_price_" + item).val(temp);
             for(var i=0;i<taxnumber;i++){
           var tax = (temp) * $("#total_tax"+i+"_" + item).val();
           ttletax += Number(tax);
            $("#all_tax"+i+"_" + item).val(tax);
            
            }

          
        } else if (dis_type == 2) {
            var price = quantity * price_item;

            // Discount cal per product
            var dis = (discount * quantity);
            $("#discount_value_" + item).val(dis);
            $("#all_discount_" + item).val(dis);

            //Total price calculate per product
            var temp = price - dis;
            $("#total_price_" + item).val(temp);

            // product wise vat start
            var vat =+(temp * vat_percent / 100);
            $("#vat_value_" + item).val(vat);
            // product wise vat end
            var ttletax = 0;
             for(var i=0;i<taxnumber;i++){
           var tax = (temp) * $("#total_tax"+i+"_" + item).val();
           ttletax += Number(tax);
            $("#all_tax"+i+"_" + item).val(tax);
    }
        } else if (dis_type == 3) {
            var total_price = quantity * price_item;
            
            
            // Discount cal per product
            $("#discount_value_" + item).val(discount);
            $("#all_discount_" + item).val(discount);
            //Total price calculate per product
            var price = (total_price - discount);
            $("#total_price_" + item).val(price);

             // product wise vat start
            var vat =+(price * vat_percent / 100);
            $("#vat_value_" + item).val(vat);
            // product wise vat end
             var ttletax = 0;
             for(var i=0;i<taxnumber;i++){
           var tax = (price) * $("#total_tax"+i+"_" + item).val();
           ttletax += Number(tax);
            $("#all_tax"+i+"_" + item).val(tax);
    }
        }
    } else {
        var n = quantity * price_item;
        var c = quantity * price_item;
        $("#total_price_" + item).val(n),
                $("#all_tax_" + item).val(c)
    }
    calculateSum();
    // invoice_paidamount();

    var invoice_edit_page = $("#invoice_edit_page").val();
    var preload_pay_view = $("#preload_pay_view").val();
    var is_credit_edit = $('#is_credit_edit').val();
    
    $("#add_new_payment").empty();
   
    $("#pay-amount").text('0');
    $("#dueAmmount").val(0);
    if (invoice_edit_page == 1 ) {
        var base_url = $('#base_url').val();
        var csrf_test_name = $('[name="csrf_test_name"]').val();
        var gtotal=$(".grandTotalamnt").val();
        var url= base_url + "service/service/bdtask_showpaymentmodal";
        $.ajax({
            type: "post",
            url: url,
            data:{is_credit_edit:is_credit_edit,csrf_test_name:csrf_test_name},
            success: function(data) {
              
              $($('#add_new_payment').append(data));
             
              $("#pamount_by_method").val(gtotal);
              $("#preload_pay_view").val('1');
              $("#add_new_payment_type").prop('disabled',false);
              var card_typesl = $('.card_typesl').val();
                if(card_typesl == 0){
                    $("#add_new_payment_type").prop('disabled',true);
                }
            }
          }); 
       
    }
}
//Calculate Sum

    "use strict";
function calculateSum() {

  var taxnumber = $("#txfieldnum").val();
           
          var t = 0,          
            a = 0,
            e = 0,
            o = 0,
            p = 0,
            f = 0,
            v = 0,
            ad = 0,
            ds = 0,
            s_cost =  $("#shipping_cost").val();

  //Total Tax
for(var i=0;i<taxnumber;i++){
      
var j = 0;
    $(".total_tax"+i).each(function () {
        isNaN(this.value) || 0 == this.value.length || (j += parseFloat(this.value))
    });
            $("#total_tax_ammount"+i).val(j.toFixed(2, 2));
             
    }
 
        //Discount part
         $(".total_discount").each(function () {
        isNaN(this.value) || 0 == this.value.length || (p += parseFloat(this.value))
    }),
    
            $("#total_discount_ammount").val(p.toFixed(2, 2)),
           

            $(".total_vatamnt").each(function () {
                isNaN(this.value) || 0 == this.value.length || (v += parseFloat(this.value))
            }),
            $("#total_vat_amnt").val(v.toFixed(2, 2)),

    $(".totalTax").each(function () {
        isNaN(this.value) || 0 == this.value.length || (f += parseFloat(this.value))
    }),
            $("#total_tax_amount").val(f.toFixed(2, 2)),
         
            //Total Price
            $(".total_price").each(function () {
        isNaN(this.value) || 0 == this.value.length || (t += parseFloat(this.value))
    }),
    $(".dppr").each(function () {
        isNaN(this.value) || 0 == this.value.length || (ad += parseFloat(this.value))
    }),
            o = f.toFixed(2, 2),
            e = t.toFixed(2, 2);
    f = p.toFixed(2, 2);

    var test = +o + +s_cost + +e + -f+ + ad;
    $("#grandTotal").val(test.toFixed(2, 2));

    var gt = $("#grandTotal").val();
    var invdis = $("#invoice_discount").val();
    var vatamnt = $("#total_vat_amnt").val();
    var total_discount_ammount = $("#total_discount_ammount").val();
    var ttl_discount = +total_discount_ammount + +invdis;
    var grnt_totals =parseFloat(gt) + parseFloat(vatamnt);
    $("#grandTotal").val(grnt_totals.toFixed(2, 2));
    $('#paidAmount').val(grnt_totals.toFixed(2, 2));
    $("#pamount_by_method").val(grnt_totals.toFixed(2, 2));

}

//Invoice Paid Amount
    "use strict";
function invoice_paidamount() {
    var  prb = parseFloat($("#previous").val(), 10);
    var pr = 0;
    var d = 0;
    var nt = 0;
    if(prb != 0){
        pr =  prb;
    }else{
        pr = 0;
    }
    var t = $("#grandTotal").val(),
    a = $("#paidAmount").val(),
    e = t - a,
    f = e + pr,
    nt = parseFloat(t, 10) + pr;
    d = a - nt;

    $("#pamount_by_method").val(a);
    $("#add_new_payment").empty();
    $("#pay-amount").text('0');
    $("#n_total").val(nt.toFixed(2, 2));      
    if(e > 0){
        $("#dueAmmount").val(e.toFixed(2,2));
        if(a <= f){
            $("#change").val(0);   
        }
    }else{
        if(a < f){
            $("#change").val(0);   
        }
        if(a > f){
            $("#change").val(d.toFixed(2,2))
        }
        $("#dueAmmount").val(0)   
    }

    var invoice_edit_page = $("#invoice_edit_page").val();
    var is_credit_edit = $('#is_credit_edit').val();

    if (invoice_edit_page == 1 ) {
        var base_url = $('#base_url').val();
        var csrf_test_name = $('[name="csrf_test_name"]').val();
        var gtotal=$(".grandTotalamnt").val();
        var url= base_url + "service/service/bdtask_showpaymentmodal";
        $.ajax({
            type: "post",
            url: url,
            data:{csrf_test_name:csrf_test_name,is_credit_edit:is_credit_edit},
            success: function(data) {
                $('#add_new_payment').append(data);
                $("#pamount_by_method").val(a);
                $("#add_new_payment_type").prop('disabled',false);
            }
        });
    }
}

$(document).on('click','#add_invoice',function(){
    var total = 0;
    $( ".pay" ).each( function(){
      total += parseFloat( $( this ).val() ) || 0;
    });

    var gtotal=$("#paidAmount").val();
    if (total != gtotal) {
      toastr.error('Paid Amount Should Equal To Payment Amount')

      
      return false;
    }
  });

// ******* new payment add start *******
$(document).on('click','#add_new_payment_type',function(){
    var base_url = $('#base_url').val();
    var csrf_test_name = $('[name="csrf_test_name"]').val();
    var gtotal=$("#paidAmount").val();
    
    var total = 0;
    $( ".pay" ).each( function(){
      total += parseFloat( $( this ).val() ) || 0;
    });
    
   
    var is_credit_edit = $('#is_credit_edit').val();
    if(total>=gtotal){
      alert("Paid amount is exceed to Total amount.");
      
      return false;
    }
      
    var url= base_url + "service/service/bdtask_showpaymentmodal";
    $.ajax({
      type: "post",
      url: url,
      data:{is_credit_edit:is_credit_edit, csrf_test_name:csrf_test_name},
      success: function(data) {
        
        $($('#add_new_payment').append(data)).show("slow", function(){
          });
        var length = $(".number").length;

        var total3 = 0;
        $( ".pay" ).each( function(){
          total3 += parseFloat( $( this ).val() ) || 0;
        });

        var nextamnt = gtotal -total3;


        $(".number:eq("+(length-1)+")").val(nextamnt.toFixed(2,2));
        var total2 = 0;
        $( ".number" ).each( function(){
          total2 += parseFloat( $( this ).val() ) || 0;
        });
        var dueamnt = parseFloat(gtotal) - total2
        
        
      }
    }); 
  });

  function changedueamount(){
    var inputval = parseFloat(0);
    var maintotalamount = $('.grandTotalamnt').val();
    
    $(".number").each(function(){
      var inputdata= parseFloat($(this).val());
      inputval = inputval+inputdata;

    });

    var restamount=(parseFloat(maintotalamount))-(parseFloat(inputval));
    var changes=restamount.toFixed(3);
    if(changes <=0){
      $("#change-amount").text(Math.abs(changes));
      $("#pay-amount").text(0);
    }
    else{
      $("#change-amount").text(0);
      $("#pay-amount").text(changes);
    }  
  }

  // ******* new payment add end *******



//Invoice full paid
    "use strict";
function full_paid() {
    var grandTotal = $("#n_total").val();
    $("#paidAmount").val(grandTotal);
    invoice_paidamount();
    calculateSum();
}

//Delete a row of table
    "use strict";
function deleteRow(t) {
    var a = $("#normalinvoice > tbody > tr").length;

    if (1 == a)
        alert("There only one row you can't delete.");
    else {
        var e = t.parentNode.parentNode;
        e.parentNode.removeChild(e),
                calculateSum();

        var current = 1;
        $("#normalinvoice > tbody > tr td input.productSelection").each(function () {
            current++;
            $(this).attr('id', 'product_name' + current);
        });
        var common_qnt = 1;
        $("#normalinvoice > tbody > tr td input.common_qnt").each(function () {
            common_qnt++;
            $(this).attr('id', 'total_qntt_' + common_qnt);
            $(this).attr('onkeyup', 'quantity_calculate('+common_qnt+');');
            $(this).attr('onchange', 'quantity_calculate('+common_qnt+');');
        });
        var common_rate = 1;
        $("#normalinvoice > tbody > tr td input.common_rate").each(function () {
            common_rate++;
            $(this).attr('id', 'price_item_' + common_rate);
            $(this).attr('onkeyup', 'quantity_calculate('+common_qnt+');');
            $(this).attr('onchange', 'quantity_calculate('+common_qnt+');');
        });
        var common_discount = 1;
        $("#normalinvoice > tbody > tr td input.common_discount").each(function () {
            common_discount++;
            $(this).attr('id', 'discount_' + common_discount);
            $(this).attr('onkeyup', 'quantity_calculate('+common_qnt+');');
            $(this).attr('onchange', 'quantity_calculate('+common_qnt+');');
        });
        var common_total_price = 1;
        $("#normalinvoice > tbody > tr td input.common_total_price").each(function () {
            common_total_price++;
            $(this).attr('id', 'total_price_' + common_total_price);
        });

        var invoice_edit_page = $("#invoice_edit_page").val();
        
        $("#add_new_payment").empty();
        
        $("#pay-amount").text('0');
        var is_credit_edit = $('#is_credit_edit').val();
        if (invoice_edit_page == 1 ) {
           
            var base_url = $('#base_url').val();
            var csrf_test_name = $('[name="csrf_test_name"]').val();
            var gtotal=$(".grandTotalamnt").val();
            var url= base_url + "service/service/bdtask_showpaymentmodal";
            $.ajax({
                type: "post",
                url: url,
                data:{csrf_test_name:csrf_test_name,is_credit_edit:is_credit_edit},
                success: function(data) {
                  $($('#add_new_payment').append(data));
                  $("#pamount_by_method").val(gtotal);
                  $("#add_new_payment_type").prop('disabled',false);
                }
              }); 
            
        }



    }
}
var count = 2,
        limits = 500;

      "use strict";
    function bank_info_show(payment_type)
    {
        if (payment_type.value == "1") {
            document.getElementById("bank_info_hide").style.display = "none";
        } else {
            document.getElementById("bank_info_hide").style.display = "block";
        }
    }


    

    $( document ).ready(function() {
            "use strict";
    $('#normalinvoice .toggle').on('click', function() {
    $('#normalinvoice .hideableRow').toggleClass('hiddenRow');
  })
});


            "use strict";
        function customer_due(id){
        var csrf_test_name = $("[name=csrf_test_name]").val();
        var base_url  = $("#base_url").val();
        $.ajax({
            url: base_url + 'service/service/previous',
            type: 'post',
            data: {customer_id:id,csrf_test_name:csrf_test_name}, 
            success: function (msg){
                $("#previous").val(msg);
            },
            error: function (xhr, desc, err){
                 alert('failed');
            }
        });        
    }


        "use strict";
    function customer_autocomplete(sl) {

    var customer_id = $('#customer_id').val();
    var csrf_test_name = $("[name=csrf_test_name]").val();
    var base_url  = $("#base_url").val();
    var options = {
        minLength: 0,
        source: function( request, response ) {
            var customer_name = $('#customer_name').val();
         
        $.ajax( {
          url: base_url + "service/service/customer_autocomplete",
          method: 'post',
          dataType: "json",
          data: {
            term: request.term,
            customer_id:customer_name,
            csrf_test_name:csrf_test_name
          },
          success: function( data ) {
            response( data );

          }
        });
      },
       focus: function( event, ui ) {
           $(this).val(ui.item.label);
           return false;
       },
       select: function( event, ui ) {
            $(this).parent().parent().find("#autocomplete_customer_id").val(ui.item.value); 
            var customer_id          = ui.item.value;
            customer_due(customer_id);

            $(this).unbind("change");
            return false;
       }
   }

   $('body').on('keydown.autocomplete', '#customer_name', function() {
       $(this).autocomplete(options);
   });

}

function check_creditsale(){
    var card_typesl = $('.card_typesl').val();
    if(card_typesl == 0){
        $("#add_new_payment").empty();
        var gtotal=$(".grandTotalamnt").val();
        $("#pamount_by_method").val(gtotal);
        $("#paidAmount").val(0);
        $("#dueAmmount").val(gtotal);
        $(".number:eq(0)").val(0);
        $("#add_new_payment_type").prop('disabled',true);
        
    }else{
        $("#add_new_payment_type").prop('disabled',false);
    }
    $("#pay-amount").text('0');
    
    var invoice_edit_page = $("#invoice_edit_page").val();
    var is_credit_edit = $('#is_credit_edit').val();
    if (invoice_edit_page == 1 && card_typesl == 0) {
        $("#add_new_payment").empty();
       
        var base_url = $('#base_url').val();
        var csrf_test_name = $('[name="csrf_test_name"]').val();
        var gtotal=$(".grandTotalamnt").val();
        var url= base_url + "service/service/bdtask_showpaymentmodal";
        $.ajax({
            type: "post",
            url: url,
            data:{csrf_test_name:csrf_test_name,is_credit_edit:is_credit_edit},
            success: function(data) {
             $('#add_new_payment').append(data);
              $("#pamount_by_method").val(gtotal);
              $("#add_new_payment_type").prop('disabled',true);
            }
          }); 
        
    }
}

