<div class="row">
    <div class="col-xm-12 col-md-12">
        <div class="panel">
            <div class="panel-body">
                

                    <div class="panel-body">
                        <?php echo form_open('invoice/invoice/save_delivery_note/'.$invoice_no,)?>


                        <div class="form-group row">
                            <label for="note"  class="col-sm-2 text-right col-form-label"><?php echo display('note')?> :</label>
                            <div class="col-sm-8">

                                <textarea name="note" class="form-control" rows="5"><?php echo $delivery_note?></textarea>
                                
                            </div>
                        </div>


                        <div class="form-group row">

                            <div class="col-sm-10 text-right">


                                <button type="submit" class="btn btn-success ">save </button>



                            </div>
                        </div>


                        <?php echo form_close();?>
                    </div>
                

            </div>
        </div>
    </div>
</div>
