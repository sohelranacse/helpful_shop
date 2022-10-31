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
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("gui_pos")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('gui_pos') ?>"><?php echo display('pos_invoice') ?></a></li>
                <?php } ?>
                <?php if($this->permission1->method('terms_list','create')->access()){ ?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("terms_list")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('terms_list') ?>"><?php echo display('terms_list') ?></a></li>
                <?php } ?>
                <?php if($this->permission1->method('terms_add','create')->access()){ ?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("terms_add")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('terms_add') ?>"><?php echo display('terms_add') ?></a></li>
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
                <?php if($this->permission1->method('add_product_csv','create')->access()){ ?>
                <li class="<?php echo (($this->uri->segment(1)=="bulk_products")?"active":'') ?>">
                    <a href="<?php echo base_url('bulk_products') ?>">

                        <?php echo display('add_product_csv')?>

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
        <!-- Account part star -->
        <?php if($this->permission1->method('show_tree','read')->access() || $this->permission1->method('expenditure_statement','read')->access() || $this->permission1->method('bank_reconciliation_report','read')->access() || $this->permission1->method('receipt_payment','read')->access() || $this->permission1->method('fixedasset_schedule','read')->access() || $this->permission1->method('income_statement_form','read')->access() || $this->permission1->method('bank_reconciliation','read')->access() || $this->permission1->method('predefined_accounts','read')->access() ||  $this->permission1->method('subaccount_list','read')->access() || $this->permission1->method('financial_year','read')->access() || $this->permission1->method('opening_balance','create')->access() || $this->permission1->method('supplier_payment','create')->access()|| $this->permission1->method('customer_receive','create')->access() || $this->permission1->method('service_payment','create')->access() || $this->permission1->method('debit_voucher','read')->access() || $this->permission1->method('credit_voucher','read')->access() || $this->permission1->method('aprove_v','read')->access() || $this->permission1->method('contra_voucher','read')->access() || $this->permission1->method('balance_sheet','read')->access() || $this->permission1->method('journal_voucher','read')->access()|| $this->permission1->method('add_payment_method','create')->access() || $this->permission1->method('cash_adjustment','create')->access()|| $this->permission1->method('payment_method_list','read')->access()){?>
        <li class="treeview <?php
            if ($this->uri->segment('2') == ("voucher_report") ||  $this->uri->segment('1') == ("bank_reconciliation") ||  $this->uri->segment('1') == ("expenditure_statement") ||  $this->uri->segment('1') == ("expenditure_statement_report") || $this->uri->segment('1') == ("receipt_payment") || $this->uri->segment('1') == ("receipt_payment_report") || $this->uri->segment('1') == ("bank_reconciliation_report") ||  $this->uri->segment('1') == ("fixedasset_schedule") ||  $this->uri->segment('1') == ("fixed_assets_report") ||  $this->uri->segment('1') == ("income_statement_form") ||  $this->uri->segment('1') == ("income_statement") ||  $this->uri->segment('1') == ("aprove_v") || $this->uri->segment('1') == ("add_opening_balance") ||  $this->uri->segment('1') == ("edit_opening_balance") || $this->uri->segment('1') == ("edit_voucher") || $this->uri->segment('1') == ("create_debit_voucher") || $this->uri->segment('1') == ("predefined_accounts") || $this->uri->segment('1') == ("financial_year") || $this->uri->segment('1') == ("subaccount_list") || $this->uri->segment('1') == ("show_tree") || $this->uri->segment('1') == ("opening_balance") || $this->uri->segment('1') == ("cash_book") || $this->uri->segment('1') == ("cash_book_report") || $this->uri->segment('1') == ("day_book") || $this->uri->segment('1') == ("day_book_report") || $this->uri->segment('1') == ("bank_book") || $this->uri->segment('1') == ("bank_book_report") || $this->uri->segment('1') == ("general_ledger") || $this->uri->segment('1') == ("sub_ledger") || $this->uri->segment('1') == ("sub_ledger_report") || $this->uri->segment('1') == ("accounts_report_search") || $this->uri->segment('1') == ("trial_balance") || $this->uri->segment('1') == ("trial_balance_report") || $this->uri->segment('1') == ("profit_loss_report_search") || $this->uri->segment('1') == ("profit_loss_report") || $this->uri->segment('1') == ("cash_flow")|| $this->uri->segment('1') == ("inventory_ledger")|| $this->uri->segment('1') == ("coa_print") || $this->uri->segment('1') == ("cashflow_form") || $this->uri->segment('1') == ("coa") || $this->uri->segment('1') == ("supplier_payment") || $this->uri->segment('1') == ("supplier_payment_received") || $this->uri->segment('1') == ("customer_payment_receipt") || $this->uri->segment('1') == ("customer_receive")|| $this->uri->segment('1') == ("service_payment") || $this->uri->segment('1') == ("cash_adjustment") || $this->uri->segment('1') == ("debit_voucher") || $this->uri->segment('1') == ("credit_voucher") || $this->uri->segment('1') == ("create_credit_voucher") || $this->uri->segment('1') == ("create_contra_voucher") || $this->uri->segment('1') == ("create_journal_voucher") || $this->uri->segment('1') == ("contra_voucher") || $this->uri->segment('1') == ("journal_voucher") || $this->uri->segment('1') == ("voucher_list") || $this->uri->segment('1') == ("edit_voucher") || $this->uri->segment('1') == ("balance_sheet") || $this->uri->segment('1') == ("opening_balance") || $this->uri->segment('1') == ("add_payment_method") || $this->uri->segment('1') == ("payment_method_list")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="fa fa-money"></i><span><?php echo display('accounts') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('show_tree','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("show_tree")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('show_tree') ?>"><?php echo display('c_o_a'); ?></a></li>
                <?php }?>
                <?php if($this->permission1->method('subaccount_list','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("subaccount_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('subaccount_list') ?>"><?php echo display('subaccount_list'); ?></a></li>
                <?php }?>
                <?php if($this->permission1->method('predefined_accounts','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("predefined_accounts")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('predefined_accounts') ?>"><?php echo display('predefined_accounts'); ?></a></li>
                <?php }?>
                <?php if($this->permission1->method('financial_year','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("financial_year")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('financial_year') ?>"><?php echo display('financial_year'); ?></a></li>
                <?php }?>
                <?php if($this->permission1->method('opening_balance','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("opening_balance")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('opening_balance') ?>"><?php echo display('opening_balance'); ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('debit_voucher','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("debit_voucher")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('debit_voucher') ?>"><?php echo display('debit_voucher'); ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('credit_voucher','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("credit_voucher")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('credit_voucher') ?>"><?php echo display('credit_voucher'); ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('contra_voucher','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("contra_voucher")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('contra_voucher') ?>"><?php echo display('contra_voucher'); ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('journal_voucher','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("journal_voucher")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('journal_voucher') ?>"><?php echo display('journal_voucher'); ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('bank_reconciliation','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("bank_reconciliation")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('bank_reconciliation') ?>"><?php echo display('bank_reconciliation'); ?></a>
                </li>
                <?php }?>
                

                <?php if($this->permission1->method('add_payment_method','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("add_payment_method")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('add_payment_method') ?>"><?php echo display('add_payment_method'); ?></a>
                </li>
                <?php }?>

                <?php if($this->permission1->method('payment_method_list','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("payment_method_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('payment_method_list') ?>"><?php echo display('payment_method_list'); ?></a>
                </li>
                <?php }?>

                <?php if($this->permission1->method('supplier_payment','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("supplier_payment")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('supplier_payment') ?>"><?php echo display('supplier_payment'); ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('customer_receive','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("customer_receive")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('customer_receive') ?>"><?php echo display('customer_receive'); ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('service_payment','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("service_payment")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('service_payment') ?>"><?php echo display('service_payment'); ?></a>
                </li>
                <?php }?>

                <?php if($this->permission1->method('cash_adjustment','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("cash_adjustment")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('cash_adjustment') ?>"><?php echo display('cash_adjustment'); ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('aprove_v','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("aprove_v")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('aprove_v') ?>"><?php echo display('voucher_approval'); ?></a>
                </li>
                <?php }?>
                
                <?php if($this->permission1->method('ac_report','create')->access()){ ?>
                <li class="treeview <?php
                    if ($this->uri->segment('2') == ("voucher_report") || $this->uri->segment('1') == ("expenditure_statement") ||  $this->uri->segment('1') == ("expenditure_statement_report") || $this->uri->segment('1') == ("bank_reconciliation_report") || $this->uri->segment('1') == ("receipt_payment") || $this->uri->segment('1') == ("receipt_payment_report") || $this->uri->segment('1') == ("income_statement_form") ||  $this->uri->segment('1') == ("income_statement") || $this->uri->segment('1') == ("fixedasset_schedule") ||  $this->uri->segment('1') == ("fixed_assets_report") || $this->uri->segment('1') == ("cash_book") || $this->uri->segment('1') == ("cash_book_report") || $this->uri->segment('1') == ("bank_book") || $this->uri->segment('1') == ("bank_book_report") || $this->uri->segment('1') == ("day_book") || $this->uri->segment('1') == ("day_book_report") || $this->uri->segment('1') == ("general_ledger")  || $this->uri->segment('1') == ("sub_ledger") || $this->uri->segment('1') == ("sub_ledger_report") || $this->uri->segment('1') == ("accounts_report_search") || $this->uri->segment('1') == ("trial_balance") || $this->uri->segment('1') == ("trial_balance_report") || $this->uri->segment('1') == ("profit_loss_form") || $this->uri->segment('1') == ("profit_loss_report_search") || $this->uri->segment('1') == ("profit_loss_report") || $this->uri->segment('1') == ("cash_flow")|| $this->uri->segment('1') == ("inventory_ledger")|| $this->uri->segment('1') == ("coa_print") || $this->uri->segment('1') == ("cashflow_form") || $this->uri->segment('1') == ("balance_sheet")) {
                        echo "active";
                    } else {
                        echo " ";
                    }
                    ?>"><a href=""><?php echo display('report') ?>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <?php if($this->permission1->method('cash_book','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("cash_book")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('cash_book') ?>"><?php echo display('cash_book'); ?></a></li>
                        <?php }?>
                        
                        
                        <?php if($this->permission1->method('bank_book','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("bank_book")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('bank_book') ?>"><?php echo display('bank_book'); ?></a></li>
                        <?php } ?>
                        <?php if($this->permission1->method('day_book','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("day_book")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('day_book') ?>"><?php echo display('day_book'); ?></a></li>
                        <?php } ?>
                        <?php if($this->permission1->method('general_ledger','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("general_ledger") || $this->uri->segment('1') == ("general_ledger")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('general_ledger') ?>"><?php echo display('general_ledger'); ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('sub_ledger','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("sub_ledger") || $this->uri->segment('1') == ("sub_ledger")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('sub_ledger') ?>"><?php echo display('sub_ledger'); ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('trial_balance','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("trial_balance") || $this->uri->segment('1') == ("trial_balance")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('trial_balance') ?>"><?php echo display('trial_balance'); ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('income_statement_form','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("income_statement_form") || $this->uri->segment('1') == ("income_statement_form")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('income_statement_form') ?>"><?php echo display('income_statement_form'); ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('expenditure_statement','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("expenditure_statement") || $this->uri->segment('1') == ("expenditure_statement")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('expenditure_statement') ?>"><?php echo display('expenditure_statement'); ?></a>
                        </li>
                        <?php } ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("profit_loss_report") || $this->uri->segment('1') == ("profit_loss_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('profit_loss_report') ?>"><?php echo display('profit_loss_report'); ?></a>
                        </li>
                        <?php if($this->permission1->method('balance_sheet','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("balance_sheet")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('balance_sheet') ?>"><?php echo display('balance_sheet'); ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('fixedasset_schedule','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("fixedasset_schedule")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('fixedasset_schedule') ?>"><?php echo display('fixedasset_schedule'); ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('receipt_payment','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("receipt_payment")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('receipt_payment') ?>"><?php echo display('receipt_payment'); ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('bank_reconciliation_report','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("bank_reconciliation_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('bank_reconciliation_report') ?>"><?php echo display('bank_reconciliation_report'); ?></a>
                        </li>
                        <?php } ?>
                        
                        <?php if($this->permission1->method('coa_print','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("coa_print")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('coa_print') ?>"><?php echo display('coa_print'); ?></a></li>
                        <?php } ?>

                        
                    </ul>

                </li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <!--  Account End -->
        <!-- Report menu start -->
        <?php if($this->permission1->method('add_closing','create')->access() || $this->permission1->method('closing_report','read')->access() || $this->permission1->method('todays_report','read')->access() || $this->permission1->method('todays_customer_receipt','read')->access() || $this->permission1->method('todays_sales_report','read')->access() || $this->permission1->method('due_report','read')->access() || $this->permission1->method('todays_purchase_report','read')->access() || $this->permission1->method('purchase_report_category_wise','read')->access() || $this->permission1->method('product_sales_reports_date_wise','read')->access() || $this->permission1->method('sales_report_category_wise','read')->access() || $this->permission1->method('shipping_cost_report','read')->access()){?>
        <li class="treeview <?php
            if ($this->uri->segment('1') == ("closing_form") || $this->uri->segment('1') == ("closing_report") || $this->uri->segment('1') == ("closing_report_search") || $this->uri->segment('1') == ("todays_report")|| $this->uri->segment('1') == ("todays_customer_received") || $this->uri->segment('1') == ("todays_customerwise_received") || $this->uri->segment('1') == ("sales_report") || $this->uri->segment('1') == ("datewise_sales_report") || $this->uri->segment('1') == ("userwise_sales_report") || $this->uri->segment('1') == ("invoice_wise_due_report") || $this->uri->segment('1') == ("shipping_cost_report") || $this->uri->segment('1') == ("purchase_report") || $this->uri->segment('1') == ("purchase_report_categorywise")|| $this->uri->segment('1') == ("product_wise_sales_report") || $this->uri->segment('1') == ("category_sales_report") || $this->uri->segment('1') == ("sales_return") || $this->uri->segment('1') == ("supplier_returns") || $this->uri->segment('1') == ("tax_report") || $this->uri->segment('1') == ("profit_report")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="ti-book"></i><span><?php echo display('report') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('add_closing','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("closing_form")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('closing_form') ?>"><?php echo display('closing') ?></a></li>
                <?php } ?>
                <?php if($this->permission1->method('closing_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("closing_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('closing_report') ?>"><?php echo display('closing_report') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('todays_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("todays_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('todays_report') ?>"><?php echo display('todays_report') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('todays_customer_receipt','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("todays_customer_received")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('todays_customer_received') ?>"><?php echo display('todays_customer_receipt') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('todays_sales_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("sales_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('sales_report') ?>"><?php echo display('sales_report') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('user_wise_sales_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("userwise_sales_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('userwise_sales_report') ?>"><?php echo display('user_wise_sales_report') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('due_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("invoice_wise_due_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('invoice_wise_due_report') ?>"><?php echo display('due_report'); ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('shipping_cost_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("shipping_cost_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('shipping_cost_report') ?>"><?php echo display('shipping_cost_report'); ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('purchase_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("purchase_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('purchase_report') ?>"><?php echo display('purchase_report') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('purchase_report_category_wise','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("purchase_report_categorywise")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('purchase_report_categorywise') ?>"><?php echo display('purchase_report_category_wise') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('sales_report_product_wise','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("product_wise_sales_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('product_wise_sales_report') ?>"><?php echo display('sales_report_product_wise') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('sales_report_category_wise','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("category_sales_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('category_sales_report') ?>"><?php echo display('sales_report_category_wise') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('invoice_return','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("sales_return")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('sales_return') ?>"><?php echo display('invoice_return') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('supplier_return','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("supplier_returns")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('supplier_returns') ?>"><?php echo display('supplier_return') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('tax_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("tax_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('tax_report') ?>"><?php echo display('tax_report') ?></a></li>
                <?php } ?>
                <?php if($this->permission1->method('profit_report','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("profit_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('profit_report') ?>"><?php echo display('profit_report') ?></a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php }?>
        <!-- Report menu end -->
        <!-- human resource management menu start -->
        <?php if($this->permission1->method('add_designation','create')->access() || $this->permission1->method('manage_designation','read')->access()|| $this->permission1->method('employee_salary_generate','read')->access()|| $this->permission1->method('salary_advance_view','read')->access() || $this->permission1->method('add_employee','create')->access() || $this->permission1->method('manage_employee','read')->access() ||$this->permission1->method('add_person','create')->access() || $this->permission1->method('add_loan','create')->access() || $this->permission1->method('add_payment','create')->access() || $this->permission1->method('manage_person','read')->access()||$this->permission1->method('add_attendance','create')->access() || $this->permission1->method('manage_attendance','read')->access() || $this->permission1->method('attendance_report','read')->access() || $this->permission1->method('add_benefits','create')->access() || $this->permission1->method('manage_benefits','read')->access() || $this->permission1->method('add_salary_setup','create')->access() || $this->permission1->method('manage_salary_setup','read')->access() || $this->permission1->method('salary_generate','create')->access() || $this->permission1->method('manage_salary_generate','read')->access() || $this->permission1->method('salary_payment','create')->access() || $this->permission1->method('add_expense_item','create')->access() || $this->permission1->method('manage_expense_item','read')->access() || $this->permission1->method('add_expense','create')->access() || $this->permission1->method('manage_expense','read')->access() || $this->permission1->method('add_ofloan_person','create')->access() || $this->permission1->method('add_office_loan','create')->access() || $this->permission1->method('add_loan_payment','create')->access() || $this->permission1->method('manage_ofln_person','read')->access()){?>
        <!-- Supplier menu start -->
        <li class="treeview <?php
            if ($this->uri->segment('1') == ("designation_form") || $this->uri->segment('1') == ("designation_list") || $this->uri->segment('1') == ("salary_advance_view") || $this->uri->segment('1') == ("salary_pay_slip") || $this->uri->segment('1') == ("employee_salary_chart") || $this->uri->segment('1') == ("manage_salary_advance") || $this->uri->segment('1') == ("employee_salary_approval") || $this->uri->segment('1') == ("employee_form") || $this->uri->segment('1') == ("employee_salary_generate") || $this->uri->segment('1') == ("employee_list") || $this->uri->segment('1') == ("add_attendance") || $this->uri->segment('1') == ("attendance_list") || $this->uri->segment('1') == ("attendance_report") || $this->uri->segment('1') == ("add_beneficials") || $this->uri->segment('1') == ("manage_benefits") || $this->uri->segment('1') == ("salary_setup") || $this->uri->segment('1') == ("manage_salary_setup") || $this->uri->segment('1') == ("salary_generate") || $this->uri->segment('1') == ("manage_salary_generate") || $this->uri->segment('1') == ("salary_payment") || $this->uri->segment('1') == ("employee_salary_payment_view") || $this->uri->segment('1') == ("add_expense_item") || $this->uri->segment('1') == ("manage_expense_item") || $this->uri->segment('1') == ("add_expense") || $this->uri->segment('1') == ("manage_expense") || $this->uri->segment('1') == ("expense_statement") || $this->uri->segment('1') == ("add_officeloan_person") || $this->uri->segment('1') == ("add_office_loan") || $this->uri->segment('1') == ("add_office_loan_payment") || $this->uri->segment('1') == ("manage_office_loan_person") || $this->uri->segment('1') == ("office_loan_person_ledger") || $this->uri->segment('1') == ("office_loan_person_ledgerdata") || $this->uri->segment('1') == ("edit_office_loan_person") || $this->uri->segment('1') == ("add_person") || $this->uri->segment('1') == ("add_loan") || $this->uri->segment('1') == ("add_payment") || $this->uri->segment('1') == ("manage_person") || $this->uri->segment('1') == ("personal_loan_edit") || $this->uri->segment('1') == ("person_ledger") || $this->uri->segment('1') == ("personal_loan_summary") || $this->uri->segment('1') == ("payslip") || $this->uri->segment('1') == ("edit_attendance")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="fa fa-users"></i><span><?php echo display('hrm_management') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('add_designation','create')->access() || $this->permission1->method('manage_designation','read')->access()  || $this->permission1->method('add_employee','create')->access() || $this->permission1->method('manage_employee','read')->access()){?>
                <!-- Supplier menu start -->
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("designation_form") || $this->uri->segment('1') == ("designation_list") ||  $this->uri->segment('1') == ("employee_form") || $this->uri->segment('1') == ("employee_list")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
                    <a href="#">
                        <i class="fa fa-users"></i><span><?php echo display('hrm') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <?php if($this->permission1->method('add_designation','create')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("designation_form")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('designation_form') ?>"><?php echo display('add_designation') ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('manage_designation','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("designation_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('designation_list') ?>"><?php echo display('manage_designation') ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('add_employee','create')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("employee_form")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('employee_form') ?>"><?php echo display('add_employee') ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('manage_employee','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("employee_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('employee_list') ?>"><?php echo display('manage_employee') ?></a>
                        </li>
                        <?php } ?>

                    </ul>
                </li>
                <?php } ?>


                <!-- ================== Attendance menu start ================= -->
                <?php if($this->permission1->method('add_attendance','create')->access() || $this->permission1->method('manage_attendance','read')->access() || $this->permission1->method('attendance_report','read')->access()){?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_attendance") || $this->uri->segment('1') == ("attendance_list") || $this->uri->segment('1') == ("attendance_report") || $this->uri->segment('1') == ("edit_attendance")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
                    <a href="#">
                        <i class="fa fa-clock-o"></i><span><?php echo display('attendance') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <?php if($this->permission1->method('add_attendance','create')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("add_attendance")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('add_attendance') ?>"><?php echo display('add_attendance') ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('manage_attendance','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("attendance_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('attendance_list') ?>"><?php echo display('manage_attendance') ?></a>
                        </li>
                        <?php } ?>
                        <?php if($this->permission1->method('attendance_report','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("attendance_report")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('attendance_report') ?>"><?php echo display('attendance_report') ?></a>
                        </li>
                        <?php } ?>
                    </ul>
                </li>
                <?php } ?>
                <!-- ====================== Attendance menu end ================== -->

                <!-- ========================== Payroll menu start =================== -->
                <?php if($this->permission1->method('add_benefits','create')->access() || $this->permission1->method('manage_benefits','read')->access() || $this->permission1->method('employee_salary_generate','read')->access() || $this->permission1->method('employee_salary_payment_view','read')->access() || $this->permission1->method('salary_advance_view','read')->access() || $this->permission1->method('add_salary_setup','create')->access() || $this->permission1->method('manage_salary_setup','read')->access() || $this->permission1->method('salary_generate','create')->access() || $this->permission1->method('manage_salary_generate','read')->access() || $this->permission1->method('salary_payment','create')->access()){?>
                <!-- payroll menu start -->
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_beneficials") || $this->uri->segment('1') == ("salary_pay_slip") || $this->uri->segment('1') == ("manage_benefits") || $this->uri->segment('1') == ("employee_salary_approval") || $this->uri->segment('1') == ("employee_salary_chart") || $this->uri->segment('1') == ("employee_salary_generate") || $this->uri->segment('1') == ("employee_salary_payment_view") || $this->uri->segment('1') == ("salary_setup") || $this->uri->segment('1') == ("salary_advance_view") || $this->uri->segment('1') == ("manage_salary_advance") || $this->uri->segment('1') == ("manage_salary_setup") || $this->uri->segment('1') == ("salary_generate") || $this->uri->segment('1') == ("manage_salary_generate") || $this->uri->segment('1') == ("salary_payment") || $this->uri->segment('1') == ("payslip")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
                    <a href="#">
                        <i class="fa fa-paypal"></i><span><?php echo display('payroll') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <?php if($this->permission1->method('salary_advance_view','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("salary_advance_view")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('salary_advance_view') ?>"> <?php echo display('salary_advance_view') ?></a></li>
                    <?php }?>
                        <?php if($this->permission1->method('employee_salary_generate','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("employee_salary_generate")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('employee_salary_generate') ?>"> <?php echo display('employee_salary_generate') ?></a></li>
                    <?php }?>

                       
                        <?php if($this->permission1->method('employee_salary_payment_view','read')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("employee_salary_payment_view")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('employee_salary_payment_view') ?>"> <?php echo display('employee_salary_payment_view') ?></a></li>
                    <?php }?>
                        

                    </ul>
                </li>
                <?php } ?>
                <!-- =============================== Payroll menu end =================== -->
                
                <!--  Personal loan start -->
                
                <!-- loan end -->
            </ul>
        </li>
        <?php } ?>
        <!-- Human resource management menu end -->

        <!-- Bank menu start -->
        
        <!-- Bank menu end -->
        <!-- service menu start -->
        <?php if($this->permission1->method('create_service','create')->access() || $this->permission1->method('manage_service','read')->access() || $this->permission1->method('service_invoice','create')->access() || $this->permission1->method('manage_service_invoice','read')->access()){?>

        <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_service") || $this->uri->segment('1') == ("manage_service") || $this->uri->segment('1') == ("edit_service") || $this->uri->segment('1') == ("add_service_invoice") || $this->uri->segment('1') == ("service_details") || $this->uri->segment('1') == ("manage_service_invoice") || $this->uri->segment('1') == ("edit_service_invoice")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="fa fa-asl-interpreting"></i><span><?php echo display('service') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('create_service','create')->access()){ ?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_service")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('add_service') ?>"><?php echo display('add_service') ?></a></li>
                <?php } ?>
                <?php if($this->permission1->method('manage_service','read')->access()){ ?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("manage_service")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('manage_service') ?>"><?php echo display('manage_service') ?></a></li>
                <?php } ?>
                <?php if($this->permission1->method('service_invoice','create')->access()){ ?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_service_invoice")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('add_service_invoice') ?>"><?php echo display('service_invoice') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('manage_service_invoice','read')->access()){ ?>
                <li class="treeview <?php
            if ($this->uri->segment('1') == ("manage_service_invoice")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>"><a href="<?php echo base_url('manage_service_invoice') ?>"><?php echo display('manage_service_invoice') ?></a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>


        <!-- Comission end -->
        <!-- Quotation Menu Start -->
        <?php if($this->permission1->method('add_quotation','create')->access() || $this->permission1->method('manage_quotation','read')->access()){?>
        <li class="treeview <?php
            if ($this->uri->segment('1') == ("add_quotation") || $this->uri->segment('1') == ("manage_quotation")|| $this->uri->segment('1') == ("quotation_to_sales")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="fa fa-book"></i><span><?php echo display('quotation') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('add_quotation','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("add_quotation")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('add_quotation') ?>"><?php echo display('add_quotation') ?></a>
                </li>
                <?php }?>
                <?php if($this->permission1->method('manage_quotation','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("manage_quotation")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('manage_quotation') ?>"><?php echo display('manage_quotation') ?></a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php }?>
        <!-- quotation Menu end -->
        <!-- Tax menu start -->
        <?php if($this->permission1->method('add_incometax','create')->access() || $this->permission1->method('manage_income_tax','read')->access()|| $this->permission1->method('tax_settings','create')->access() || $this->permission1->method('tax_report','read')->access() || $this->permission1->method('invoice_wise_tax_report','read')->access() || $this->permission1->method('tax_settings','read')->access() || $this->permission1->method('vat_tax_setting','read')->access()){?>
        <li class="treeview <?php
            if ($this->uri->segment('1') == ("invoice_wise_tax_report") || $this->uri->segment('1') == ("tax_setting") || $this->uri->segment('1') == ("income_tax") || $this->uri->segment('1') == ("manage_income_tax") || $this->uri->segment('1') == ("tax_reports") || $this->uri->segment('1') == ("update_tax_setting") || $this->uri->segment('1') == ("vat_tax_setting")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="fa fa-money"></i><span><?php echo display('tax') ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('tax_settings','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("vat_tax_setting")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('vat_tax_setting') ?>"><?php echo display('vat_tax_setting') ?></a></li>
                <?php } ?>

                <?php if($this->permission1->method('tax_settings','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("update_tax_setting")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('tax_setting') ?>"><?php echo display('tax_settings') ?></a></li>
                <?php } ?>

                
            </ul>



        </li>
        <?php } ?>

        <!-- return menu start -->
        <?php if($this->permission1->method('add_return','create')->access() || $this->permission1->method('return_list','read')->access() || $this->permission1->method('supplier_return_list','read')->access() || $this->permission1->method('wastage_return_list','read')->access()){?>
        <li class="treeview <?php
            if ($this->uri->segment('1') == ("return_form") || $this->uri->segment('1') == ("invoice_return") || $this->uri->segment('1') == ("invoice_return_details") || $this->uri->segment('1') == ("supplier_return") || $this->uri->segment('1') == ("supplier_return_details") || $this->uri->segment('1') == ("invoice_return_list") || $this->uri->segment('1') == ("invoice_return_search") || $this->uri->segment('1') == ("supplier_return_list") || $this->uri->segment('1') == ("supplier_return_search") || $this->uri->segment('1') == ("wastage_return_list")) {
                echo "active";
            } else {
                echo " ";
            }
            ?>">
            <a href="#">
                <i class="fa fa-retweet" aria-hidden="true"></i><span><?php echo display('return'); ?></span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <?php if($this->permission1->method('add_return','create')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("return_form")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('return_form') ?>"><?php echo display('return'); ?></a></li>
                <?php } ?>
                <?php if($this->permission1->method('return_list','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("invoice_return_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('invoice_return_list') ?>"><?php echo display('stock_return_list') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('supplier_return_list','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("supplier_return_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('supplier_return_list') ?>"><?php echo display('supplier_return_list') ?></a>
                </li>
                <?php } ?>
                <?php if($this->permission1->method('wastage_return_list','read')->access()){ ?>
                <li class="treeview <?php if ($this->uri->segment('1') == ("wastage_return_list")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a
                        href="<?php echo base_url('wastage_return_list') ?>"><?php echo display('wastage_return_list') ?></a>
                </li>
                <?php } ?>

            </ul>
        </li>

        <?php } ?>

        <!-- return menu end -->


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
                        <?php if($this->permission1->method('add_currency','create')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("currency_form")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('currency_form') ?>"><?php echo display('currency') ?> </a></li>
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
                        <?php if($this->permission1->method('print_setting','create')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("print_setting")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('print_setting') ?>"><?php echo display('print_setting') ?> </a>
                        </li>
                        <?php }?>
                        <?php if($this->permission1->method('mail_setting','create')->access()){?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("mail_setting")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('mail_setting') ?>"><?php echo display('mail_setting') ?> </a>
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

                        <?php if($this->permission1->method('restore','create')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("restore")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('restore') ?>"><?php echo display('restore') ?></a></li>
                        <?php }?>
                        <?php if($this->permission1->method('sql_import','create')->access()){ ?>
                        <li class="treeview <?php if ($this->uri->segment('1') == ("db_import")){
                        echo "active";
                    } else {
                        echo " ";
                    }?>"><a href="<?php echo base_url('db_import') ?>"><?php echo display('import') ?></a></li>
                        <?php }?>

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