<div class="row">
            <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo display('payment_method_list') ?> </h4>
                        </div>
                    </div>
                   
                    <div class="panel-body">
                        <table class="table table-bordered datatable">
                            <thead>
                                <tr>
                                    <th><?php echo display('sl_no')?></th>
                                    <th><?php echo display('payment_method_name')?></th>
                                    <th class="text-center"><?php echo display('action')?></th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php if($pmethods){
                                    $sl = 1;
                                    foreach($pmethods as $methods){
                                    ?>
                                <tr>
                                    <td><?php echo $sl++;?></td>
                                    <td><?php echo $methods->HeadName;?></td>
                                    <td class="text-center">
                                        <?php if($this->permission1->method('payment_method_list','update')->access()){ ?>
                                        <a href="<?php echo base_url().'add_payment_method/'.$methods->id; ?>" class="btn btn-info btn-sm"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <?php }?>
                                     <!-- <?php if($this->permission1->method('payment_method_list','delete')->access() && $methods->HeadCode != '111000001'){ ?>
                                            <a href="<?php echo base_url().'account/account/delete_payment_method/'.$methods->HeadCode; ?>" class="btn btn-danger btn-sm" data-toggle="tooltip" onclick="return confirm('Are You Sure ?')" data-placement="left" title="" data-original-title="<?php echo display('delete') ?>"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                        <?php }?> -->
                                    </td>

                                </tr>
                            <?php }}?>
                            </tbody>
                            
                        </table>
                     </div>
                     </div>
        </div>  
</div> 