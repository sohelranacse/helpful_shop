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
        var a = "product_name_" + count,
                tabindex = count * 6,
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
        e.innerHTML = "<td><input type='text' name='product_name' required onkeypress='invoice_productList(" + count + 
        ");' class='form-control productSelection common_product' placeholder='Product Name' id='" + a + 
        "'  tabindex='" + tab1 + "'><input type='hidden' class='common_product autocomplete_hidden_value  product_id_" + count + 
        "' name='product_id[]' id='SchoolHiddenId'/></td><td><input type='text' name='desc[]'' class='form-control text-right ' tabindex='" + tab2 + 
        "'/></td><td><select class='form-control' required id='serial_no_" + count + "' onchange='invoice_product_batch(" + count + ")' name='serial_no[]' tabindex='" + tab3 + 
        "'><option></option></select></td> <td><input type='text' name='available_quantity[]' id='' class='form-control text-right common_avail_qnt available_quantity_" + count + 
        "' value='0' readonly='readonly' /></td><td><input class='form-control text-right common_name unit_" + count + 
        " valid' value='None' readonly='' aria-invalid='false' type='text'></td><td> <input type='text' required name='product_quantity[]' value='1'  onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='total_qntt_" + count + "' class='common_qnt total_qntt_" + count + 
        " form-control text-right'  placeholder='0.00' min='0' tabindex='" + tab3 + "'/></td><td><input type='text' required name='product_rate[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='price_item_" + count + "' class='common_rate price_item" + count + 
        " form-control text-right'  placeholder='0.00' min='0' tabindex='" + tab4 + "'/> <input type='hidden' name='supplier_price[]'' id='supplier_price_" + count + 
        "'></td><td><input type='text' name='discount[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='discount_" + count + "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab5 + 
        "' /><input type='hidden' value='' name='discount_type' id='discount_type_" + count + 
        "'></td><td><input type='text' readonly name='discountvalue[]'  id='discount_value_" + count + 
        "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab9 + 
        "' /></td><td><input type='text' name='vatpercent[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='vat_percent_" + count + 
        "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab10 + "' /></td><td><input type='text' name='vatvalue[]' readonly id='vat_value_" + count + 
        "' class='form-control text-right common_discount total_vatamnt' placeholder='0.00' min='0' tabindex='" + tab11 + 
        "' /></td><td class='text-right'><input class='common_total_price total_price form-control text-right' type='text' name='total_price[]' id='total_price_" + count + 
        "' value='0.00' readonly='readonly'/></td><td>"+tbfild+"<input type='hidden' id='all_discount_" + count + 
        "' class='total_discount dppr' name='discount_amount[]'/><button tabindex='" + tab5 + 
        "' style='text-align: right;' class='btn btn-danger' type='button' value='Delete' onclick='deleteRow(this)'><i class='fa fa-close'></i></button></td>",
                document.getElementById(t).appendChild(e),
                document.getElementById(a).focus(),
                document.getElementById("add_invoice_item").setAttribute("tabindex", tab6);
                document.getElementById("details").setAttribute("tabindex", tab7);
                document.getElementById("invoice_discount").setAttribute("tabindex", tab8);
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
        var a = "product_name_" + count,
                tabindex = count * 6,
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
        e.innerHTML = "<td><input type='text' name='product_name' required onkeypress='invoice_productList(" + count + 
        ");' class='form-control productSelection common_product' placeholder='Product Name' id='" + a + 
        "'  tabindex='" + tab1 + "'><input type='hidden' class='common_product autocomplete_hidden_value  product_id_" + count + 
        "' name='product_id[]' id='SchoolHiddenId'/></td><td><input type='text' name='desc[]'' class='form-control text-right ' tabindex='" + tab2 + 
        "'/></td><td><select class='form-control' required id='serial_no_" + count + "' onchange='invoice_product_batch(" + count + ")' name='serial_no[]' tabindex='" + tab3 + 
        "'><option></option></select></td> <td><input type='text' name='available_quantity[]' id='' class='form-control text-right common_avail_qnt available_quantity_" + count + 
        "' value='0' readonly='readonly' /></td><td><input class='form-control text-right common_name unit_" + count + 
        " valid' value='None' readonly='' aria-invalid='false' type='text'></td><td> <input type='text' required name='product_quantity[]' value='1'  onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='total_qntt_" + count + "' class='common_qnt total_qntt_" + count + 
        " form-control text-right'  placeholder='0.00' min='0' tabindex='" + tab3 + "'/></td><td><input type='text' required name='product_rate[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='price_item_" + count + "' class='common_rate price_item" + count + 
        " form-control text-right'  placeholder='0.00' min='0' tabindex='" + tab4 + "'/> <input type='hidden' name='supplier_price[]'' id='supplier_price_" + count + 
        "'></td><td><input type='text' name='discount[]' onkeyup='quantity_calculate(" + count + 
        ");' onchange='quantity_calculate(" + count + ");' id='discount_" + count + "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab5 + 
        "' /><input type='hidden' value='' name='discount_type' id='discount_type_" + count + 
        "'></td><td><input type='text' readonly name='discountvalue[]'  id='discount_value_" + count + 
        "' class='form-control text-right common_discount' placeholder='0.00' min='0' tabindex='" + tab9 + 
        "' /></td><td class='text-right'><input class='common_total_price total_price form-control text-right' type='text' name='total_price[]' id='total_price_" + count + 
        "' value='0.00' readonly='readonly'/></td><td>"+tbfild+"<input type='hidden' id='all_discount_" + count + 
        "' class='total_discount dppr' name='discount_amount[]'/><button tabindex='" + tab5 + 
        "' style='text-align: right;' class='btn btn-danger' type='button' value='Delete' onclick='deleteRow(this)'><i class='fa fa-close'></i></button></td>",
                document.getElementById(t).appendChild(e),
                document.getElementById(a).focus(),
                document.getElementById("add_invoice_item").setAttribute("tabindex", tab6);
                document.getElementById("details").setAttribute("tabindex", tab7);
                document.getElementById("invoice_discount").setAttribute("tabindex", tab8);
                count++
    }
}
//Quantity calculat

    "use strict";
function quantity_calculate(item) {

    var quantity = $("#total_qntt_" + item).val();
    var available_quantity = $(".available_quantity_" + item).val();
    var price_item = $("#price_item_" + item).val();
    var invoice_discount = $("#invoice_discount").val();
    var discount = $("#discount_" + item).val();
    var vat_percent = $("#vat_percent_" + item).val();
    var total_tax = $("#total_tax_" + item).val();
    var total_discount = $("#total_discount_" + item).val();
    var taxnumber = $("#txfieldnum").val();
    var dis_type = $("#discount_type").val();


    if (available_quantity != 0) {
        if (parseInt(quantity) > parseInt(available_quantity)) {
            var message = "You can Sale maximum " + available_quantity + " Items";
            toastr["error"](message);
            $("#total_qntt_" + item).val('');
            var quantity = 0;
            $("#total_price_" + item).val(0);
            for(var i=0;i<taxnumber;i++){
            $("#all_tax"+i+"_" + item).val(0);
            quantity_calculate(item);
        }
        }
    }
    

if (quantity > 0 || discount > 0 || vat_percent > 0) {
        if (dis_type == 1) {
            var price = quantity * price_item;
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
            // product wise vat start
            var vat =+(temp * vat_percent / 100);
            $("#vat_value_" + item).val(vat);
            // product wise vat end
            $("#total_price_" + item).val(temp);

            var ttletax = 0;
             for(var i=0;i<taxnumber;i++){
           var tax = (temp) * $("#total_tax"+i+"_" + item).val();
           ttletax += Number(tax);
            $("#all_tax"+i+"_" + item).val(tax);
    }
        } else if (dis_type == 3) {
            var total_price = quantity * price_item;
             var dis =  discount;
            // Discount cal per product
            $("#discount_value_" + item).val(dis);
            $("#all_discount_" + item).val(dis);
            //Total price calculate per product
            var price = total_price - dis;
            // product wise vat start
            var vat =+(price * vat_percent / 100);
            $("#vat_value_" + item).val(vat);
            // product wise vat end
            $("#total_price_" + item).val(total_price);

             var ttletax = 0;
             for(var i=0;i<taxnumber;i++){
           var tax = (price) * $("#total_tax"+i+"_" + item).val();
           ttletax += Number(tax);
            $("#all_tax"+i+"_" + item).val(tax);
    }
        }
    } else {
        var n = quantity * price_item;
        var c = quantity * price_item * total_tax;
        $("#total_price_" + item).val(n),
        $("#all_tax_" + item).val(c)
    }
    $("#add_new_payment").empty();
    $("#pay-amount").text('0');
    calculateSum();
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
    tx = 0,
    ds = 0,
    ad = 0,
    v = 0;

    //Total Tax
   for(var i=0;i<taxnumber;i++){
      
    var j = 0;
    $(".total_tax"+i).each(function () {
        isNaN(this.value) || 0 == this.value.length || (j += parseFloat(this.value))
    });
    $("#total_tax_ammount"+i).val(j.toFixed(2, 2));
             
    }
    //Total Discount
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
            
    o = a.toFixed(2, 2),
    e = t.toFixed(2, 2),
    tx = f.toFixed(2, 2),
    ds = p.toFixed(2, 2);

    var test = +tx + +e + -ds + + ad;
    $("#grandTotal").val(test.toFixed(2, 2));

    var vatamnt = $("#total_vat_amnt").val();
    var gt = $("#grandTotal").val();
    var invdis = $("#invoice_discount").val();
    var total_discount_ammount = $("#total_discount_ammount").val();
    
    var grnt_totals = parseFloat(gt) + parseFloat(vatamnt);
    $("#grandTotal").val(grnt_totals.toFixed(2, 2));
    $("#pamount_by_method").val(grnt_totals);

    
}


//Stock Limit
    "use strict";
function stockLimit(t) {
    var a = $("#total_qntt_" + t).val(),
            e = $(".product_id_" + t).val(),
            o = $(".baseUrl").val();

    $.ajax({
        type: "POST",
        url: o + "Cinvoice/product_stock_check",
        data: {
            product_id: e
        },
        cache: !1,
        success: function (e) {
            alert(e);
            if (a > Number(e)) {
                var o = "You can Add maximum " + e + " Items";
                alert(o), $("#qty_item_" + t).val("0"), $("#total_qntt_" + t).val("0"), $("#total_price_" + t).val("0")
            }
        }
    })
}


    "use strict";
function stockLimitAjax(t) {
    var a = $("#total_qntt_" + t).val(),
            e = $(".product_id_" + t).val(),
            o = $(".baseUrl").val();
            
    $.ajax({
        type: "POST",
        url: o + "Cinvoice/product_stock_check",
        data: {
            product_id: e
        },
        cache: !1,
        success: function (e) {
            alert(e);
            if (a > Number(e)) {
                var o = "You can Sale maximum " + e + " Items";
                alert(o), $("#qty_item_" + t).val("0"), $("#total_qntt_" + t).val("0"), $("#total_price_" + t).val("0.00"), calculateSum()
            }
        }
    })
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
        $("#add_new_payment").empty();



    }
}


// ******* new payment add start *******
$(document).on('click','#add_new_payment_type',function(){
    var base_url = $('#base_url').val();
    var csrf_test_name = $('[name="csrf_test_name"]').val();
    var gtotal=$(".grandTotalamnt").val();
    
    var total = 0;
    $( ".pay" ).each( function(){
      total += parseFloat( $( this ).val() ) || 0;
    });
    

    if(total>=gtotal){
      alert("Paid amount is exceed to Total amount.");
      
      return false;
    }
      
    var url= base_url + "quotation/quotation/bdtask_showpaymentmodal";
    $.ajax({
      type: "GET",
      url: url,
      data:{csrf_test_name:csrf_test_name},
      success: function(data) {
        $($('#add_new_payment').append(data)).show("slow", function(){
          });
        var length = $(".number").length;
        $(".number:eq("+(length-1)+")").val(parseFloat($("#pay-amount").text()));
        var total2 = 0;
        $( ".number" ).each( function(){
          total2 += parseFloat( $( this ).val() ) || 0;
        });
        $('#paidAmount').val(total2.toFixed(2,2));
        var dueamnt = parseFloat(gtotal) - total2
        $("#dueAmmount").val(dueamnt);
        
        
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
var count = 2,
        limits = 500;
