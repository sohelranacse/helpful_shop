function voucher_due(id) {
    var base_url = $("#base_url").val();
    var csrf_test_name = $('[name="csrf_test_name"]').val();
    $.ajax({
        url: base_url + "account/accounts/voucher_due_amount",
        type: "POST",
        data: {
            purchase_id: id,
            csrf_test_name: csrf_test_name

        },
        success: function(data) {


            $('#due_1').val(data);

        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('Error get data from ajax');
        }
    });
}

function changedueamount() {
    var inputval = parseFloat(0);
    var maintotalamount = $('#grandTotal').val();

    $(".number").each(function() {
        var inputdata = parseFloat($(this).val());
        inputval = inputval + inputdata;

        if (parseFloat(maintotalamount) < parseFloat(inputval)) {
            toastr["error"]('You Can not Pay More than Total Amount');
            $(this).val(0)
            return false;
        }

    });



    var restamount = (parseFloat(maintotalamount)) - (parseFloat(inputval));
    var changes = restamount.toFixed(3);
    if (changes <= 0) {
        $("#pay-amount").text(0);
    } else {
        $("#pay-amount").text(changes);
    }

}

// ******* new payment add start *******
$(document).on('click', '#add_new_payment_type', function() {
    var base_url = $('#base_url').val();
    var csrf_test_name = $('[name="csrf_test_name"]').val();
    var gtotal = $("#grandTotal").val();

    var total = 0;
    $(".pay").each(function() {
        total += parseFloat($(this).val()) || 0;
    });


    if (total >= gtotal) {
        toastr.error("Paid amount is exceed to Total amount.");

        return false;
    }

    var url = base_url + "account/accounts/bdtask_showpaymentmodal";
    $.ajax({
        type: "GET",
        url: url,
        data: {
            csrf_test_name: csrf_test_name
        },
        success: function(data) {
            $($('#add_new_payment').append(data)).show("slow", function() {});
            var length = $(".number").length;
            $(".number:eq(" + (length - 1) + ")").val(parseFloat($("#pay-amount").text()));
            var total2 = 0;
            $(".number").each(function() {
                total2 += parseFloat($(this).val()) || 0;
            });




        }
    });
});

function removeMethod(rmdiv, sl) {
    var contain_val = $("#pamount_by_method_" + sl).val();
    $(rmdiv).parent().parent().remove();
    var firstval = $(".number:eq(0)").val();
    var effetval = (contain_val ? parseFloat(contain_val) : 0) + (firstval ? parseFloat(firstval) : 0);
    $(".number:eq(0)").val(effetval.toFixed(2, 2));
    changedueamount();
}

$(document).ready(function() {
    "use strict";

    var frm = $("#supplier_paymentform");
    frm.on('submit', function(e) {
        var finyear = $("#finyear").val();
		
		if(finyear<=0){
            toastr["error"]('Please Create Financial Year First ');
            return false;
		}
        var inputval = parseFloat(0);
        var maintotalamount = $('#grandTotal').val();

        $(".number").each(function() {
            var inputdata = parseFloat($(this).val());
            inputval = inputval + inputdata;

        });

        if (parseFloat(maintotalamount) > parseFloat(inputval)) {
            toastr["error"]('You should input equal Total Amount');
            return false;
        }
        e.preventDefault();
        $.ajax({
            url: $(this).attr('action'),
            method: $(this).attr('method'),
            dataType: 'json',
            data: frm.serialize(),
            success: function(data) {
                console.log(data);

                if (data.status == true) {
                    toastr["success"](data.message);
                    swal({
                        title: "Success!",
                        showCancelButton: true,
                        cancelButtonText: "NO",
                        cancelButtonColor: "red",
                        confirmButtonText: "Yes",
                        customClass: "Hello",
                        confirmButtonColor: "#008000",
                        text: "Do You Want To Print ?",
                        type: "success",



                    }, function(inputValue) {
                        if (inputValue === true) {

                            printRawHtmlInvoice(data.details);

                        } else {

                            location.reload();
                        }

                    });
                } else {
                    toastr["error"](data.exception);
                }
            },
            error: function(xhr) {
                alert('failed!');
            }
        });
    });
});

var focuser = setInterval(() => window.dispatchEvent(new Event('focus')), 200);

function printRawHtmlInvoice(view) {
    printJS({
        printable: view,
        type: 'raw-html',
        onPrintDialogClose: printJobCompleteInvoice

    });


}

function printJobCompleteInvoice() {
    location.reload();

}