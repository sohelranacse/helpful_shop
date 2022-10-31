<script src="<?php echo base_url() ?>my-assets/js/admin_js/json/product.js" type="text/javascript"></script>
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo $title; ?></h4>
                </div>
            </div>
            <?php echo form_open_multipart('product_form/'.$id, array('class' => 'form-vertical', 'id' => 'insert_product', 'name' => 'insert_product')) ?>
            <div class="panel-body">
                <?php if(empty($id)){?>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group row">
                            <label for="barcode_or_qrcode"
                                class="col-sm-2 col-form-label"><?php echo display('barcode_or_qrcode') ?> <i
                                    class="text-danger"></i></label>
                            <div class="col-sm-10">
                                <input class="form-control" name="product_id" type="text" id="product_id"
                                    placeholder="<?php echo display('barcode_or_qrcode') ?>" tabindex="1">
                            </div>
                        </div>
                    </div>
                </div>
                <?php }?>


                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="product_name"
                                class="col-sm-4 col-form-label"><?php echo display('product_name') ?> <i
                                    class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <input class="form-control" name="product_name" type="text" id="product_name"
                                    placeholder="<?php echo display('product_name') ?>"
                                    value="<?php echo $product->product_name?>" required tabindex="1">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="serial_no" class="col-sm-4 col-form-label"><?php echo display('serial_no') ?>
                            </label>
                            <div class="col-sm-8">
                                <input type="text" tabindex="" class="form-control " id="serial_no" name="serial_no"
                                    placeholder="111,abc,XYz" value="<?php echo $product->serial_no?>" />
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="category_id" class="col-sm-4 col-form-label"><?php echo display('category') ?>
                                <i class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <select class="form-control" id="category_id" required name="category_id" tabindex="3">
                                    <option value=""></option>
                                    <?php if ($category_list) { ?>
                                    <?php foreach($category_list as $categories){?>
                                    <option value="<?php echo $categories['category_id']?>"
                                        <?php if($product->category_id ==$categories['category_id']){echo 'selected';}?>>
                                        <?php echo $categories['category_name']?></option>
    
                                    <?php }} ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="product_model" class="col-sm-4 col-form-label"><?php echo display('model') ?> </label>
                            <div class="col-sm-8">
                                <input type="text" tabindex="" class="form-control" id="product_model" name="model"
                                    placeholder="<?php echo display('model') ?>"
                                    value="<?php echo $product->product_model?>" />
                            </div>
                        </div>
                    </div>


                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="sell_price" class="col-sm-4 col-form-label"><?php echo display('sell_price') ?>
                                </label>
                            <div class="col-sm-8">
                                <input class="form-control text-right" id="sell_price" name="price" type="text"
                                   placeholder="0.00" tabindex="5" min="0"
                                    value="<?php echo $product->price?>">
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="unit" class="col-sm-4 col-form-label"><?php echo display('unit') ?></label>
                            <div class="col-sm-8">
                                <select class="form-control" id="unit" name="unit" tabindex="-1" aria-hidden="true">
                                    <option value="">Select One</option>
                                    <?php if ($unit_list) { ?>
                                    <?php foreach($unit_list as $units){?>
                                    <option value="<?php echo $units['unit_name']?>"
                                        <?php if($product->unit ==$units['unit_name']){echo 'selected';}?>>
                                        <?php echo $units['unit_name']?></option>

                                    <?php }} ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <?php if(empty($supplier_pr)){?>
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="cost_price" class="col-sm-4 col-form-label"><?php echo display('cost_price') ?>
                                </label>
                            <div class="col-sm-8">
                                <input class="form-control text-right" id="cost_price" name="supplier_price" type="text"
                                     placeholder="0.00" tabindex="5" min="0">
                            </div>
                        </div>
                    </div>
                    <?php }else{
                    foreach($supplier_pr as $supplier_product){
                    ?>
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="cost_price" class="col-sm-4 col-form-label"><?php echo display('cost_price') ?>
                                </label>
                            <div class="col-sm-8">
                                <input class="form-control text-right" id="cost_price" name="supplier_price" type="text"
                                     placeholder="0.00" tabindex="5" min="0"
                                    value="<?php echo $supplier_product['supplier_price']?>">
                            </div>
                        </div>
                    </div>
                    <?php }}?>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="image" class="col-sm-4 col-form-label"><?php echo display('image') ?> </label>
                            <div class="col-sm-8">
                                <input type="file" name="image" class="form-control" id="image" tabindex="4">
                                <input type="hidden" name="old_image" value="<?php echo $product->image;?>">
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-6" <?php if($vattaxinfo->fixed_tax != 1){echo 'hidden';}?>>
                        <div class="form-group row">
                            <label for="serial_no"
                                class="col-sm-4 col-form-label"><?php echo display('product_vat').' %' ?> </label>
                            <div class="col-sm-8">
                                <input type="text" tabindex="" class="form-control " id="product_vat" name="product_vat"
                                    placeholder="<?php echo display('product_vat').' %' ?>"
                                    value="<?php echo $product->product_vat?>" />
                            </div>
                        </div>
                    </div>
                    

                    <?php if($supplier_pr){?>
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="image" class="col-sm-4 col-form-label"> </label>
                            <div class="col-sm-8">
                                <img src="<?php echo base_url().$product->image?>" alt="" width="100" height="80">

                            </div>
                        </div>
                    </div>
                    <?php }?>

                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="category_id" class="col-sm-4 col-form-label"><?php echo display('supplier') ?>
                                <i class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <select name="supplier_id[]" class="form-control" required="">
                                        <option value=""> select Supplier</option>
                                        <?php if ($supplier) { ?>
                                        <?php foreach($supplier as $suppliers){?>
                                        <option value="<?php echo $suppliers['supplier_id']?>"
                                        <?php if($supplier_pr[0]['supplier_id']==$suppliers['supplier_id']){echo 'selected';}?>
                                        >
                                            <?php echo $suppliers['supplier_name']?></option>

                                        <?php }} ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <?php 
                                 $i=0;

                    foreach ($taxfield as $taxss) {?>

                    <div class="col-sm-6" <?php if($vattaxinfo->dynamic_tax != 1){ echo 'hidden';}?>>
                        <div class="form-group row">
                            <label for="tax" class="col-sm-4 col-form-label"><?php echo $taxss['tax_name']; ?> <i
                                    class="text-danger"></i></label>
                            <div class="col-sm-7">
                                <input type="text" name="tax<?php echo $i;?>" class="form-control" value="<?php  $taxv = 'tax'.$i;
                              echo (!empty($supplier_pr)?($product->$taxv*100): number_format($taxss['default_value'], 2, '.', ','));
                              ?>">
                            </div>
                            <div class="col-sm-1"> <i class="text-success">%</i></div>
                        </div>
                    </div>

                    <?php $i++;} ?>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group row">
                            <label for="serial_no"
                                class="col-sm-2 col-form-label"><?php echo display('product_details') ?> </label>
                            <div class="col-sm-10">
                            <textarea class="form-control" name="description" id="description" rows="3"
                            placeholder="<?php echo display('product_details') ?>"
                            tabindex="2"><?php echo $product->product_details?></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <input type="submit" id="add-product" class="btn btn-primary btn-large" name="add-product"
                            value="<?php echo display('save') ?>" tabindex="10" />
                    </div>
                </div>
            </div>
            <?php echo form_close() ?>
        </div>
        <input type="hidden" id="supplier_list"
            value='<?php if ($supplier) { ?><?php foreach($supplier as $suppliers){?><option value="<?php echo $suppliers['supplier_id']?>"><?php echo $suppliers['supplier_name']?></option><?php }}?>'
            name="">
    </div>
</div>