       

<div class="row no-gutters">
  <div class="form-group col-md-6">
      <label for="payments" class="col-form-label pb-2"><?php echo display('payment_type');?></label>
          
      <?php
      if ($is_credit == 1) {
        $card_type=0;
      } 
      else{
        
        $card_type='';
      }
          echo form_dropdown('multipaytype[]',$all_pmethod,$card_type,'onchange = "check_creditsale()" class="card_typesl postform resizeselect form-control "') ?> 
  
  </div>
  <div class="form-group col-md-6">
      <label for="4digit" class="col-form-label pb-2"><?php echo display('paid_amount');?></label>
      
          <input type="text" id="pamount_by_method"  class="form-control number pay firstpay"  name="pamount_by_method[]" value="" onkeyup="changedueamount()"  placeholder="0" />
  
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