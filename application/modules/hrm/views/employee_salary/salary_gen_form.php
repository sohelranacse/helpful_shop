<link href="<?php echo base_url('application/modules/addon/assets/css/style.css'); ?>" rel="stylesheet" type="text/css"/>

<div class="row">

    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd">

            <div class="panel-heading">
                <div class="panel-title">
                  <h4>
                    <?php echo display('selectionlist')?>
                  </h4>
                </div>
            </div>

            <div class="panel-body">
                <div class="col-sm-4 col-md-4">


                    <?php echo form_open('hrm/Payroll/employee_salary_generate','id="salary_form"')?>

                        <div id="salar_month_box" class="form-group has-success row">
                            <label for="name" class="col-sm-3 col-form-label"><?php echo display('salar_month') ?></label>
                            <div class="col-sm-8">
                            <input type="text" class="form-control form-control-success monthYearPicker" name="name" id="salar_month"  autocomplete="off" placeholder="<?php echo display('salar_month') ?>" id="name">

                            <div class="form-feedback"><!-- Success! Almost done it. --></div>
                        
                            </div>
                        </div>
                           
                        <div class="form-group text-center">
                            <button type="reset" id="reset_button" class="btn btn-primary w-md m-b-5"><?php echo display('reset') ?></button>
                            <button type="submit" class="btn btn-success w-md m-b-5"><?php echo display('generate') ?></button>
                        </div>

                    <?php echo form_close();?>

                   

                </div>

                <div class="col-sm-8 col-md-8">
                    <table width="100%" class="table table-striped table-bordered table-hover">

                        <thead>
                            <tr>
                                <th><?php echo display('sl') ?></th>
                                <th><?php echo display('sal_name') ?></th>
                                <th><?php echo display('gdate') ?></th>
                                <th><?php echo display('generate_by') ?></th>

                                <th><?php echo display('status') ?></th>
                                <th><?php echo display('approved_date') ?></th>
                                <th><?php echo display('approved_by') ?></th>

                                <th><?php echo display('action') ?></th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php if (!empty($salgen)) { ?>
                                <?php $sl = 1; ?>
                                <?php foreach ($salgen as $que) { ?>
                                    <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                        <td><?php echo $sl; ?></td>
                                        <td><?php echo $que->name; ?></td>
                                        <td><?php echo $que->gdate; ?></td>
                                        <td><?php echo $que->first_name.' '.$que->first_name; ?></td>

                                        <td><?php echo $que->approved == 1?'<button type="button" class="btn btn-success btn-rounded w-md m-b-5">Approved</button>':'<button type="button" class="btn btn-warning btn-rounded w-md m-b-5">Not Approved</button>'; ?></td>
                                        <td><?php echo $que->approved_date; ?></td>
                                        <td><?php echo $que->firstname_apv_by.' '.$que->lastname_apv_by; ?></td>
                                                                    
                                        <td class="center">

                                        <?php if($this->permission1->method('employee_salary_generate','update')->access()): ?>
                                            <a title="Employee Salary Approval" href='<?php echo base_url("employee_salary_approval/$que->ssg_id") ?>' class='btn btn-xs btn-info' target="_blank"><i class="fa fa-check"></i></a>
                                        <?php endif; ?>

                                        <?php if($this->permission1->method('employee_salary_generate','read')->access()): ?>
                                            <a title="Employee Salary Chart" href='<?php echo base_url("employee_salary_chart/$que->ssg_id") ?>' class='btn btn-xs btn-success' target="_blank"><i class="fa fa-bars"></i></a>
                                        <?php endif; ?>

                                        <?php if($this->permission1->method('employee_salary_generate','delete')->access()): ?>
                                            <a href="<?php echo base_url("hrm/Payroll/delete_employee_salary_generate/$que->ssg_id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?>') "><i class="fa fa-trash"></i></a> 
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                    <?php $sl++; ?>
                                <?php } ?> 
                            <?php } ?> 
                        </tbody>

                    </table>  <!-- /.table-responsive -->

                    <?php echo  $links ?> 

                </div>
            </div>  
        </div>
    </div>
</div>

<style type="text/css">
    table tbody button{
        padding: 0px !important;
        font-size: 12px !important;
    }
</style>

<script src="<?php echo base_url('my-assets\js\admin_js\payroll.js') ?>" type="text/javascript"></script>

<script type="text/javascript">
    

    $(document).ready(function () {
        "use strict";
        $("#loading, .waitmsg").hide();

        // Download New Module
        $('#generate_salary').on('click', function (e) {
            e.preventDefault();
            
            var salar_month = $('#salar_month').val();
            var CSRF_TOKEN = $('[name="csrf_test_name"]').val();
            var base_url = $('#base_url').val();

            if(salar_month == ''){
                $("#salar_month_box").removeClass('has-success').addClass('has-danger');
                $(".form-feedback").html("<b>Please select salary month!</b>");
                return false;
            }

            $("#loading, .waitmsg").show();
            $(this).attr('disabled','disabled');
            $("#reset_button").attr('disabled','disabled');

            $.ajax({
                type:'POST',
                url:base_url + 'payroll/Payroll/employee_salary_generate2',
                data: "csrf_test_name="+CSRF_TOKEN+"&salary_month="+salar_month,
                success:function(res){

                  if (res) {

                    console.log(res);

                    $("#salar_month_box").removeClass('has-danger').addClass('has-success');
                    $(".form-feedback").html("<b>Success! Almost done it.Wait...</b>");
                    
                        // Timer set
                        var time = 10;
                        var wait = time * 1000;
                        setInterval(function(){
                         $("#wait").html(time);
                         time--;
                        }, 1000);
                        // End of Timer Set
                    
                        setTimeout(function(){
                            window.location.href=base_url+'payroll/Payroll/employee_salary_generate';
                        }, wait);

                    } else {

                        $("#salar_month_box").removeClass('has-success').addClass('has-danger');
                        $(".form-feedback").html("<b>Failed! Invalid Salary Month.</b>");
                        $("#loading, .waitmsg").hide();
                    }
                },
                error:function(){

                    $("#salar_month_box").removeClass('has-success').addClass('has-danger');
                    $(".form-feedback").html("<b>ERROR!Please Try Again</b>");
                    $("#loading, .waitmsg").hide();
                }
            });

        });

    });


</script>
             
 