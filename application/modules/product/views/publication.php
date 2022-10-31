        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo $title; ?> </h4>
                        </div>
                    </div>
                   <?php echo form_open('publication',array('class' => 'form-vertical' ))?>
                    <div class="panel-body">

                    	<div class="form-group row">
                            <input type="hidden" name="publication_id" value="<?php if(isset($publication_data)) echo $publication_data->publication_id; ?>">
                            <label for="name" class="col-sm-2 col-form-label"><?php echo display('publication_name') ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="publication_name" id="publication_name" required="" placeholder="Type <?php echo display('publication_name') ?>" value="<?php if(isset($publication_data)) echo $publication_data->publication_name; ?>"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="status" class="col-sm-2 col-form-label"><?php echo display('status')?> <i class="text-danger"> * </i>:</label>
                            <div class="col-sm-4">

                                <select name="status" id="status" class="form-control" required>
                                    <?php if(isset($publication_data)){?>
                                        <option value="1" <?php if($publication_data->status == 1){echo 'selected';}?>><?php echo display('active')?></option>
                                        <option value="0" <?php if($publication_data->status == 0){echo 'selected';}?>><?php echo display('inactive')?></option>      
                                    <?php }else {?>
                                        <option value="1" ><?php echo display('active')?></option>
                                        <option value="0" ><?php echo display('inactive')?></option>  
                                    <?php }?>
                                </select>
                            </div>
                        </div>
                       

                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-6">
                                <input type="submit" class="btn btn-success" name="save" value="<?php echo display('save') ?>"/>
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
                            <h4><?php echo display('publication_list') ?></h4>
                        </div>
                    </div>
                    <div class="panel-body">
         
                        <div class="">
                            <table class="datatable table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th><?php echo display('sl_no') ?></th>
                                        <th><?php echo display('publication_name') ?></th>
                                        <th><?php echo display('status') ?></th>
                                        <th><?php echo display('action') ?></th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php

                                     if(sizeof($publication_list)){ ?>
                                    <?php $sl = 1; ?>
                                    <?php foreach($publication_list as $value) { ?>
                                    <tr>
                                        <td><?php echo $sl++; ?></td>
                                       
                                        <td><?php echo $value->publication_name; ?></td>
                                        <td class="text-center"><?php if($value->status ==1){echo display('active');}else{
                                            echo display('inactive');
                                        }?></td>
                                       
                                        <td>
                                            <a href="<?php echo base_url("publication/$value->publication_id") ?>" class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="left" title="Update"><i class="fa fa-pencil" aria-hidden="true"></i></a>

                                            <a href="<?php echo base_url("product/delete_publication/$value->publication_id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="right" title="Delete "><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                           
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

         