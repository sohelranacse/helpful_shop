    
    var limits = 500;
    "use strict";


    function refresh_item_list(supplier_id) {
        $("#addPurchaseItem").empty()

        if(Number(supplier_id))
            addPurchaseOrderField1('addPurchaseItem')
    }

    function addPurchaseOrderField1(divName){
      
        var row = $("#purchaseTable tbody tr").length;
        var count = row + 1;
        var  tab1 = 0;
        var  tab2 = 0;
        var  tab3 = 0;
        var  tab4 = 0;
        var  tab5 = 0;
        var  tab6 = 0;
        var  tab7 = 0;
        var  tab8 = 0;
        var  tab9 = 0;
        var  tab10 = 0;
        var  tab11 = 0;
        var  tab12 = 0;
        var  tab13 = 0;
        var  tab14 = 0;
      
  
        if (count == limits)  {
            alert("You have reached the limit of adding " + count + " inputs");
        }
        else{
            var newdiv = document.createElement('tr');
            var tabin="product_name_"+count;
            tabindex = count * 4 ,
            newdiv = document.createElement("tr");
            tab1 = tabindex + 1;
            
            tab2 = tabindex + 2;
            tab3 = tabindex + 3;
            tab4 = tabindex + 4;
            tab5 = tabindex + 5;
            tab6 = tab5 + 1;
            tab7 = tab6 +1;
            tab11 = tabindex +11;
            tab12 = tabindex +12;
            tab13 = tabindex +13;
            tab14 = tabindex +14;

            newdiv.innerHTML ='<td class="span3 supplier"><input type="text" name="product_name" required="" class="form-control product_name productSelection" onkeypress="product_pur_or_list('+ count +');" placeholder="Product Name" autocomplete="off" id="product_name_'+ count +'" tabindex="'+tab1+'" > <input type="hidden" class="autocomplete_hidden_value product_id_'+ count +
            '" name="product_id[]" id="SchoolHiddenId"/>  <input type="hidden" class="sl" value="'+ count +'">  </td> <td class="wt"> <input type="text" id="available_quantity_'+ count +
            '" class="form-control text-right stock_ctn_'+ count +'" placeholder="0.00" readonly/> </td><td ><input type="text" name="expiry_date[]"   id="expiry_date_'+ count +
            '" class="form-control datepicker" placeholder="Expiry Date"/>  </td><td class="text-right"><input type="text" name="batch_no[]" required id="batch_no_'+ count +
            '" class="form-control text-right "  placeholder="Batch No"/>  </td><td class="text-right"><input type="text" name="product_quantity[]" tabindex="'+tab2+
            '" required  id="cartoon_'+ count +'" class="form-control text-right store_cal_' + count + '" onkeyup="calculate_store(' + count + 
            ');" onchange="calculate_store(' + count + ');" placeholder="0.00" value="" min="0"/>  </td><td class="test"><input type="text" name="product_rate[]" onkeyup="calculate_store('+ count +
            ');" onchange="calculate_store('+ count +');" id="product_rate_'+ count +'" class="form-control product_rate_'+ count +
            ' text-right" placeholder="0.00" value="" min="0" tabindex="'+tab3+'"/></td><td class="test"><input type="text" name="discount_per[]" onkeyup="calculate_store('+ count +
            ');" onchange="calculate_store('+ count +');" id="discount_'+ count +'" class="form-control discount_'+ count +
            ' text-right" placeholder="0.00" value="" min="0" tabindex="'+tab11+
            '" /><input type="hidden" value="<?php echo $discount_type?>" name="discount_type"id="discount_type_'+ count +'"></td><td class="test"><input type="text" name="discountvalue[]" onkeyup="calculate_store('+ count +
            ');" onchange="calculate_store('+ count +');" id="discount_value_'+ count +'" class="form-control total_discount_val discount_value_'+ count +
            ' text-right" placeholder="0.00" value="" min="0" tabindex="'+tab12+'" readonly/></td><td class="test"><input type="text" name="vatpercent[]" onkeyup="calculate_store('+ count +
            ');" onchange="calculate_store('+ count +');" id="vat_percent_'+ count +'" class="form-control vat_percent_'+ count +
            ' text-right" placeholder="0.00" value="" min="0" tabindex="'+tab13+'"/></td><td class="test"><input type="text" name="vatvalue[]" onkeyup="calculate_store('+ count +
            ');" onchange="calculate_store('+ count +');" id="vat_value_'+ count +'" class="form-control total_vatamnt vat_value_'+ count +
            ' text-right" placeholder="0.00" value="" min="0" tabindex="'+tab14+'" readonly/></td><td class="text-right"><input class="form-control total_price text-right total_price_'+ count +
            '" type="text" name="total_price[]" id="total_price_'+ count +
            '" value="0.00" readonly="readonly" /> </td><td> <input type="hidden" id="total_discount_1" class="" /><input type="hidden" id="all_discount_1" class="total_discount" /><button style="text-align: right;" class="btn btn-danger red" type="button"  onclick="deleteRow(this)" tabindex="8"><i class="fa fa-close"></i></button></td>';


            document.getElementById(divName).appendChild(newdiv);
            document.getElementById(tabin).focus();
            document.getElementById("add_invoice_item").setAttribute("tabindex", tab5);
            document.getElementById("add_purchase").setAttribute("tabindex", tab6); 
            count++;

            $("select.form-control:not(.dont-select-me)").select2({
                placeholder: "Select option",
                allowClear: true
            });
        }
    }

  // Counts and limit for purchase order


    //Calculate store product
        "use strict";
    function calculate_store(sl) {
      
      var p = 0;
      var v = 0;
        var gr_tot = 0;
        var dis = 0;
        var item_ctn_qty    = $("#cartoon_"+sl).val();
        var vendor_rate = $("#product_rate_"+sl).val();

        var total_price     = item_ctn_qty * vendor_rate;
        $("#total_price_"+sl).val(total_price.toFixed(2));

        var quantity = $("#cartoon_" + sl).val();
        var discount = $("#discount_" + sl).val();
        var dis_type = $("#discount_type").val();
        var price_item = $("#product_rate_" + sl).val();
        var vat_percent = $("#vat_percent_" + sl).val();

        if (quantity > 0 || discount > 0 || vat_percent > 0) {
          if (dis_type == 1) {
            var price = quantity * price_item;
            var disc = +(price * discount / 100);
            $("#discount_value_" + sl).val(disc);
            $("#all_discount_" + sl).val(disc);
            //Total price calculate per product
            var temp = price - disc;
            // product wise vat start
            var vat =+(temp * vat_percent / 100);
            $("#vat_value_" + sl).val(vat);
            // product wise vat end
            var ttletax = 0;
            $("#total_price_" + sl).val(temp);
            
  
            
          } else if (dis_type == 2) {
            var price = quantity * price_item;

            // Discount cal per product
            var disc = (discount * quantity);
            $("#discount_value_" + sl).val(disc);
            $("#all_discount_" + sl).val(disc);

            //Total price calculate per product
            var temp = price - disc;
            $("#total_price_" + sl).val(temp);
            // product wise vat start
            var vat =+(temp * vat_percent / 100);
            $("#vat_value_" + sl).val(vat);
            // product wise vat end

            var ttletax = 0;
            
          } else if (dis_type == 3) {
            var total_price = quantity * price_item;
            var disc =  discount;
            // Discount cal per product
            $("#discount_value_" + sl).val(disc);
            $("#all_discount_" + sl).val(disc);
            //Total price calculate per product
            var price = total_price - disc;
            $("#total_price_" + sl).val(price);
            // product wise vat start
            var vat =+(price * vat_percent / 100);
            $("#vat_value_" + sl).val(vat);
            // product wise vat end

            var ttletax = 0;
            
          }
      }
       
        //Total Price
        $(".total_price").each(function() {
            isNaN(this.value) || 0 == this.value.length || (gr_tot += parseFloat(this.value))
        });
         $(".discount").each(function() {
            isNaN(this.value) || 0 == this.value.length || (dis += parseFloat(this.value))
        });
        //Total Discount
        $(".total_discount_val").each(function () {
          isNaN(this.value) || 0 == this.value.length || (p += parseFloat(this.value))
      }),
      $("#total_discount_ammount").val(p.toFixed(2, 2)),

      $(".total_vatamnt").each(function () {
          isNaN(this.value) || 0 == this.value.length || (v += parseFloat(this.value))
      }),
      $("#total_vat_amnt").val(v.toFixed(2, 2)),
      
        $("#Total").val(gr_tot.toFixed(2,2));
        var vatamnt = $("#total_vat_amnt").val();
        
        var gttl = gr_tot - dis;
        var grandtotal = parseFloat(gttl) + parseFloat(vatamnt);
        $("#grandTotal").val(grandtotal.toFixed(2,2));
        $("#pamount_by_method").val(grandtotal.toFixed(2,2));
        $('#paidAmount').val(grandtotal.toFixed(2,2));
        
        var purchase_edit_page = $("#purchase_edit_page").val();
        $("#add_new_payment").empty();
        
        $("#pay-amount").text('0');
        $("#dueAmmount").val(0);
        
        if (purchase_edit_page == 1 ) {
          
            var base_url = $('#base_url').val();
            var is_credit_edit = $('#is_credit_edit').val();
            
            var csrf_test_name = $('[name="csrf_test_name"]').val();
            var gtotal=$(".grandTotalamnt").val();
            var url= base_url + "purchase/purchase/showpaymentmodal";
            $.ajax({
                type: "post",
                url: url,
                data:{is_credit_edit:is_credit_edit,csrf_test_name:csrf_test_name},
                success: function(data) {
                  
                  
                  $('#add_new_payment').append(data);
                 
                  $("#pamount_by_method").val(gtotal);
                  $("#add_new_payment_type").prop('disabled',false);
                  var card_typesl = $('.card_typesl').val();
                  
                  if(card_typesl == 0){
                    $("#add_new_payment_type").prop('disabled',true);
                  }
                  
                }
              }); 
            
        }
        
    }

    $(document).on('click','#add_purchase',function(){
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
        
      var url= base_url + "purchase/purchase/showpaymentmodal";
      $.ajax({
        type: "post",
        url: url,
        data:{is_credit_edit:is_credit_edit, csrf_test_name:csrf_test_name},
        success: function(data) {
          
          $($('#add_new_payment').append(data));
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
      var paidAmount = $("#paidAmount").val();
      
      $(".number").each(function(){
        var inputdata= parseFloat($(this).val());
        inputval = inputval+inputdata;

      });
      restamount=(parseFloat(maintotalamount))-(parseFloat(inputval));
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

    function invoice_paidamount() {
      var t = $("#grandTotal").val(),
      a = $("#paidAmount").val(),
      e = t - a;
      if(e > 0){
        $("#dueAmmount").val(e.toFixed(2,2))
      }else{
        $("#dueAmmount").val(0)   
      }
      
      $("#add_new_payment").empty();
      $("#pamount_by_method").val(a);
      $("#pay-amount").text('0');

      var purchase_edit_page = $("#purchase_edit_page").val();
                
        
        var is_credit_edit = $('#is_credit_edit').val();
        if (purchase_edit_page == 1 ) {
          
            var base_url = $('#base_url').val();
            var csrf_test_name = $('[name="csrf_test_name"]').val();
            var gtotal=$(".grandTotalamnt").val();
            var url= base_url + "purchase/purchase/showpaymentmodal";
            $.ajax({
                type: "post",
                url: url,
                data:{csrf_test_name:csrf_test_name,is_credit_edit:is_credit_edit},
                success: function(data) {
                  $($('#add_new_payment').append(data));
                  $("#pamount_by_method").val(a);
                  $("#add_new_payment_type").prop('disabled',false);
                }
              }); 
            
        }
}



    //Delete row
        "use strict";
    function deleteRow(e) {
        var t = $("#purchaseTable > tbody > tr").length;
        if (1 == t) alert("There only one row you can't delete.");
        else {
            var a = e.parentNode.parentNode;
            a.parentNode.removeChild(a)
        }
        calculate_store();
        var purchase_edit_page = $("#purchase_edit_page").val();
        
        $("#add_new_payment").empty();
        
        $("#pay-amount").text('0');
        var is_credit_edit = $('#is_credit_edit').val();
        
        if (purchase_edit_page == 1 ) {
           
            var base_url = $('#base_url').val();
            var csrf_test_name = $('[name="csrf_test_name"]').val();
            var gtotal=$(".grandTotalamnt").val();
            var url= base_url + "purchase/purchase/showpaymentmodal";
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


    "use strict";
    function product_pur_or_list(sl) {

        var supplier_id = $('#supplier_id').val();
        var base_url = $('#base_url').val();
        var csrf_test_name = $('[name="csrf_test_name"]').val();
        if ( supplier_id == 0) {
            alert('Please select Supplier !');
            return false;
        }

        // Auto complete
        var options = {
            minLength: 0,
            source: function( request, response ) {
                var product_name = $('#product_name_'+sl).val();
            $.ajax( {
              url: base_url + "purchase/purchase/product_search_by_supplier",
              method: 'post',
              dataType: "json",
              data: {
                term: request.term,
                supplier_id:$('#supplier_id').val(),
                product_name:product_name,
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
                $(this).parent().parent().find(".autocomplete_hidden_value").val(ui.item.value); 
                var sl = $(this).parent().parent().find(".sl").val(); 

                var product_id          = ui.item.value;
              
              var  supplier_id=$('#supplier_id').val();
         
               
                var base_url    = $('.baseUrl').val();


                var available_quantity    = 'available_quantity_'+sl;
                var product_rate    = 'product_rate_'+sl;
                var product_vatdata    = 'vat_percent_'+sl;

               
             
             
                $.ajax({
                    type: "POST",
                    url: base_url+"purchase/purchase/retrieve_product_data",
                     data: {product_id:product_id,supplier_id:supplier_id,csrf_test_name:csrf_test_name},
                    cache: false,
                    success: function(data)
                    {
                        
                        obj = JSON.parse(data);
                       $('#'+available_quantity).val(obj.total_product);
                        $('#'+product_rate).val(obj.supplier_price);
                        $('#'+product_vatdata).val(obj.product_vat);
                      
                    } 
                });

                $(this).unbind("change");
                return false;
           }
       }

       $('body').on('keypress.autocomplete', '.product_name', function() {
           $(this).autocomplete(options);
       });

    }
    

  

    $( document ).ready(function() {
        var paytype = $("#editpayment_type").val();
        if(paytype == 2){
          $("#bank_div").css("display", "block");        
      }else{
       $("#bank_div").css("display", "none"); 
      }

      $(".bankpayment").css("width", "100%");
    });


    $(document).ready(function() { 
          "use strict";
     var csrf_test_name = $('#CSRF_TOKEN').val();
     var total_purchase_no = $("#total_purchase_no").val();
     var base_url = $("#base_url").val();
       var currency = $("#currency").val();
      var purchasedatatable = $('#PurList').DataTable({ 
             responsive: true,

             "aaSorting": [[4, "desc" ]],
             "columnDefs": [
                { "bSortable": false, "aTargets": [0,1,2,3,5,6] },

            ],
           'processing': true,
           'serverSide': true,

          
           'lengthMenu':[[10, 25, 50,100,250,500], [10, 25, 50,100,250,500]],

             dom:"'<'col-sm-4'l><'col-sm-4 text-center'><'col-sm-4'>Bfrtip", buttons:[ {
                extend: "copy",exportOptions: {
                       columns: [ 0,1,2,3,4,5 ] //Your Colume value those you want
                           }, className: "btn-sm prints"
            }
            , {
                extend: "csv", title: "PurchaseLIst",exportOptions: {
                       columns: [ 0,1,2,3,4,5] //Your Colume value those you want print
                           }, className: "btn-sm prints"
            }
            , {
                extend: "excel",exportOptions: {
                       columns: [0,1,2,3,4,5 ] //Your Colume value those you want print
                           }, title: "PurchaseLIst", className: "btn-sm prints"
            }
            , {
                extend: "pdf",exportOptions: {
                       columns: [0,1,2,3,4,5] //Your Colume value those you want print
                           }, title: "PurchaseLIst", className: "btn-sm prints"
            }
            , {
                extend: "print",exportOptions: {
                       columns: [ 0,1,2,3,4,5] //Your Colume value those you want print
                           },title: "<center> PurchaseLIst</center>", className: "btn-sm prints"
            }
            ],

            
            'serverMethod': 'post',
            'ajax': {
               'url':base_url + 'purchase/purchase/CheckPurchaseList',
                 "data": function ( data) {
         data.fromdate = $('#from_date').val();
         data.todate = $('#to_date').val();
         data.csrf_test_name = csrf_test_name;
        
}
            },
          'columns': [
             { data: 'sl' },
             { data: 'chalan_no'},
             { data: 'purchase_id'},
             { data: 'supplier_name'},
             { data: 'purchase_date' },
             { data: 'total_amount',class:"total_sale text-right",render: $.fn.dataTable.render.number( ',', '.', 2, currency )},
             { data: 'button'},
          ],

  "footerCallback": function(row, data, start, end, display) {
  var api = this.api();
   api.columns('.total_sale', {
    page: 'current'
  }).every(function() {
    var sum = this
      .data()
      .reduce(function(a, b) {
        var x = parseFloat(a) || 0;
        var y = parseFloat(b) || 0;
        return x + y;
      }, 0);
    $(this.footer()).html(currency+' '+sum.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
  });
}


    });


$('#btn-filter').click(function(){ 
purchasedatatable.ajax.reload();  
});

});

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
  
  var purchase_edit_page = $("#purchase_edit_page").val();
  var is_credit_edit = $('#is_credit_edit').val();
  if (purchase_edit_page == 1 && card_typesl == 0) {
      $("#add_new_payment").empty();
      var base_url = $('#base_url').val();
      var csrf_test_name = $('[name="csrf_test_name"]').val();
      var gtotal=$(".grandTotalamnt").val();
      var url= base_url + "purchase/purchase/showpaymentmodal";
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

