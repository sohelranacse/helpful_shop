<!-- <script src="<?php // echo base_url()?>my-assets/js/admin_js/purchase.js" type="text/javascript"></script> -->

<style type="text/css">
    input::placeholder {
        font-size: 12px;
    }
    table input {
        padding: 0px;
        min-width: 90px;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-title">
                    <span><?php echo $title; ?></span>
                </div>
            </div>

            <div class="panel-body">
                <?php echo form_open('opening_stock',array('class' => 'form-vertical', 'id' => 'opening_stock','name' => 'opening_stock', 'autocomplete' => 'off'))?>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="supplier_sss" class="col-sm-4 col-form-label"><?php echo display('warehouse') ?> <i class="text-danger">*</i></label>
                            <div class="col-sm-6">
                                <select name="warehouse_id" id="warehouse_id" class="form-control " required="1" tabindex="1" onchange="return get_item_list_by_warehouse(this.value);">
                                    <option value=""><?php echo display('select_one') ?></option>
                                    <?php if(sizeof($warehouse_list)) foreach($warehouse_list as $value){ ?>
                                    <option value="<?php echo $value->warehouse_id; ?>">
                                        <?php echo $value->warehouse_name; ?></option>
                                    <?php }?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <div class="table-responsive" id="item_list"></div>

                <div class="form-group row text-right">
                    <div class="col-sm-12 p-20">
                        <input type="submit" id="add_purchase" class="btn btn-primary btn-large" name="add-purchase"
                            value="<?php echo display('submit') ?>" />

                    </div>
                </div>
                <?php echo form_close()?>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
    function getXMLHTTP() {
        var xmlhttp = false;    
        try {
            xmlhttp = new XMLHttpRequest();
        }
        catch(e) {      
            try {           
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e) {
                try {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e1) {
                    xmlhttp = false;
                }
            }
        }
            
        return xmlhttp;
    }
    function get_item_list_by_warehouse(warehouse_id){    
  
        if (warehouse_id == "")  {
            $("#item_list").empty()
        }
        else{
            
            var strURL = "<?php echo base_url('report/report/get_item_list_by_warehouse/'); ?>"+warehouse_id;
            var req = getXMLHTTP();            
            if (req) {
                req.onreadystatechange = function() {
                    if (req.readyState == 4) {
                        if (req.status == 200) { 
                            console.log(req.responseText)
                            document.getElementById('item_list').innerHTML = req.responseText;
                        } else
                            alert("Have a problem!");
                    } else
                        $("#item_list").html('Loading...')
                    
                }
                req.open("GET", strURL, true);
                req.send(null);
            }

        }
    }
</script>