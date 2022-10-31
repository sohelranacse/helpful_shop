 <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo $title ?> </h4>
                        </div>
                    </div>
                   
                    <div class="panel-body">
                                <?php echo form_open('terms_add/'.$single_terms->id,'class="" id="terms_form"')?>
                                
                                <input type="hidden" name="term_id" id="term_id" value="<?php echo $single_terms->id?>">
                                <div class="form-group row">
                                    <label for="term_condi" class="col-sm-2 text-right col-form-label"><?php echo display('term_condi')?> <i class="text-danger"> * </i>:</label>
                                    <div class="col-sm-4">
                                        <textarea  name="term_condi" id="term_condi" class="form-control"><?php echo $single_terms->description?></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="status" class="col-sm-2 text-right col-form-label"><?php echo display('status')?> <i class="text-danger"> * </i>:</label>
                                    <div class="col-sm-4">
                                        
                            <select name="status" id="status" class="form-control" required>
                            <?php if(!empty($single_terms->description)){?>
                            <option value="1" <?php if($single_terms->status == 1){echo 'selected';}?>><?php echo display('active')?></option>
                             <option value="0" <?php if($single_terms->status == 0){echo 'selected';}?>><?php echo display('inactive')?></option>      
                             <?php }else {?>
                                 <option value="1" ><?php echo display('active')?></option>
                                 <option value="0" ><?php echo display('inactive')?></option>      
                                 <?php }?>
                              </select>
                                    </div>
                                </div>

                         <div class="form-group row">
                                   
                                     <div class="col-sm-6 text-right">
                                        
                                           
                                            <button type="submit" class="btn btn-success ">
                                                <?php echo (empty($single_terms->id)?display('save'):display('update')) ?></button>
    
                                        
                                       
                                    </div>
                                </div>
                               

                                <?php echo form_close();?>
                            </div>
    
                        </div>
                    </div>
                </div>
               
