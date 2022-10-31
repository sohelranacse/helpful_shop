       

<?php  $rand_num = rand(1,20);?>
<div class="row no-gutters" id="pmethod_<?php echo $rand_num;?>">
  <div class="form-group col-md-5">
      <label for="payments" class="col-form-label pb-2"><?php echo display('payment_type');?></label>
          
      <?php $card_type=1020101;
          echo form_dropdown('multipaytype[]',$all_pmethod,(!empty($card_type)?$card_type:null),'class="card_typesl postform resizeselect form-control "') ?> 
  
  </div>
  <div class="form-group col-md-5">
      <label for="4digit" class="col-form-label pb-2"><?php echo display('paid_amount');?></label>
      
          <input type="text" id="pamount_by_method_<?php echo $rand_num?>"  class="form-control number pay firstpay text-right valid_number"  name="pamount_by_method[]" value="" onkeyup="changedueamount()"  placeholder="0.00" required/>
  
  </div>
  <div class="form-group col-md-2">
    <label for="payments" class="col-form-label pb-2 text-white"><?php echo display('payment_type');?></label>
    <button class="btn btn-danger" onclick="removeMethod(this,<?php echo $rand_num?>)"><i class="fa fa-trash"></i></button>
  </div>
</div>
<script type="text/javascript">
  $(document).ready(function () {
    "use strict";
    // select 2 dropdown 
    $("select.form-control:not(.dont-select-me)").select2({
      placeholder: "Select option",
      allowClear: true
    });
  }); 
</script>