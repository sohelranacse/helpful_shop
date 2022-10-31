<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag"> 
            <div class="panel-heading">
                <div class="panel-title">
                    <span><?php echo $title; ?></span>
                    <span class="padding-lefttitle">
                    <a href="<?php echo base_url('salary_advance_view');?>" class="btn btn-primary"><?php echo display('salary_advance_view')?></a>
                    </span>
                </div>
            </div>
            <div class="panel-body">
                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><?php echo display('Sl') ?></th>
                            <th><?php echo display('employee_name') ?></th>
                            <th><?php echo display('amount') ?></th>
                            <th><?php echo display('release_amount') ?></th>
                            <th><?php echo display('salary_month') ?></th>
                            <th><?php echo display('create_date') ?></th>
                            <th><?php echo display('action') ?></th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($salary_adv_list)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($salary_adv_list as $salary_adv) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">

                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $salary_adv->first_name.' '.$salary_adv->last_name; ?></td>
                                    <td><?php if(!empty($setting->currency_symbol)){echo $setting->currency_symbol;}?><?php echo ' '.$salary_adv->amount; ?></td>
                                    <td><?php if(!empty($setting->currency_symbol)){echo $setting->currency_symbol.' ';}?><?php echo $salary_adv->release_amount > 0 ? $salary_adv->release_amount : 0; ?></td>
                                    <td><?php echo $salary_adv->salary_month; ?></td>
                                    <td><?php echo $salary_adv->CreateDate; ?></td>

                                    <td class="center">
                                     <?php if($this->permission1->method('salary_advance_view','update')->access()): ?>
                                        <a href="<?php echo base_url("hrm/salary_advance/update_salary_advance/$salary_adv->id") ?>" class="btn btn-xs btn-success"><i class="fa fa-pencil"></i></a> 
                                        <?php endif; ?>
                                    
                                    <?php if($this->permission1->method('salary_advance_view','delete')->access()): ?>
                                        <a href="<?php echo base_url("hrm/salary_advance/delete_salary_advance/$salary_adv->id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?>') "><i class="fa fa-trash"></i></a> 
                                         <?php endif; ?>
                                    </td>
                                    
                                </tr>
                                <?php $sl++; ?>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
            </div>
        </div>
    </div>
</div>


<script src="<?php echo base_url('my-assets\js\admin_js\payroll.js') ?>" type="text/javascript"></script>