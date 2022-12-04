<div class="sidebar">
    <!-- Sidebar user panel -->

    <div class="user-panel text-center">
        <div class="image">
            <?php $image = $this->session->userdata('image') ?>
            <img src="<?php echo base_url((!empty($image)?$image:'assets/img/icons/default.jpg')) ?>" class="img-circle"
                alt="User Image">
        </div>
        <div class="info">
            <p><?php echo $this->session->userdata('fullname') ?></p>
            <a href="#"><i class="fa fa-circle text-success"></i>
                <?php echo $this->session->userdata('user_level') ?></a>
        </div>
    </div>




    <!-- sidebar menu -->
    <ul class="sidebar-menu">

        <li class="treeview <?php echo (($this->uri->segment(1)=="home")?"active":null) ?>">
            <a href="<?php echo base_url('home') ?>"> <i class="ti-dashboard"></i>
                <span><?php echo display('dashboard')?></span>
            </a>
        </li>

        <!-- Invoice menu start -->
        <?php if($this->permission1->method('new_invoice','create')->access() || $this->permission1->method('manage_invoice','read')->access() || $this->permission1->method('pos_invoice','create')->access() || $this->permission1->method('gui_pos','create')->access() || $this->permission1->method('terms_list','read')->access()  || $this->permission1->method('terms_add','read')->access()){?>
        <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_invoice") || $this->uri->segment('1') == ("invoice_list") || $this->uri->segment('1') == ("pos_invoice") || $this->uri->segment('1') == ("gui_pos") || $this->uri->segment('1') == ("invoice_details") || $this->uri->segment('1') == ("invoice_pad_print") || $this->uri->segment('1') == ("pos_print") || $this->uri->segment('1') == ("invoice_edit") || $this->uri->segment('1') == ("terms_list")  || $this->uri->segment('1') == ("terms_add") ) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="fa fa-balance-scale"></i><span><?php echo display('invoice') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('new_invoice','create')->access()){ ?>
                <li class="treeview <?php
                    if ($this->uri->segment('1') == ("add_invoice")) {
                        echo "active";
                    } else {
                        echo " ";
                    }
                    ?>"><a href="<?php echo base_url('add_invoice') ?>"><?php echo display('new_invoice') ?></a></li>
                        <?php } ?>
                        <?php if($this->permission1->method('manage_invoice','read')->access()){ ?>
                        <li class="treeview <?php
                    if ($this->uri->segment('1') == ("invoice_list")) {
                        echo "active";
                    } else {
                        echo " ";
                    }
                    ?>"><a href="<?php echo base_url('invoice_list') ?>"><?php echo display('manage_invoice') ?></a></li>
                        <?php } ?>
                        <?php if($this->permission1->method('pos_invoice','create')->access()){ ?>
                        <li style="display: none;" class="treeview <?php
                    if ($this->uri->segment('1') == ("gui_pos")) {
                        echo "active";
                    } else {
                        echo " ";
                    }
                    ?>"><a href="<?php echo base_url('gui_pos') ?>"><?php echo display('pos_invoice') ?></a>
                </li>
                <?php } ?>

            </ul>
        </li>
        <?php } ?>

        <?php if($this->permission1->method('add_customer','create')->access() || $this->permission1->method('manage_customer','read')->access()|| $this->permission1->method('credit_customer','read')->access() || $this->permission1->method('paid_customer','read')->access() || $this->permission1->method('customer_ledger','read')->access() || $this->permission1->method('customer_advance','create')->access()){?>
        <li
            class="treeview <?php echo (($this->uri->segment(1)=="add_customer" || $this->uri->segment(1)=="customer_list" || $this->uri->segment(1)=="credit_customer" || $this->uri->segment(1)=="paid_customer" || $this->uri->segment(1)=="edit_customer" || $this->uri->segment(1)=="customer_ledgerdata" || $this->uri->segment(1)=="customer_ledger" || $this->uri->segment(1)=="advance_receipt" || $this->uri->segment(1)=="customer_advance")?"active":'') ?>">

            <a href="javascript:void(0)">

                <i class="metismenu-icon pe-7s-user"></i> <span><?php echo display('customer') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>

            <ul class="treeview-menu">

                <?php if($this->permission1->method('add_customer','create')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="add_customer")?"active":'') ?>">
                    <a href="<?php echo base_url('add_customer') ?>"
                        class="<?php echo (($this->uri->segment(1)=="add_customer")?"active":null) ?>">
                        <?php echo display('add_customer')?>

                    </a>

                </li>
                <?php }?>
                <?php if($this->permission1->method('manage_customer','read')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="customer_list")?"active":'') ?>">
                    <a href="<?php echo base_url('customer_list') ?>">

                        <?php echo display('customer_list')?>

                    </a>

                </li>
                <?php }?>
                
               
            </ul>

        </li>
        <?php }?>
        <!-- supplier menu part -->
        <?php if($this->permission1->method('add_supplier','create')->access() || $this->permission1->method('manage_supplier','read')->access() || $this->permission1->method('supplier_ledger','read')->access() || $this->permission1->method('supplier_advance','create')->access()){?>
        <li
            class="treeview <?php echo (($this->uri->segment(1)=="add_supplier" || $this->uri->segment(1)=="supplier_list" || $this->uri->segment(1)=="edit_supplier" || $this->uri->segment(1)=="supplier_ledgerdata" || $this->uri->segment(1)=="supplier_ledger" || $this->uri->segment(1)=="supplier_advance")?"active":'') ?>">

            <a href="javascript:void(0)">

                <i class="metismenu-icon fa fa-user-secret"></i> <span><?php echo display('supplier') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>

            <ul class="treeview-menu">

                <?php if($this->permission1->method('add_supplier','create')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="add_supplier")?"active":'') ?>">
                    <a href="<?php echo base_url('add_supplier') ?>"
                        class="<?php echo (($this->uri->segment(1)=="add_supplier")?"active":null) ?>">
                        <?php echo display('add_supplier')?>

                    </a>

                </li>
                <?php }?>
                <?php if($this->permission1->method('manage_supplier','read')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="supplier_list")?"active":'') ?>">
                    <a href="<?php echo base_url('supplier_list') ?>">

                        <?php echo display('supplier_list')?>

                    </a>

                </li>
                <?php }?>

                
                
            </ul>

        </li>
        <?php }?>

        <!-- product menu part -->
        <?php if($this->permission1->method('create_product','create')->access() || $this->permission1->method('add_product_csv','create')->access() || $this->permission1->method('manage_product','read')->access() || $this->permission1->method('create_category','create')->access() || $this->permission1->method('manage_category','read')->access() || $this->permission1->method('add_unit','create')->access() || $this->permission1->method('manage_unit','read')->access()){?>
        <li
            class="treeview <?php echo (($this->uri->segment(1)=="category_form" || $this->uri->segment(1)=="category_list" || $this->uri->segment(1)=="unit_form" || $this->uri->segment(1)=="unit_list" || $this->uri->segment(1)=="product_form" || $this->uri->segment(1)=="product_list" || $this->uri->segment(1)=="barcode" || $this->uri->segment(1)=="qrcode" || $this->uri->segment(1)=="bulk_products" || $this->uri->segment(1)=="product_details" || $this->uri->segment(1)=="writer" || $this->uri->segment(1)=="publication" ) ? "active":'') ?>">

            <a href="javascript:void(0)">

                <i class="metismenu-icon fa fa-cubes"></i> <span><?php echo display('product') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>

            <ul class="treeview-menu">

                <?php if($this->permission1->method('category','create')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="category_form")?"active":'') ?>">
                    <a href="<?php echo base_url('category_form') ?>"> <?php echo display('add_category')?>

                    </a>

                </li>
                <?php }?>
                <?php if($this->permission1->method('manage_category','read')->access()|| $this->permission1->method('manage_category','update')->access()|| $this->permission1->method('manage_category','delete')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="category_list")?"active":'') ?>">
                    <a href="<?php echo base_url('category_list') ?>">

                        <?php echo display('category_list')?>

                    </a>

                </li>
                <?php }?>
                <?php if($this->permission1->method('writer','read')->access()|| $this->permission1->method('writer','update')->access()|| $this->permission1->method('writer','delete')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="writer")?"active":'') ?>">
                    <a href="<?php echo base_url('writer') ?>">

                        <?php echo display('writer')?>

                    </a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('publication','read')->access()|| $this->permission1->method('publication','update')->access()|| $this->permission1->method('manage_category','delete')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="publication")?"active":'') ?>">
                    <a href="<?php echo base_url('publication') ?>">

                        <?php echo display('publication')?>

                    </a>
                </li>
                <?php }?>

                <?php if($this->permission1->method('unit','create')->access() || $this->permission1->method('unit','update')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="unit_form")?"active":'') ?>">
                    <a href="<?php echo base_url('unit_form') ?>"> <?php echo display('add_unit')?>

                    </a>

                </li>
                <?php }?>
                <?php if($this->permission1->method('manage_unit','create')->access() || $this->permission1->method('manage_unit','read')->access() || $this->permission1->method('manage_unit','delete')->access() || $this->permission1->method('manage_unit','update')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="unit_list")?"active":'') ?>">
                    <a href="<?php echo base_url('unit_list') ?>">

                        <?php echo display('unit_list')?>

                    </a>

                </li>
                <?php }?>
                <?php if($this->permission1->method('create_product','create')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="product_form")?"active":'') ?>">
                    <a href="<?php echo base_url('product_form') ?>">

                        <?php echo display('add_product')?>

                    </a>

                </li>
                <?php }?>
                <?php if($this->permission1->method('manage_product','read')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="product_list")?"active":'') ?>">
                    <a href="<?php echo base_url('product_list') ?>">

                        <?php echo display('manage_product')?>

                    </a>

                </li>
                <?php }?>

            </ul>

        </li>
        <?php }?>



        <!-- Purchase menu start -->
        <?php if($this->permission1->method('add_purchase','create')->access() || $this->permission1->method('manage_purchase','read')->access()){?>
        <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_purchase") || $this->uri->segment('1') == ("purchase_edit") || $this->uri->segment('1') == ("purchase_list") || $this->uri->segment('1') == ("purchase_details")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="ti-shopping-cart"></i><span><?php echo display('purchase') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('add_purchase','create')->access()){ ?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_purchase")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('add_purchase') ?>"><?php echo display('add_purchase') ?></a></li>
                <?php } ?>
                <?php if($this->permission1->method('manage_purchase','read')->access()){ ?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("purchase_list")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('purchase_list') ?>"><?php echo display('manage_purchase') ?></a></li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <!-- Purchase menu end -->



        <!-- Stock menu start -->
        <?php if($this->permission1->method('stock','read')->access() || $this->permission1->method('stock_report','read')->access() || $this->permission1->method('opening_stock','read')->access()){?>
        <li class="treeview <?php
        if ($this->uri->segment('1') == ("stock") || $this->uri->segment('1') == ("opening_stock")) {
            echo "active";
        } else {
            echo " ";
        }
        ?>">
            <a href="#">
                <i class="ti-bar-chart"></i><span><?php echo display('stock') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('stock_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("stock")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('stock') ?>"><?php echo display('stock_report') ?></a></]li>
                <?php }?>

                <?php if($this->permission1->method('opening_stock','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("opening_stock")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('opening_stock') ?>"><?php echo display('opening_stock') ?></a></]li>
                <?php }?>

            </ul>
        </li>
        <?php }?>
        <!-- Stock menu end -->


        <!-- Software Settings menu start -->
        <?php if($this->permission1->method('manage_company','read')->access() ||$this->permission1->method('manage_company','create')->access() || $this->permission1->method('add_user','create')->access() || $this->permission1->method('add_user','read')->access() || $this->permission1->method('add_language','create')->access() || $this->permission1->method('add_currency','create')->access() || $this->permission1->method('soft_setting','create')->access() || $this->permission1->method('add_role','create')->access() ||$this->permission1->method('role_list','read')->access() || $this->permission1->method('user_assign','create')->access() || $this->permission1->method('sms_configure','create')->access()){?>
        <li class="treeview <?php
            if ($this->uri->segment('1') == ("company_list") || $this->uri->segment('1') == ("edit_company") || $this->uri->segment('1') == ("add_user") || $this->uri->segment('1') == ("user_list") || $this->uri->segment('1') == ("language") || $this->uri->segment('1') == ("currency_form") || $this->uri->segment('1') == ("currency_list") || $this->uri->segment('1') == ("settings")|| $this->uri->segment('1') == ("mail_setting") || $this->uri->segment('1') == ("app_setting") || $this->uri->segment('1') == ("add_role") || $this->uri->segment('1') == ("role_list") || $this->uri->segment('1') == ("edit_role") || $this->uri->segment('1') == ("assign_role") || $this->uri->segment('1') == ("sms_setting") || $this->uri->segment('1') == ("restore") || $this->uri->segment('1') == ("db_import") || $this->uri->segment('1') == ("editPhrase") || $this->uri->segment('1') == ("phrases") || $this->uri->segment('1') == ("warehouse")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="ti-settings"></i><span><?php echo display('settings') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <!-- Software Settings menu start -->
                <?php if($this->permission1->method('manage_company','read')->access() ||$this->permission1->method('manage_company','create')->access() || $this->permission1->method('add_user','create')->access() || $this->permission1->method('manage_user','read')->access() || $this->permission1->method('add_language','create')->access() || $this->permission1->method('add_currency','create')->access() || $this->permission1->method('soft_setting','create')->access() || $this->permission1->method('back_up','create')->access() || $this->permission1->method('back_up','read')->access() || $this->permission1->method('restore','create')->access() || $this->permission1->method('sql_import','create')->access()){?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("company_list") || $this->uri->segment('1') == ("edit_company") || $this->uri->segment('1') == ("add_user") || $this->uri->segment('1') == ("user_list") || $this->uri->segment('1') == ("language") || $this->uri->segment('1') == ("currency_form") || $this->uri->segment('1') == ("currency_list") || $this->uri->segment('1') == ("settings")|| $this->uri->segment('1') == ("mail_setting") || $this->uri->segment('1') == ("app_setting") || $this->uri->segment('1') == ("editPhrase") || $this->uri->segment('1') == ("phrases")|| $this->uri->segment('1') == ("warehouse")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
                    <a href="#">
                        <i class="ti-settings"></i> <span><?php echo display('web_settings') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <?php if($this->permission1->method('manage_company','read')->access() || $this->permission1->method('manage_company','update')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("company_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('company_list') ?>"><?php echo display('manage_company') ?></a>
                        </li>
                        <?php }?>
                        <?php if($this->permission1->method('warehouse','read')->access() || $this->permission1->method('warehouse','update')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("warehouse")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('warehouse') ?>"><?php echo display('warehouse') ?></a>
                        </li>
                        <?php }?>
                        <?php if($this->permission1->method('add_user','create')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("add_user")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('add_user') ?>"><?php echo display('add_user') ?></a></li>
                        <?php }?>
                        <?php if($this->permission1->method('manage_user','read')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("user_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('user_list') ?>"><?php echo display('manage_users') ?> </a></li>
                        <?php }?>
                        <?php if($this->permission1->method('add_language','create')->access() || $this->permission1->method('add_language','update')->access()){?>
                        <li
                            class="<?php echo (($this->uri->segment(1)=="language" || $this->uri->segment('1') == ("editPhrase") || $this->uri->segment('1') == ("phrases"))?"active":'') ?>">
                            <a href="<?php echo base_url('language') ?>">

                                <?php echo display('language')?>

                            </a>

                        </li>
                        <?php }?>
                        <?php if($this->permission1->method('soft_setting','create')->access() || $this->permission1->method('soft_setting','update')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("settings")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>">
                            <a href="<?php echo base_url('settings') ?>"
                                class="<?php echo (($this->uri->segment(1)=="settings")?"active":null) ?>">

                                <?php echo display('settings')?>

                            </a>

                        </li>
                        <?php }?>
                        
                    </ul>
                </li>
                <?php }?>
                <!-- Role permission start -->
                <?php if($this->permission1->method('add_role','create')->access() ||$this->permission1->method('role_list','read')->access() || $this->permission1->method('edit_role','create')->access() || $this->permission1->method('assign_role','create')->access()){?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_role") || $this->uri->segment('1') == ("role_list") || $this->uri->segment('1') == ("edit_role") || $this->uri->segment('1') == ("assign_role")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
                    <a href="#">
                        <i class="ti-key"></i> <span><?php echo display('role_permission') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">

                        <?php if($this->permission1->method('add_role','create')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("add_role")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('add_role')?>"><?php echo display('add_role') ?></a></li>
                        <?php }?>
                        <?php if($this->permission1->method('role_list','read')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("role_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('role_list')?>"><?php echo display('role_list') ?></a></li>
                        <?php }?>
                        <?php if($this->permission1->method('user_assign','create')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("assign_role")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('assign_role')?>"><?php echo display('user_assign_role')?></a>
                        </li>
                        <?php }?>


                    </ul>
                </li>
                <?php }?>
                <!-- Role permission End -->

                <!-- sms menu end -->
                <!-- Synchronizer setting start -->
                <?php if($this->permission1->method('restore','create')->access() || $this->permission1->method('sql_import','create')->access() || $this->permission1->method('sql_import','create')->access()){?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("restore") || $this->uri->segment('1') == ("db_import")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
                    <a href="#">
                        <i class="ti-reload"></i> <span><?php echo display('data_synchronizer') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">

                        <li class="treeview <?php if ($this->uri->segment('2') == ("backup_create")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('dashboard/backup_restore/download_backup') ?>"><?php echo display('backup') ?></a>
                        </li>
                    </ul>
                </li>
                <?php }?>
                <!-- Synchronizer setting end -->
            </ul>
        </li>
        <?php }?>
        <!-- Software Settings menu end -->
        <!-- custom menu start-->

        <?php  
        $path = 'application/modules/';
        $map  = directory_map($path);
        $HmvcMenu   = array();
        if (is_array($map) && sizeof($map) > 0)
        foreach ($map as $key => $value) {
            $menu = str_replace("\\", '/', $path.$key.'config/menu.php'); 
            if (file_exists($menu)) {

                if (file_exists(APPPATH.'modules/'.$key.'/assets/data/env')){
                   @include($menu);
                }
               
            }  
        }  
        ?>

        <!-- custom menu end -->



    </ul>
</div> <!-- /.sidebar -->