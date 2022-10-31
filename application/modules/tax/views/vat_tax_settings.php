<link href="<?php echo base_url('assets/css/vat_tax_settings.css') ?>" rel="stylesheet" type="text/css" />
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo display('vat_tax_setting') ?> </h4>
                </div>
            </div>
            <?php echo form_open_multipart('tax/tax/create_vat_tax_settins',array('class' => 'form-vertical','id' => 'tax_settings' ))?>
            <div class="panel-body container" >
                <label for="re1" class=" invoice-view-option">Fixed VAT
                    <input type="radio" id="re1" <?php if(!empty($vtinfo)){if($vtinfo->fixed_tax == 1){echo 'checked';}}?>  name="fixordy" value="1">
                    <span class="checkmark"></span>
                </label>
                <small ><ul>** Individual Product & service VAT.Set VAT value from product & service add (Dynamic TAX wont apply)**</ul></small>
                <label for="re2" class=" invoice-view-option">Dynamic TAX
                    <input type="radio" id="re2" <?php if(!empty($vtinfo)){if($vtinfo->dynamic_tax == 1){echo 'checked';}}?> name="fixordy" value="2">
                    <span class="checkmark"></span>
                </label>
                <small ><ul>** Global TAX for product & service. Need to add multiple taxs from TAX setting (Fixed VAT wont apply)**</ul></small>
                <div class="form-group row">
                    <label for="example-text-input" class="col-sm-4 col-form-label"></label>
                    <div class="col-sm-6">
                        <input type="submit" id="add-settings" class="btn btn-success" name="add-settings"
                            value="<?php echo display('save') ?>" />
                    </div>
                </div>
            </div>
            <?php echo form_close()?>
        </div>
    </div>
</div>