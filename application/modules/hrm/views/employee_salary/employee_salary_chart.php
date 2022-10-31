<link rel="stylesheet" href="<?php //echo base_url() ?>assets/css/attendance.css" />

<style type="text/css">
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
</style>

<div class="row">
 <div class="col-sm-12 col-md-12">
    <div class="panel panel-bd">
        <div class="panel-heading" >
            <div class="panel-title">
                <h3><?php echo $title; ?></h3>
            </div>
        </div>
        <div class="panel-body">

        <div class="text-right" id="print">

           <button type="button" class="btn btn-warning" id="btnPrint" onclick="printPageArea('printArea');"><i class="fa fa-print"></i></button>

           
            
        </div>

        <br>

        <div id="printArea">

        <div>

            <div class="row mb-10">
                <table class="table" width="99%">
                    <thead>
                        <tr>
                            <td align="center" class="text-center" style="border:none;text-align: center;padding-bottom: 10px;">
                                <img src="<?php echo base_url('/').$setting->logo;?>">
                            </td>
                        </tr>
                        <tr>
                            <th align="center" class="text-center fs-20" style="border:none;text-align: center;padding-bottom: 30px;"><?php echo $title.' for '.$salary_sheet_generate_info->name; ?></th>
                        </tr>
                    </thead>
                </table>
            </div>

            <?php

            $curncy_symbol = '';
            $social_security_tax_percnt = '';
            if(!empty($currency)){
                $curncy_symbol = '('.$currency.')';
                // $social_security_tax_percnt = $setting->soc_sec_npf_tax;
            }

            ?>

            <table width="99%" class="payrollDatatableReport table table-striped table-bordered table-hover">
                <thead bgcolor="#E7E0EE">

                  <tr>
                    <th class="text-left" width="2%">Sl</th>
                    <th class="text-left" width="5%">Employee Name</th>
                    <th class="text-left" width="8%">Basic Salary</th>
                    <th class="text-left" width="8%">Total Benefit</th>
                    <th class="text-left" width="9%">Transport Allowance</th>
                    <th class="text-left" width="8%">Gross Salary</th>
                    <th class="text-left" width="8%">State Income Tax</th>
                    <th class="text-left" width="9%">Soc.Sec.NPF<?php echo ' '.$social_security_tax_percnt.'%';?></th>
                    <th class="text-left" width="9%">Employer Contribution 10%</th>
                    <th class="text-left" width="8%">Loan Deduction</th>
                    <th class="text-left" width="8%">Salary Advance</th>
                    <th class="text-left" width="10%">Total Deductions</th>
                    <th class="text-left" width="8%">Net Salary</th>
                  </tr>

                </thead>

                <tbody class="employee_salary_chart">

                   <?php 

                  $i = 1;
                  $total_benefits = 0.0;
                  $total_deductions = 0.0;

                  foreach ($employee_salary_charts as $key => $row) {

                    $total_benefits = floatval($row->medical_benefit) + floatval($row->family_benefit) + floatval($row->transportation_benefit) + floatval($row->other_benefit);

                    $total_deductions = floatval($row->income_tax) + floatval($row->soc_sec_npf_tax) + floatval($row->loan_deduct) + floatval($row->salary_advance);

                  ?>

                  <tr>
                    <td class="text-left"><?php echo $i;?></td>
                    <td class="text-left"><?php echo $row->first_name.' '.$row->last_name;?></td>
                    <td class="text-left"><?php echo $currency.' '.$row->basic_salary_pro_rated;?></td>
                    <td class="text-left"><?php echo $currency.' '.$total_benefits;?></td>
                    <td class="text-left"><?php echo $currency.' '.$row->transport_allowance_pro_rated;?></td>
                    <td class="text-left"><?php echo $currency.' '.$row->gross_salary;?></td>
                    <td class="text-left"><?php echo $currency.' '.$row->income_tax;?></td>
                    <td class="text-left"><?php echo $currency.' '.$row->soc_sec_npf_tax;?></td>
                    <td class="text-left"><?php echo $currency.' '.floatval($row->employer_contribution);?></td>
                    <td class="text-left"><?php echo $currency.' '.$row->loan_deduct;?></td>
                    <td class="text-left"><?php echo $currency.' '.$row->salary_advance;?></td>
                    
                    <td class="text-left"><?php echo $currency.' '.$total_deductions;?></td>

                    <td class="text-left"><?php echo $currency.' '.$row->net_salary;?></td>
                  </tr>

                  <?php

                  $i++;

                  }

                  ?>
                  
                </tbody>

                <tfoot>
                   <tr >
                    <td colspan="13" class="noborder">
                        <table border="0" width="100%" style="padding-top: 100px;border: none !important;">                                                
                        <tr>
                            <td align="left" class="noborder" width="30%">
                                <div class="border-top"><?php echo display('prepared_by')?>: <b><?php echo $user_info['fullname'];?></b></div>
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
    // nWindow.document.write(htmlToPrint);

    WinPrint.document.write(htmlToPrint);
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
}

</script>