<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 #------------------------------------    
    # Author: Bdtask Ltd
    # Author link: https://www.bdtask.com/
    # Dynamic style php file
    # Developed by :Isahaq
    #------------------------------------    

class Returns extends MX_Controller {

    public function __construct()
    {
        parent::__construct();
  
        $this->load->model(array(
            'return_model','account/Accounts_model')); 
        if (! $this->session->userdata('isLogIn'))
            redirect('login');
          
    }
   

   public function bdtask_return_form(){
        $data['title']    = display('return');
        $data['module']   = "return";  
        $data['page']     = "form";  
        echo Modules::run('template/layout', $data); 
   }


    public function bdtask_invoice_return_form() {

        $invoice_id = trim($this->input->post('invoice_id',TRUE));
        $invid = $this->db->select('invoice_id')->from('invoice')->where('invoice', $invoice_id)->get()->row();
        $query = $this->db->select('invoice_id')->from('invoice')->where('invoice', $invoice_id)->get();
        $query2 = $this->db->select('invoice_id')->from('product_return')->where('invoice_id', $invoice_id)->get();

        if ($query->num_rows() == 0) {
            $this->session->set_flashdata(array('exception' => display('please_input_correct_invoice_no')));
            redirect('return_form');
        }

        if ($query2->num_rows() > 0) {
            $this->session->set_flashdata(array('exception' => display('already_returned')));
            redirect('return_form');
        }

        $invoice_detail = $this->return_model->invoice_return_data($invoice_id);
        
        $i = 0;
        if (!empty($invoice_detail)) {
            foreach ($invoice_detail as $k => $v) {
                $i++;
                $invoice_detail[$k]['sl'] = $i;
            }
        }

        $data = array(
            'title'         => display('invoice_return'),
            'invoice_id'    => $invoice_detail[0]['invoice'],
            'dbinv_id'      => $invoice_detail[0]['dbinv_id'],
            'customer_id'   => $invoice_detail[0]['customer_id'],
            'customer_name' => $invoice_detail[0]['customer_name'],
            'date'          => $invoice_detail[0]['date'],
            'total_amount'  => $invoice_detail[0]['total_amount'],
            'paid_amount'   => $invoice_detail[0]['paid_amount'],
            'due_amount'    => $invoice_detail[0]['due_amount'],
            'total_discount'=> $invoice_detail[0]['total_discount'],
            'tax'           => $invoice_detail[0]['tax'],
            'total_tax'     => $invoice_detail[0]['taxs'],
            'invoice_all_data' => $invoice_detail,
        );
        $data['all_pmethod'] = $this->return_model->pmethod_dropdown_new();
        $data['module']      = "return";  
        $vatortax            = $this->db->select('*')->from('vat_tax_setting')->get()->row();
        
        if($vatortax->fixed_tax == 1){
            
            $data['page']    = "invoice_return_form";  
        }
        if($vatortax->dynamic_tax == 1){

            $data['page']    = "invoice_return_form_dynamic";  
        }
        echo Modules::run('template/layout', $data); 
    }


       public function return_invoice() {
        $finyear = $this->input->post('finyear',true);
        
        if($finyear<=0){
            $this->session->set_flashdata('exception', 'Please Create Financial Year First');
            redirect("return_form");
        }else {

            $invoice_id = $this->return_model->return_invoice_entry();

            $setting_data = $this->db->select('is_autoapprove_v')->from('web_setting')->where('setting_id', 1)->get()->result_array();
            if ($setting_data[0]['is_autoapprove_v'] == 1) {	
                
                $new = $this->autoapprove($invoice_id);
            }

            
            $this->session->set_flashdata(array('message' => display('successfully_added')));

            redirect("invoice_return_details/".$invoice_id);
        }
    }

    public function autoapprove($invoice_id){

        $vouchers = $this->db->select('referenceNo, VNo')->from('acc_vaucher')->where('referenceNo',$invoice_id)->where('status',0)->get()->result();
        foreach ($vouchers as $value) {
            # code...
            $data = $this->Accounts_model->approved_vaucher($value->VNo, 'active');
        }
        return true;
        
    }


        //wastage return list end

        public function invoice_return_details($return_id = null){
            $invoice_detail = $this->return_model->retrieve_invoice_html_data($return_id);
            
            $taxfield = $this->db->select('*')
                    ->from('tax_settings')
                    ->where('is_show',1)
                    ->get()
                    ->result_array();
            $txregname ='';
            foreach($taxfield as $txrgname){
            $regname = $txrgname['tax_name'].' Reg No  - '.$txrgname['reg_no'].', ';
            $txregname .= $regname;
            }  
            $subTotal_quantity = 0;
            $subTotal_cartoon  = 0;
            $subTotal_discount = 0;
            $subTotal_ammount  = 0;
            $descript          = 0;
            $isserial          = 0;
            $is_discount       = 0;
            $is_dis_val        = 0;
            $vat_amnt_per      = 0;
            $vat_amnt          = 0;
            $isunit            = 0;
            if (!empty($invoice_detail)) {
                foreach ($invoice_detail as $k => $v) {
                    $invoice_detail[$k]['final_date'] = $this->occational->dateConvert($invoice_detail[$k]['date']);
                    $subTotal_quantity = $subTotal_quantity + $invoice_detail[$k]['quantity'];
                    $subTotal_ammount = $subTotal_ammount + $invoice_detail[$k]['total_price'];
                }
    
                $i = 0;
                foreach ($invoice_detail as $k => $v) {
                    $i++;
                    $invoice_detail[$k]['sl'] = $i;
                     if(!empty($invoice_detail[$k]['description'])){
                        $descript = $descript+1;
                        
                    }
                     if(!empty($invoice_detail[$k]['serial_no'])){
                        $isserial = $isserial+1;
                        
                    }
                     if(!empty($invoice_detail[$k]['unit'])){
                        $isunit = $isunit+1;
                        
                    }
                        if(!empty($invoice_detail[$k]['discount_per'])){
                        $is_discount = $is_discount+1;
                        
                    }
                        if(!empty($invoice_detail[$k]['discount'])){
                        $is_dis_val = $is_dis_val+1;
                        
                    }
                        if(!empty($invoice_detail[$k]['vat_amnt_per'])){
                        $vat_amnt_per = $vat_amnt_per+1;
                        
                    }
                        if(!empty($invoice_detail[$k]['vat_amnt'])){
                        $vat_amnt = $vat_amnt+1;
                        
                    }
                }
            }
    
            $payment_method_list = $this->return_model->invoice_method_wise_balance($invoice_detail[0]['return_id']);
            $terms_list = $this->db->select('*')->from('seles_termscondi')->where('status', 1)->get()->result(); 
            $totalbal = $invoice_detail[0]['total_amount'];
            $user_id  = $invoice_detail[0]['sales_by'];
            $users    = $this->return_model->user_invoice_data($user_id);
            $data = array(
            'title'                => 'Return '.display('pos_print'),
            'invoice_id'           => $invoice_detail[0]['invoice_id'],
            'invoice_no'           => $invoice_detail[0]['invoice'],
            'customer_name'        => $invoice_detail[0]['customer_name'],
            'customer_mobile'      => $invoice_detail[0]['customer_mobile'],
            'final_date'           => $invoice_detail[0]['final_date'],
            'grand_total'          => $invoice_detail[0]['total_amount'],
            'total_amount'         => number_format($totalbal, 2, '.', ','),
            'subTotal_cartoon'     => $subTotal_cartoon,
            'subTotal_quantity'    => $subTotal_quantity,
            'invoice_discount'     => number_format($invoice_detail[0]['invoice_discount'], 2, '.', ','),
            'total_discount'       => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
            'subTotal_ammount'     => number_format($subTotal_ammount, 2, '.', ','),
            'paid_amount'          => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
            'due_amount'           => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
            'shipping_cost'        => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
            'invoice_all_data'     => $invoice_detail,
            'previous'             => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
            'is_discount'          => $is_discount,
            'is_dis_val'           => $is_dis_val,
            'vat_amnt_per'         => $vat_amnt_per,
            'vat_amnt'             => $vat_amnt,
            'users_name'           => $users->first_name.' '.$users->last_name,
            'tax_regno'            => $txregname,
            'is_desc'              => $descript,
            'is_serial'            => $isserial,
            'is_unit'              => $isunit,
            'all_discount'         => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
            'p_method_list'        => $payment_method_list,
            'terms_list'           => $terms_list,
    
            );
    
            $data['module']     = "return";
            $data['page']       = "pos_print"; 
            echo modules::run('template/layout', $data);
    
        }
    
    public function bdtask_supplier_return() {
        $purchase_id = trim($this->input->post('purchase_id',TRUE));
        $query = $this->db->select('purchase_id')->from('product_purchase')->where('purchase_id', $purchase_id)->get();
        if ($query->num_rows() == 0) {
            $this->session->set_flashdata(array('exception' => display('please_input_correct_purchase_id')));
            redirect('supplier_return');
        }
        $purchase_detail = $this->return_model->supplier_return($purchase_id);
       
        $i = 0;
        if (!empty($purchase_detail)) {
            foreach ($purchase_detail as $k => $v) {
                $i++;
                $purchase_detail[$k]['sl'] = $i;
            }
        }

        $data = array(
            'title'         => display('supplier_return'),
            'dbpurs_id'     => $purchase_detail[0]['dbpurs_id'],
            'purchase_id'   => $purchase_detail[0]['purchase_id'],
            'supplier_id'   => $purchase_detail[0]['supplier_id'],
            'supplier_name' => $purchase_detail[0]['supplier_name'],
            'date'          => $purchase_detail[0]['purchase_date'],
            'total_amount'  => $purchase_detail[0]['total_amount'],
            'total_discount'=> $purchase_detail[0]['total_discount'],
            'purchase_all_data' => $purchase_detail,
        );
        $data['all_pmethod'] = $this->return_model->pmethod_dropdown_new();
        $data['module']   = "return";  
        $data['page']     = "supplier_return_form";  
        echo Modules::run('template/layout', $data);
    }

    
    public function return_suppliers() {
        $finyear = $this->input->post('finyear',true);
        
        if($finyear<=0){
            $this->session->set_flashdata('exception', 'Please Create Financial Year First');
            redirect("return_form");
        }else {
            $purchase_data = $this->return_model->return_supplier_entry();

            $setting_data = $this->db->select('is_autoapprove_v')->from('web_setting')->where('setting_id', 1)->get()->result_array();
            if ($setting_data[0]['is_autoapprove_v'] == 1) {
                
                $new = $this->autoapprove($purchase_data['return_id']);
            }
            $this->session->set_flashdata(array('message' => display('successfully_added')));
            redirect("supplier_return_details/".$purchase_data['purchase_id']);
        }
    }


        // supplier return html data
    public function supplier_return_details($purchase_id) {

        $return_detail = $this->return_model->supplier_return_html_data($purchase_id);
        $subTotal_quantity = 0;
        $subTotal_cartoon = 0;
        $subTotal_discount = 0;
        $subTotal_ammount = 0;
        if (!empty($return_detail)) {
            foreach ($return_detail as $k => $v) {
                $return_detail[$k]['final_date'] = $this->occational->dateConvert($return_detail[$k]['date_return']);
                $subTotal_quantity = $subTotal_quantity + $return_detail[$k]['ret_qty'];
                $subTotal_ammount = $subTotal_ammount + $return_detail[$k]['total_ret_amount'];
            }

            $i = 0;
            foreach ($return_detail as $k => $v) {
                $i++;
                $return_detail[$k]['sl'] = $i;
            }
        }

        $data = array(
            'title'          => display('supplier_return'),
            'purchase_id'    => $return_detail[0]['purchase_id'],
            'invoice_no'     => $return_detail[0]['return_id'],
            'supplier_name'  => $return_detail[0]['supplier_name'],
            'address'        => $return_detail[0]['address'],
            'mobile'         => $return_detail[0]['mobile'],
            'final_date'     => $return_detail[0]['final_date'],
            'total_amount'   => number_format($return_detail[0]['net_total_amount'], 2, '.', ','),
            'subTotal_quantity' => $subTotal_quantity,
            'deduction'      => number_format($return_detail[0]['deduction'], 2, '.', ','),
            'total_deduct'   => number_format($return_detail[0]['total_deduct'], 2, '.', ','),
            'subTotal_ammount' => number_format($subTotal_ammount, 2, '.', ','),
            'note'           => $return_detail[0]['reason'],
            'return_detail'  => $return_detail,
        );

        $data['module']   = "return";  
        $data['page']     = "return_supplier_html";  
        echo Modules::run('template/layout', $data);
    }


        public function bdtask_invoice_return_list() {
        $config["base_url"] = base_url('invoice_return_list/');
        $config["total_rows"] = $this->return_model->return_list_count();
        $config["per_page"] = 10;
        $config["uri_segment"] = 2;
        $config["num_links"] = 5;
        $config['full_tag_open'] = "<ul class='pagination'>";
        $config['full_tag_close'] = "</ul>";
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = "<li>";
        $config['next_tag_close'] = "</li>";
        $config['prev_tag_open'] = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = "<li>";
        $config['last_tagl_close'] = "</li>";
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0;
        $data["links"] = $this->pagination->create_links();
        $data['module']  = "return";
        $data['title'] = display('stock_return_list');
        $data['return_list']=$this->return_model->return_list($config["per_page"], $page);
         $data['page']   = "invoice_return_list";
        echo Modules::run('template/layout', $data);
    }

    // date between return report list
    public function datewise_invoic_return_list() {
        $from_date = $this->input->post('from_date',TRUE);
        $to_date = $this->input->post('to_date',TRUE);
        $config["base_url"] = base_url('invoice_return_search/');
        $config["total_rows"] = $this->return_model->return_dateWise_invoice_count($from_date,$to_date);
        $config["per_page"] = 10;
        $config["uri_segment"] = 2;
        $config["num_links"] = 5;
        $config['full_tag_open'] = "<ul class='pagination'>";
        $config['full_tag_close'] = "</ul>";
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = "<li>";
        $config['next_tag_close'] = "</li>";
        $config['prev_tag_open'] = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = "<li>";
        $config['last_tagl_close'] = "</li>";
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0;
        $data["links"]  = $this->pagination->create_links();
        $data['module'] = "return";
        $data['title']  = display('stock_return_list');
        $data['return_list']=$this->return_model->return_dateWise_invoice($from_date,$to_date,$config["per_page"], $page);
         $data['page']   = "invoice_return_list";
        echo Modules::run('template/layout', $data);
    }



        public function supplier_return_list() {
        $config["base_url"] = base_url('supplier_return_list/');
        $config["total_rows"] = $this->return_model->supplier_return_list_count();
        $config["per_page"] = 10;
        $config["uri_segment"] = 2;
        $config["num_links"] = 5;
        $config['full_tag_open'] = "<ul class='pagination'>";
        $config['full_tag_close'] = "</ul>";
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = "<li>";
        $config['next_tag_close'] = "</li>";
        $config['prev_tag_open'] = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = "<li>";
        $config['last_tagl_close'] = "</li>";
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0;
        $data["links"]  = $this->pagination->create_links();
        $data['module'] = "return";
        $data['title']  = display('supplier_return_list');
        $data['return_list']=$this->return_model->supplier_return_list($config["per_page"], $page);
         $data['page']   = "return_supllier_list";
        echo Modules::run('template/layout', $data);
    }


        // date wise supplier return list
    public function datebwteen_supplier_return_list() {
        $from_date = $this->input->post('from_date',TRUE);
        $to_date = $this->input->post('to_date',TRUE);
        $config["base_url"] = base_url('supplier_return_search/');
        $config["total_rows"] = $this->return_model->return_dateWise_supplier_count($from_date,$to_date);
        $config["per_page"] = 10;
        $config["uri_segment"] = 2;
        $config["num_links"] = 5;
        $config['full_tag_open'] = "<ul class='pagination'>";
        $config['full_tag_close'] = "</ul>";
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = "<li>";
        $config['next_tag_close'] = "</li>";
        $config['prev_tag_open'] = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = "<li>";
        $config['last_tagl_close'] = "</li>";
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0;
        $data["links"]  = $this->pagination->create_links();
        $data['module'] = "return";
        $data['title']  = display('supplier_return_list');
        $data['return_list']=$this->return_model->return_dateWise_supplier($from_date, $to_date,$config["per_page"], $page);
         $data['page']   = "return_supllier_list";
        echo Modules::run('template/layout', $data);
    }


    // wastage return list start
    public function wastage_return_list() {
        $config["base_url"] = base_url('wastage_return_list/');
        $config["total_rows"] = $this->return_model->wastage_return_list_count();
        $config["per_page"] = 10;
        $config["uri_segment"] = 2;
        $config["num_links"] = 5;
        $config['full_tag_open'] = "<ul class='pagination'>";
        $config['full_tag_close'] = "</ul>";
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = "<li>";
        $config['next_tag_close'] = "</li>";
        $config['prev_tag_open'] = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = "<li>";
        $config['last_tagl_close'] = "</li>";
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(2)) ? $this->uri->segment(2) : 0;
        $data["links"]  = $this->pagination->create_links();
        $data['module'] = "return";
        $data['title']  = display('wastage_return_list');
        $data['return_list']=$this->return_model->wastage_return_list($config["per_page"], $page);
         $data['page']   = "wastage_return_list";
        echo Modules::run('template/layout', $data);
    }



        public function delete_retutn_invoice($invoice_id = null) {
        if ($this->return_model->returninvoice_delete($invoice_id)) {
            #set success message
            $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
            #set exception message
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
        redirect("invoice_return_list");
    }

        // return delete with purchase id 
    public function delete_retutn_purchase($purchase_id = null) {
        if ($this->return_model->return_purchase_delete($purchase_id)) {
            #set success message
            $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
            #set exception message
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
        redirect("supplier_return_list");
    }
}

