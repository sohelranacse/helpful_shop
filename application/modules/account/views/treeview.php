<link rel="stylesheet" href="<?php echo base_url() ?>assets/dist/themes/default/style.min.css" />
<link rel="stylesheet" href="<?php echo base_url() ?>application/modules/account/assets/css/style.css" />

<div class="row">
  <div class="col-sm-12">
    <div class="panel panel-bd lobidrag">
        <div class="panel-heading">
            <div class="panel-title">
            <?php echo $title;
            ?>
            </div>
        </div>

        <div class="panel-body">                       
            <div class="row">
                <div class="col-md-6">
                    
                    <div id="jstree1">
                        <ul>
                          <?php 
                          
                          $visit=array();
                            for ($i = 0; $i < count($userList); $i++)
                            {
                                $visit[$i] = false;
                            }
                            $this->accounts_model->dfs("COA","0",$userList,$visit,0);?>
                        </ul>
                    </div>
                </div> 

                <div class="col-md-6" id="newform"></div>
                
            </div>
        </div> 
     </div>
    </div> 
 <input type="hidden" id="base_url" value="<?php echo base_url();?>" name="base_url">
</div>
 <script src="<?php echo base_url() ?>assets/dist/jstree.min.js" ></script>
<script src="<?php echo base_url('assets/dist/account.js') ?>" type="text/javascript"></script>
