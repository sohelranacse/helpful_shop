     "use strict";
 function checkboxcheck(sl) {
        var check_id = 'check_id_' + sl;
        var total_qntt = 'total_qnttret_' + sl;
        var product_id = 'product_idret_' + sl;
        var total_price = 'total_priceret_' + sl;
        var discount = 'discountret_' + sl;
        var batch_no = 'batch_no_' + sl;
        if ($('#' + check_id).prop("checked") == true) {
            document.getElementById(total_qntt).setAttribute("required", "required");
            document.getElementById(product_id).setAttribute("name", "product_idret[]");
            document.getElementById(total_qntt).setAttribute("name", "product_quantityret[]");
            document.getElementById(total_price).setAttribute("name", "total_priceret[]");
            document.getElementById(discount).setAttribute("name", "discountret[]");
            document.getElementById(batch_no).setAttribute("name", "batch_noret[]");
            
        } else if ($('#' + check_id).prop("checked") == false) {
            document.getElementById(total_qntt).removeAttribute("required");
            document.getElementById(product_id).removeAttribute("name", "");
            document.getElementById(total_qntt).removeAttribute("name", "");
            document.getElementById(total_price).setAttribute("name", "total_priceret[]");
            document.getElementById(discount).setAttribute("name", "");
            document.getElementById(batch_no).removeAttribute("name", "");
        }
    }

    //Quantity calculat
        "use strict";
    function quantity_calculate(item) {
         var a = 0,o = 0,m = 0,r = 0,d = 0,p = 0;
        var sold_qty = $("#sold_qtyret_" + item).val();
        var quantity = $("#total_qnttret_" + item).val();
        var prod_tot_vat = $("#prod_wise_vat_" + item).val();
        var price_item = $("#price_itemret_" + item).val();
        var discount = $("#discountret_" + item).val();
        if(parseInt(sold_qty) < parseInt(quantity)){
            alert("Sold quantity less than quantity!");
            $("#total_qnttret_"+item).val("");
            $("#total_priceret_" + item).val("");
            return false;
        }
        if (parseInt(quantity) > 0) {
            var price = (quantity * price_item);
            var dis = price * (discount / 100);
            $("#all_discountret_" + item).val(dis);
            var ttldis = $("#all_discountret_" + item).val();

            // total vat calculate
            var per_qty_vat = prod_tot_vat / sold_qty;
            var ret_prod_vat = per_qty_vat * quantity;

            $("#return_prod_vat_" + item).val(ret_prod_vat);//
            //Total price calculate per product
            var temp = price - ttldis;
            $("#total_priceret_" + item).val(temp);//

            $(".return_prod_vat").each(function () {
                isNaN(this.value) || m == this.value.length || (r += parseFloat(this.value));
            }),

            $("#total_vat_ammount").val(r.toFixed(2, 2));

            $(".total_priceret").each(function () {
                isNaN(this.value) || o == this.value.length || (a += parseFloat(this.value));
            }),
                    $("#grandTotalret1").val(a+r.toFixed(2, 2));
                    var grand_tot = a+r;
                $("#grandTotalret").val(grand_tot.toFixed(2, 2));

                  $(".total_discountret").each(function () {
                isNaN(this.value) || p == this.value.length || (d += parseFloat(this.value));
            }),
                    $("#total_discountret_ammount").val(d.toFixed(2, 2));
        }

    }



      $(document).ready(function () {
            "use strict";
        $('input[type=checkbox]').each(function () {
            if (this.nextSibling.nodeName != 'label') {
                $(this).after('<label for="' + this.id + '"></label>')
            }
        })


    $('#add_invoice').prop("disabled", true);
    $('input:checkbox').click(function () {
        if ($(this).is(':checked')) {
            $('#add_invoice').prop("disabled", false);
        } else {
            if ($('.chk').filter(':checked').length < 1) {
                $('#add_invoice').attr('disabled', true);
            }
        }
    });
    })


        "use strict";
    function checkboxcheckSreturn(sl){
         var check_id    ='check_id_'+sl;
        var total_qntt  ='total_qnttret_'+sl;
        var product_id  ='product_idret_'+sl;
        var total_price  ='total_priceret_'+sl;
        var discount  ='discountret_'+sl;
        var batch_no  ='batch_no_'+sl;
            if($('#'+check_id).prop("checked") == true){
                document.getElementById(total_qntt).setAttribute("required","required");
                  document.getElementById(product_id).setAttribute("name","product_idret[]");
                   document.getElementById(total_qntt).setAttribute("name","product_quantityret[]");
                    document.getElementById(total_price).setAttribute("name","total_priceret[]");
                   document.getElementById(discount).setAttribute("name","discountret[]");
                   document.getElementById(batch_no).setAttribute("name","batch_noret[]");
            }
            else if($('#'+check_id).prop("checked") == false){
               document.getElementById(total_qntt).removeAttribute("required");
                document.getElementById(product_id).removeAttribute("name","");
                document.getElementById(total_qntt).removeAttribute("name","");
                document.getElementById(total_price).setAttribute("name","total_priceret[]");
                  document.getElementById(discount).setAttribute("name","");
                  document.getElementById(batch_no).removeAttribute("name","");
            }
        };
        

            "use strict";
        function quantity_calculateSreturn(item) {
         var a = 0,o = 0 , d = 0,p = 0;
        var sold_qty = $("#sold_qtyret_" + item).val();
        var quantity = $("#total_qnttret_" + item).val();
        var price_item = $("#price_itemret_" + item).val();
        var discount = $("#discountret_" + item).val();
        if(parseInt(sold_qty) < parseInt(quantity)){
            alert("Purchase quantity less than quantity!");
            $("#total_qnttret_"+item).val("");
        }
        if (parseInt(quantity) > 0) {
            var price = (quantity * price_item);
            var dis = price * (discount / 100);
            $("#all_discountret_" + item).val(dis);

            //Total price calculate per product
            var temp = price - dis;
            $("#total_priceret_" + item).val(temp);

            $(".total_priceret").each(function () {
                isNaN(this.value) || o == this.value.length || (a += parseFloat(this.value));
            }),
            $("#grandTotalret").val(a.toFixed(2, 2));
            $(".total_discountret").each(function () {
                isNaN(this.value) || p == this.value.length || (d += parseFloat(this.value));
            }),
                    $("#total_discountret_ammount").val(d.toFixed(2, 2));     
        }

    }

    


