        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo $title; ?> </h4>
                        </div>
                    </div>
                   <?php echo form_open('warehouse',array('class' => 'form-vertical' ))?>
                    <div class="panel-body">

                    	<div class="form-group row">
                            <input type="hidden" name="warehouse_id" value="<?php if(isset($warehouse_data)) echo $warehouse_data->warehouse_id; ?>">
                            <label for="name" class="col-sm-3 col-form-label"><?php echo display('warehouse_name') ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="warehouse_name" id="warehouse_name" required="" placeholder="Type <?php echo display('warehouse_name') ?>" value="<?php if(isset($warehouse_data)) echo $warehouse_data->warehouse_name; ?>"/>
                            </div>
                        </div>

                       

                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-6">
                                <input type="submit" class="btn btn-success" name="add-currency" value="<?php echo display('save') ?>"/>
                            </div>
                        </div>
                    </div>
                    <?php echo form_close()?>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo display('warehouse_list') ?></h4>
                        </div>
                    </div>
                    <div class="panel-body">
         
                        <div class="">
                            <table class="datatable table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th><?php echo display('sl_no') ?></th>
                                        <th><?php echo display('warehouse_name') ?></th>
                                        <th><?php echo display('action') ?></th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php

                                     if(sizeof($warehouse_list)){ ?>
                                    <?php $sl = 1; ?>
                                    <?php foreach($warehouse_list as $value) { ?>
                                    <tr>
                                        <td><?php echo $sl++; ?></td>
                                       
                                        <td><?php echo $value->warehouse_name; ?></td>
                                       
                                        <td>
                                            <a href="<?php echo base_url("warehouse/$value->warehouse_id") ?>" class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="left" title="Update"><i class="fa fa-pencil" aria-hidden="true"></i></a>

                                            <a href="<?php echo base_url("dashboard/setting/delete_warehouse/$value->warehouse_id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="right" title="Delete "><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                           
                                        </td>
                                    </tr>
                                    <?php }} ?> 
                                </tbody>
                            </table>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

         