
<style type="text/css">

    table{font-size: 13px;}

    table thead{background-color: #E7E0EE;}

    table.payrollDatatableReport {       
        border-collapse: collapse;
        border: 0;
    }
    table.payrollDatatableReport td, table.payrollDatatableReport th {
        padding: 6px 15px;
    }
    table.payrollDatatableReport td, table.payrollDatatableReport th {
        border: 1px solid #ededed;
        border-collapse: collapse;
    }
    table.payrollDatatableReport td.noborder {
        border: none;
        padding-top: 40px;
    }
    table.payrollDatatableReport tbody tr td {
        font-size: 10px;
        padding-left: 5px;
        font-size: 13px;
    }

    table.payrollDatatableReport thead tr th {
        font-size: 13px;
        padding-left: 5px;
        text-align: left;
    }
</style>

<div class="container">

    <div class="panel panel-default thumbnail"> 
        
        <div class="panel-body">

            <div class="text-right" id="print">
               <button type="button" class="btn btn-warning" id="btnPrint" onclick="printPageArea('printArea');"><i class="fa fa-print"></i></button>

                
            </div>

            <br>

            <div id="printArea">

                <div style="padding:20px;">

                    <table width="99%">                                         
                        <tr>
                            <td width="30%" align="left">
                                <?php
                                $path = base_url((!empty($setting->logo)?$setting->logo:'assets/img/icons/mini-logo.png'));
                                $type = pathinfo($path, PATHINFO_EXTENSION);
                                $data = file_get_contents($path);
                                $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                                ?>
                                
                            </td>
                            <td width="40%" align="center">
                                <img src="<?php echo  $base64; ?>" alt="logo">
                                

                            </td>  
                             <td width="30%" align="right">
                            </date>
                            </td>
                        </tr>  
                     </table> 
                     <br>

                    <div class="row mb-10">
                       <table width="99%">
                            <thead>
                                <tr style="height: 40px;background-color: #E7E0EE;">
                                    <th class="text-center fs-20">PAYSLIP</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <br>
                    <div class="row">
                        <table width="99%" class="payrollDatatableReport table table-striped table-bordered table-hover">
                            <tbody>
                                <tr style="text-align: left;background-color: #E7E0EE;">
                                    <th>Employee Name</th>
                                    <th><?php echo $salary_info->first_name.' '.$salary_info->last_name;?></th>
                                    <th>Month</th>
                                    <th><?php echo $month_name;?></th>
                                </tr>
                                <tr style="text-align: left;">
                                    <th>Position</th>
                                    <td><?php echo $employee_info->designation;?></td>
                                    <td>From</td>
                                    <td><?php echo $from_date;?></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <th>Contact</th>
                                    <td><?php echo $employee_info->phone;?></td>
                                    <td>To</td>
                                    <td><?php echo $to_date;?></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <th>Address</th>
                                    <td><?php echo $employee_info->address_line_1;?></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <th>Recruitment date</th>
                                    <td><?php echo $recruitment_date;?></td>
                                    <td>Worked Days</td>
                                    <td><?php echo $work_days;?></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <th>Staff ID No.</th>
                                    <td><?php echo $employee_info->id;?></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <th>Seniority (yrs)</th>
                                    <td><?php echo $seniority_years;?></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <?php

                    $curncy_symbol = '';
                    $social_security_tax_percnt = '';
                    if(!empty($setting->currency_symbol)){
                        $curncy_symbol = $setting->currency_symbol;
                        $social_security_tax_percnt = $setting->soc_sec_npf_tax;
                    }

                    $total_benefits = 0.0;
                    $total_benefits = floatval($salary_info->medical_benefit) + floatval($salary_info->family_benefit) + floatval($salary_info->transportation_benefit) + floatval($salary_info->other_benefit);

                    ?>

                    <div class="row">
                        <table width="99%" class="payrollDatatableReport table table-striped table-bordered table-hover">
                            <thead>
                                <tr style="text-align: left;background-color: #E7E0EE;">
                                    <th>Description</th>
                                    <th>Gross Amount</th>
                                    <th>Rate</th>
                                    <th>#VALUE</th>
                                    <th>Deduction</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="text-align: left;">
                                    <td>Basic Salary</td>
                                    <td><?php echo $curncy_symbol.' '.$salary_info->basic;?></td>
                                    <td></td>
                                    <td><?php echo $curncy_symbol.' '.$salary_info->basic_salary_pro_rated;?></td>
                                    <td></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <td>Transpost allowance</td>
                                    <td><?php echo $curncy_symbol.' '.$salary_info->transport;?></td>
                                    <td></td>
                                    <td><?php echo $curncy_symbol.' '.$salary_info->transport_allowance_pro_rated;?></td>
                                    <td></td>
                                </tr>
                                 <tr style="text-align: left;">
                                    <td>Total Benefit</td>
                                    <td></td>
                                    <td></td>
                                    <td><?php echo $curncy_symbol.' '.$total_benefits;?></td>
                                    <td></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <td>Overtime</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <th>Gross Salary</th>
                                    <th></th>
                                    <th></th>
                                    <th><?php echo $curncy_symbol.' '.number_format($salary_info->gross_salary,2);?></th>
                                    <th></th>

                                </tr>
                                <tr style="text-align: left;">
                                    <td>State Income Tax</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><?php echo $curncy_symbol.' '.number_format($salary_info->income_tax,2);?></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <td>Social Security</td>
                                    <td></td>
                                    <td><?php echo $setting->soc_sec_npf_tax.'%';?></td>
                                    <td></td>
                                    <td><?php echo $curncy_symbol.' '.number_format($salary_info->soc_sec_npf_tax,2);?></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <td>Loan Deduction</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><?php echo $curncy_symbol.' '.number_format($salary_info->loan_deduct,2);?></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <td>Salary Advance</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><?php echo $curncy_symbol.' '.number_format($salary_info->salary_advance,2);?></td>
                                </tr>
                                <tr style="text-align: left;">
                                    <th align="left">Total Deductions</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th align="left"><?php echo $curncy_symbol.' '.number_format($total_deductions,2);?></th>
                                </tr>
                                <tr style="text-align: left;">
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>

                                <tr style="text-align: left;">
                                    <th colspan="3" align="left">Total Social Security</th>

                                    <th></th>
                                    <th align="left"><?php echo $curncy_symbol.' ';?><?php echo floatval($salary_info->employer_contribution) + floatval($salary_info->soc_sec_npf_tax);?></th>
                                </tr>

                                <tr style="text-align: left;">
                                    <th colspan="3" align="left">NET SALARY</th>

                                    <th></th>
                                    <th align="left"><?php echo $curncy_symbol.' ';?><?php echo number_format($salary_info->net_salary,2);?></th>
                                </tr>
                            </tbody>

                            <br>

                            <tfoot>
                                <tr>
                                    <td colspan="5" class="noborder">
                                        <table border="0" width="100%" style="padding-top: 50px;border: none !important;">                                                
                                        <tr border="0" style="height:50px;padding-top: 50px;border-left: none !important;">
                                            <td align="left" class="noborder" width="30%">
                                                <div class="border-top"><?php echo display('prepared_by')?>: <b><?php echo $user_info['fullname'];?><b></div>
                                            </td>
                                            <td align="left"  class="noborder" width="30%"> <div class="border-top"><?php echo display('checked_by')?></div>
                                            </td>  
                                             <td align="left"  class="noborder" width="20%">
                                                <div class="border-top"><?php echo display('authorised_by')?></div>
                                            </td>
                                        </tr>  
                                     </table>  
                                    </td>                    
                                 </tr> 
                            </tfoot>

                        </table>
                    </div>

                </div>

            </div>

        </div>
    </div>

</div>

<script type="text/javascript">
    
function printPageArea(areaID){
    var printContent = document.getElementById(areaID);
    var WinPrint = window.open('', '', 'width=900,height=650');

    var htmlToPrint = '' +
    '<style type="text/css">' +
    'table.payrollDatatableReport {' +
      'border-collapse: collapse;border: 0' +
      '}'+
    'table.payrollDatatableReport td, table.payrollDatatableReport th {' +
    'padding: 6px 15px;' +
    '}' +
    'table.payrollDatatableReport td, table.payrollDatatableReport th {' +
    'border: 1px solid #ededed;border-collapse: collapse;' +
    '}' +
    'table.payrollDatatableReport td.noborder {' +
    'border: none;padding-top: 40px;' +
    '}' +
    '</style>';

    htmlToPrint += printContent.innerHTML;

    WinPrint.document.write(htmlToPrint);
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
}

</script>