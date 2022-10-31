 <div class="row">
     <div class="col-sm-12">
         <div class="panel panel-bd lobidrag">
             <div class="panel-heading">
                 <div class="panel-title">
                     <h4><?php echo $title ?> </h4>
                 </div>
             </div>

             <div class="panel-body">
                 <?php echo form_open('','class="" id="customer_form"')?>

                 <input type="hidden" name="customer_id" id="customer_id" value="<?php echo $customer->customer_id?>">
                 <div class="form-group row">
                     <label for="customer_name"
                         class="col-sm-2 text-right col-form-label"><?php echo display('customer_name')?> <i
                             class="text-danger"> * </i>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input type="text" name="customer_name" class="form-control" id="customer_name"
                                 placeholder="<?php echo display('customer_name')?>"
                                 value="<?php echo $customer->customer_name?>">
                             <input type="hidden" name="old_name" value="<?php echo $customer->customer_name?>">

                         </div>

                     </div>
                     <label for="customer_mobile"
                         class="col-sm-2 text-right col-form-label"><?php echo display('mobile_no')?> <i
                             class="text-danger"> </i>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input type="number" name="customer_mobile"
                                 class="form-control input-mask-trigger text-left" id="customer_mobile"
                                 placeholder="<?php echo display('mobile_no')?>"
                                 value="<?php echo $customer->customer_mobile?>"
                                 data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true"
                                 im-insert="true">

                         </div>

                     </div>
                 </div>
                 <div class="form-group row">
                     <label for="customer_email"
                         class="col-sm-2 text-right col-form-label"><?php echo display('email_address')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input type="text" class="form-control input-mask-trigger" name="customer_email" id="email"
                                 data-inputmask="'alias': 'email'" im-insert="true"
                                 placeholder="<?php echo display('email')?>"
                                 value="<?php echo $customer->customer_email?>">

                         </div>

                     </div>
                     <label for="email_address"
                         class="col-sm-2 text-right col-form-label"><?php echo display('vat_no')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input type="text" class="form-control" name="email_address" id="email_address"
                                 placeholder="<?php echo display('vat_no')?>"
                                 value="<?php echo $customer->email_address?>">

                         </div>

                     </div>
                 </div>
                 <div class="form-group row">
                     <label for="phone"
                         class="col-sm-2 text-right col-form-label"><?php echo display('phone')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input class="form-control input-mask-trigger text-left" id="phone" type="number"
                                 name="phone" placeholder="<?php echo display('phone')?>"
                                 data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true"
                                 im-insert="true" value="<?php echo $customer->phone?>">

                         </div>

                     </div>

                     <label for="contact" class="col-sm-2 text-right col-form-label"><?php echo display('cr_no')?>&nbsp;
                         <span  data-toggle="tooltip" data-placement="top" title="Commercial Registration Number">
                            <i class="fa fa-question-circle" aria-hidden="true"></i>
                         </span> :
                     </label>
                     <div class="col-sm-4">
                         <div class="">

                             <input class="form-control" id="contact" type="text" name="contact"
                                 placeholder="<?php echo display('cr_no')?>" value="<?php echo $customer->contact?>">

                         </div>

                     </div>
                 </div>
                 <div class="form-group row">
                     <label for="address1"
                         class="col-sm-2 text-right col-form-label"><?php echo display('address1')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <textarea name="customer_address" id="customer_address" class="form-control"
                                 placeholder="<?php echo display('address1')?>"><?php echo $customer->customer_address?></textarea>

                         </div>

                     </div>

                     <label for="address2"
                         class="col-sm-2 text-right col-form-label"><?php echo display('address2')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <textarea name="address2" id="address2" class="form-control"
                                 placeholder="<?php echo display('address2')?>"><?php echo $customer->address2?></textarea>

                         </div>

                     </div>
                 </div>
                 <div class="form-group row">
                     <label for="fax" class="col-sm-2 text-right col-form-label"><?php echo display('fax')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input type="text" name="fax" class="form-control" id="fax"
                                 placeholder="<?php echo display('fax')?>" value="<?php echo $customer->fax?>">

                         </div>

                     </div>
                     <label for="city" class="col-sm-2 text-right col-form-label"><?php echo display('city')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input type="text" name="city" class="form-control" id="city"
                                 placeholder="<?php echo display('city')?>" value="<?php echo $customer->city?>">

                         </div>

                     </div>
                 </div>
                 <div class="form-group row">
                     <label for="state"
                         class="col-sm-2 text-right col-form-label"><?php echo display('state')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input type="text" name="state" class="form-control" id="state"
                                 placeholder="<?php echo display('state')?>" value="<?php echo $customer->state?>">

                         </div>

                     </div>
                     <label for="zip" class="col-sm-2 text-right col-form-label"><?php echo display('zip')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input name="zip" type="text" class="form-control" id="zip"
                                 placeholder="<?php echo display('zip')?>" value="<?php echo $customer->zip?>">

                         </div>

                     </div>
                 </div>
                 <div class="form-group row">
                     <label for="country"
                         class="col-sm-2 text-right col-form-label"><?php echo display('country')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input name="country" type="text" class="form-control "
                                 placeholder="<?php echo display('country')?>" value="<?php echo $customer->country?>"
                                 id="country">

                         </div>

                     </div>
                     <?php if(empty($customer->customer_id)){?>

                     <!-- <label for="previous_balance"
                         class="col-sm-2 text-right col-form-label"><?php echo display('previous_balance')?>:</label>
                     <div class="col-sm-4">
                         <div class="">

                             <input name="previous_balance" type="number"
                                 class="form-control text-right input-mask-trigger"
                                 placeholder="<?php echo display('previous_balance')?>"
                                 data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true"
                                 im-insert="true">

                         </div>

                     </div> -->
                     <?php }?>

                 </div>



                 <div class="form-group row">
                     <div class="col-sm-6 text-right">
                     </div>
                     <div class="col-sm-6 text-right">
                         <div class="">

                             <button type="button" onclick="customer_form()" class="btn btn-success">
                                 <?php echo (empty($customer->customer_id)?display('save'):display('update')) ?></button>

                         </div>

                     </div>
                 </div>


                 <?php echo form_close();?>
             </div>

         </div>
     </div>
 </div>