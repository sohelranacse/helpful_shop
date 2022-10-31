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
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="barcode_or_qrcode" class="col-sm-4 col-form-label"><?php echo display('barcode_or_qrcode') ?> <i class="text-danger"></i></label>
                            <div class="col-sm-8">
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
                            <label for="category_id" class="col-sm-4 col-form-label"><?php echo display('category') ?>
                                <i class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <select class="form-control" id="category_id" required name="category_id" tabindex="3">
                                    <option value=""></option>
                                    <?php if (sizeof($category_list)) { ?>
                                    <?php foreach($category_list as $categories){?>
                                    <option value="<?php echo $categories['category_id']?>"
                                        <?php if($product->category_id ==$categories['category_id']){echo 'selected';}?>>
                                        <?php echo $categories['category_name']?></option>

                                    <?php }} ?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>


                

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="product_name" class="col-sm-4 col-form-label"><?php echo display('product_name') ?> <i
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
                            <label for="writer_id" class="col-sm-4 col-form-label"><?php echo display('writer') ?></label>
                            <div class="col-sm-8">
                                <select class="form-control" id="writer_id" required name="writer_id" tabindex="3">
                                    <option value="0">Select</option>
                                    <?php if (sizeof($writer_list)) { ?>
                                    <?php foreach($writer_list as $writers){?>
                                    <option value="<?php echo $writers['writer_id']?>"
                                        <?php if($product->writer_id ==$writers['writer_id']){echo 'selected';}?>>
                                        <?php echo $writers['writer_name']?></option>

                                    <?php }} ?>
                                </select>
                            </div>
                        </div>
                    </div>


                </div>

                <div class="row">
                    

                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="cost_price" class="col-sm-4 col-form-label"><?php echo display('cost_price') ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <input class="form-control text-right" id="cost_price" name="supplier_price" type="number" step="any" 
                                     placeholder="0.00" tabindex="5" min="0" value="<?php echo $product->supplier_price?>">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="publication_id" class="col-sm-4 col-form-label"><?php echo display('publication') ?></label>
                            <div class="col-sm-8">
                                <select class="form-control" id="publication_id" required name="publication_id" tabindex="3">
                                    <option value="0">Select</option>
                                    <?php if (sizeof($publication_list)) { ?>
                                    <?php foreach($publication_list as $publications){?>
                                    <option value="<?php echo $publications['publication_id']?>"
                                        <?php if($product->publication_id ==$publications['publication_id']){echo 'selected';}?>>
                                        <?php echo $publications['publication_name']?></option>

                                    <?php }} ?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="sell_price" class="col-sm-4 col-form-label"><?php echo display('sell_price') ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <input class="form-control text-right" id="sell_price" name="price" type="number" step="any" 
                                   placeholder="0.00" tabindex="5" min="0" value="<?php echo $product->price?>">
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="unit" class="col-sm-4 col-form-label"><?php echo display('unit') ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <select class="form-control" id="unit" name="unit" tabindex="-1" aria-hidden="true">
                                    <option value="">Selct</option>
                                    <?php if ($unit_list) { ?>
                                    <?php foreach($unit_list as $units){?>
                                    <option value="<?php echo $units['unit_id']?>"
                                        <?php if($product->unit ==$units['unit_id']){echo 'selected';}?>>
                                        <?php echo $units['unit_name']?></option>

                                    <?php }} ?>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="category_id" class="col-sm-4 col-form-label"><?php echo display('supplier') ?>
                                <i class="text-danger">*</i></label>
                            <div class="col-sm-8">
                                <select name="supplier_id" class="form-control" required="">
                                    <option value=""> Select</option>
                                    <?php if (sizeof($supplier))
                                        foreach($supplier as $suppliers){
                                    ?>
                                        <option value="<?php echo $suppliers['supplier_id']?>"
                                            <?php if($product->supplier_id==$suppliers['supplier_id']){ echo 'selected="selected"';} ?>
                                    >
                                        <?php echo $suppliers['supplier_name']?></option>

                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="image" class="col-sm-4 col-form-label"><?php echo display('image') ?> </label>
                            <div class="col-sm-8">
                                <input type="file" name="image" class="form-control" id="image" tabindex="4">
                                <input type="hidden" name="old_image" value="<?php echo $product->image;?>">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-8">
                        <div class="form-group row">
                            <label for="serial_no"
                                class="col-sm-3 col-form-label"><?php echo display('product_details') ?> </label>
                            <div class="col-sm-9">
                            <textarea class="form-control" name="description" id="description" rows="3"
                            placeholder="<?php echo display('product_details') ?>"
                            tabindex="2"><?php echo $product->product_details?></textarea>
                            </div>
                        </div>
                    </div>

                    <?php if(isset($edit)) { ?>
                        <div class="col-sm-4">
                            <div class="form-group row">
                                <div class="col-sm-8">
                                    <img src="<?php echo base_url().$product->image?>" alt="" width="100" height="80">

                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>

                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <input type="submit" id="add-product" class="btn btn-primary btn-large" name="add-product"
                            value="<?php echo display('save') ?>" tabindex="10" /> - or - 
                        <a href="<?php echo base_url('product_list'); ?>" class="btn btn-default"><?php echo display('manage_product'); ?></a>
                    </div>
                </div>
            </div>
            <?php echo form_close() ?>
        </div>
    </div>
</div>