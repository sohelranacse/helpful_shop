<select name="product_id[]" id="product_id<?php echo $count; ?>" class="form-control combo" required="1" tabindex="1" onchange="return product_information(this.value, <?php echo $count; ?>)">
    <option value=""><?php echo display('select_one') ?></option>
    <?php if(sizeof($product_list)) foreach($product_list as $value){ ?>
    <option value="<?php echo $value->product_id; ?>">
        <?php echo $value->product_name; ?></option>
    <?php }?>
</select>