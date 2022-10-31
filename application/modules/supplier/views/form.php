 <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo $title ?> </h4>
                        </div>
                    </div>
                   
                    <div class="panel-body">
                            	<?php echo form_open('','class="" id="supplier_form"')?>
                            	
                            	<input type="hidden" name="supplier_id" id="supplier_id" value="<?php echo $supplier->supplier_id?>">
                                <div class="form-group row">
                                    <label for="supplier_name" class="col-sm-2 text-right col-form-label"><?php echo display('supplier_name')?> <i class="text-danger"> * </i>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="text" name="supplier_name" class="form-control" id="supplier_name" placeholder="<?php echo display('supplier_name')?>" value="<?php echo $supplier->supplier_name?>">
                                            <input type="hidden" name="old_name" value="<?php echo $supplier->supplier_name?>">
    
                                        </div>
                                       
                                    </div>
                                     <label for="supplier_mobile" class="col-sm-2 text-right col-form-label"><?php echo display('mobile_no')?> <i class="text-danger">  </i>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="number" name="supplier_mobile" class="form-control input-mask-trigger text-left" id="supplier_mobile" placeholder="<?php echo display('mobile_no')?>" value="<?php echo $supplier->mobile?>" data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true" im-insert="true">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="supplier_email" class="col-sm-2 text-right col-form-label"><?php echo display('email_address')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="email" class="form-control input-mask-trigger" name="supplier_email" id="email" data-inputmask="'alias': 'email'" im-insert="true" placeholder="<?php echo display('email')?>" value="<?php echo $supplier->emailnumber?>">
    
                                        </div>
                                       
                                    </div>
                                      <label for="email_address" class="col-sm-2 text-right col-form-label"><?php echo display('vat_no')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="email" class="form-control" name="email_address" id="email_address" placeholder="<?php echo display('vat_no')?>" value="<?php echo $supplier->email_address?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="phone" class="col-sm-2 text-right col-form-label"><?php echo display('phone')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                          <input class="form-control input-mask-trigger text-left" id="phone" type="number" name="phone" placeholder="<?php echo display('phone')?>" data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true" im-insert="true" value="<?php echo $supplier->phone?>">
    
                                        </div>
                                       
                                    </div>

                                     <label for="contact" class="col-sm-2 text-right col-form-label"><?php echo display('contact')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                          <input class="form-control"  id="contact" type="text" name="contact" placeholder="<?php echo display('contact')?>" value="<?php echo $supplier->contact?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="address1" class="col-sm-2 text-right col-form-label"><?php echo display('address1')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                           <textarea name="supplier_address" id="supplier_address" class="form-control" placeholder="<?php echo display('address1')?>"><?php echo $supplier->address?></textarea>
    
                                        </div>
                                      
                                    </div>

                                          <label for="address2" class="col-sm-2 text-right col-form-label"><?php echo display('address2')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                           <textarea name="address2" id="address2" class="form-control" placeholder="<?php echo display('address2')?>"><?php echo $supplier->address2?></textarea>
    
                                        </div>
                                      
                                    </div>
                                </div>
                                <div class="form-group row"> 
                                    <label for="fax" class="col-sm-2 text-right col-form-label"><?php echo display('fax')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                            <input type="text" name="fax" class="form-control" id="fax" placeholder="<?php echo display('fax')?>" value="<?php echo $supplier->fax?>">
    
                                        </div>
                                       
                                    </div>
                                    <label for="city" class="col-sm-2 text-right col-form-label"><?php echo display('city')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                            <input type="text" name="city" class="form-control" id="city" placeholder="<?php echo display('city')?>" value="<?php echo $supplier->city?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="state" class="col-sm-2 text-right col-form-label"><?php echo display('state')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="text" name="state" class="form-control" id="state" placeholder="<?php echo display('state')?>"  value="<?php echo $supplier->state?>">
    
                                        </div>
                                       
                                    </div>
                                    <label for="zip" class="col-sm-2 text-right col-form-label"><?php echo display('zip')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input name="zip" type="text" class="form-control" id="zip" placeholder="<?php echo display('zip')?>" value="<?php echo $supplier->zip?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="country" class="col-sm-2 text-right col-form-label"><?php echo display('country')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input name="country" type="text" class="form-control " placeholder="<?php echo display('country')?>" value="<?php echo $supplier->country?>" id="country" >
    
                                        </div>
                                       
                                    </div>
                                    <?php if(empty($supplier->supplier_id)){?>

                                     
                                <?php }?>
                                    
                                </div>

                              

                         <div class="form-group row">
                                   <div class="col-sm-6 text-right">
                                   </div>
                                     <div class="col-sm-6 text-right">
                                        <div class="">
                                           
                                            <button type="button" onclick="supplier_form()" class="btn btn-success">
                                            	<?php echo (empty($supplier->supplier_id)?display('save'):display('update')) ?></button>
    
                                        </div>
                                       
                                    </div>
                                </div>
                               

                                <?php echo form_close();?>
                            </div>
    
                        </div>
                    </div>
                </div>
               
