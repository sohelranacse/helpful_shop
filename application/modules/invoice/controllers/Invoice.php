<?php
defined('BASEPATH') OR exit('No direct script access allowed');

    #------------------------------------    
    # Author: Bdtask Ltd
    # Author link: https://www.bdtask.com/
    # Dynamic style php file
    # Developed by :Isahaq
    #------------------------------------    

class Invoice extends MX_Controller {

    public function __construct()
    {
        parent::__construct();
        $timezone = $this->db->select('timezone')->from('web_setting')->get()->row();
        date_default_timezone_set($timezone->timezone);
        $this->load->model(array(
            'invoice_model','customer/customer_model','account/Accounts_model', 'purchase/purchase_model')); 
        if (! $this->session->userdata('isLogIn'))
            redirect('login');
          
    }
   

    function invoice_form() {
        $data['all_customer']= $this->invoice_model->customer_list();
        $data['payment_method'] = $this->purchase_model->get_payment_method();
        $data['warehouse_list'] = $this->purchase_model->warehouse_list();
        $data['product_list'] = $this->invoice_model->get_product_list();
        $data['title']         = display('add_invoice');
        $data['module']        = "invoice";
        $data['page']          = "add_invoice_form";
        echo modules::run('template/layout', $data);
    }
    public function retrieve_product_data() {
        $product_id  = $this->input->post('product_id',TRUE);
        $warehouse_id = $this->input->post('warehouse_id',TRUE);
        $product_info = $this->invoice_model->get_total_product($product_id, $warehouse_id);

        echo json_encode($product_info);
    }

    public function invoice_list(){
        $data['title']        = display('manage_invoice');
        $data['total_invoice']= $this->invoice_model->count_invoice();
        $data['module']       = "invoice";
        $data['page']         = "manage_invoice"; 
        echo modules::run('template/layout', $data);
    }

    public function CheckInvoiceList(){
        $postData = $this->input->post();
        $data     = $this->invoice_model->getInvoiceList($postData);
        echo json_encode($data);
    } 

    function save_invoice() {
        if(!empty($_POST)){
            $this->form_validation->set_rules('warehouse_id', display('warehouse') ,'required|max_length[15]');
            $this->form_validation->set_rules('customer_id', display('customer') ,'required|max_length[15]');
            $this->form_validation->set_rules('payment_method_id', display('payment_method') ,'required|max_length[15]');
            $this->form_validation->set_rules('sales_date', display('sales_date') ,'required|max_length[15]');
            $this->form_validation->set_rules('product_id[]',display('product'),'required|max_length[20]');
            $this->form_validation->set_rules('product_quantity[]',display('quantity'),'required|max_length[20]');
            $this->form_validation->set_rules('product_rate[]',display('rate'),'required|max_length[20]');
            
            if ($this->form_validation->run() === true) {
                $invoice_id = $this->invoice_model->insert_invoice();

                if ($invoice_id) {
                   
                    $this->session->set_flashdata('message', display('save_successfully'));
                    redirect("invoice_details/".$invoice_id);
                } else {
                   
                    $this->session->set_flashdata('exception', display('ooops_something_went_wrong'));
                    redirect("add_invoice");
                }

            } else {
                $this->session->set_flashdata('exception', validation_errors());
                redirect("add_purchase");
            }
        }
    }
    public function invoice_details($id = null){
        $data['info'] = $this->invoice_model->invoice_info($id);
        $data['details'] = $this->invoice_model->invoice_details($id);
        $data['company_info'] = $this->invoice_model->retrieve_company();
        $data['setting'] = $this->invoice_model->retrieve_setting_editdata()[0];
        $data['title']        = display('invoice_details');
        $data['module']       = "invoice";
        $data['page']         = "invoice_details";
        echo modules::run('template/layout', $data);
    }
    function edit_invoice($id) {
        $data['title']       = display('invoice_edit');
        $data['all_customer']= $this->invoice_model->customer_list();
        $data['info'] = $this->invoice_model->invoice_info($id);
        $data['details'] = $this->invoice_model->invoice_details($id);
        $data['payment_method'] = $this->purchase_model->get_payment_method();
        $data['warehouse_list'] = $this->purchase_model->warehouse_list();
        $data['product_list'] = $this->invoice_model->get_product_list();
        $data['module']         = "invoice";
        $data['page']           = "edit_invoice"; 
        echo modules::run('template/layout', $data);
    }
    function update_invoice($id) {
        if(!empty($_POST)){
            $this->form_validation->set_rules('id', display('id') ,'required|max_length[15]');
            $this->form_validation->set_rules('warehouse_id', display('warehouse') ,'required|max_length[15]');
            $this->form_validation->set_rules('customer_id', display('customer') ,'required|max_length[15]');
            $this->form_validation->set_rules('payment_method_id', display('payment_method') ,'required|max_length[15]');
            $this->form_validation->set_rules('sales_date', display('sales_date') ,'required|max_length[15]');
            $this->form_validation->set_rules('product_id[]',display('product'),'required|max_length[20]');
            $this->form_validation->set_rules('product_quantity[]',display('quantity'),'required|max_length[20]');
            $this->form_validation->set_rules('product_rate[]',display('rate'),'required|max_length[20]');
            
            if ($this->form_validation->run() === true) {
                $invoice_id = $this->invoice_model->update_invoice_save();

                if ($invoice_id) {
                   
                    $this->session->set_flashdata('message', display('update_successfully'));
                    redirect("invoice_details/".$invoice_id);
                } else {
                   
                    $this->session->set_flashdata('exception', display('ooops_something_went_wrong'));
                    redirect("invoice_edit/".$id);
                }

            } else {
                $this->session->set_flashdata('exception', validation_errors());
                redirect("add_purchase");
            }
        }
    }








    public function bdtask_manual_sales_insert(){
        $this->form_validation->set_rules('customer_id', display('customer_name') ,'required|max_length[15]');
        $this->form_validation->set_rules('product_id[]',display('product'),'required|max_length[20]');
        $this->form_validation->set_rules('multipaytype[]',display('payment_type'),'required');
        $this->form_validation->set_rules('product_quantity[]',display('quantity'),'required|max_length[20]');
        $this->form_validation->set_rules('product_rate[]',display('rate'),'required|max_length[20]');
        $normal = $this->input->post('is_normal');

        $finyear = $this->input->post('finyear',true);
        if($finyear<=0){
            $data['status'] = false;
            $data['exception'] = 'Please Create Financial Year First';
        }else {
            if ($this->form_validation->run() === true) {
                $incremented_id = $this->number_generator();
                $invoice_id     = $this->invoice_model->invoice_entry($incremented_id);
                if(!empty($invoice_id)){
                    $setting_data = $this->db->select('is_autoapprove_v')->from('web_setting')->where('setting_id', 1)->get()->result_array();
                    if ($setting_data[0]['is_autoapprove_v'] == 1) {
                        
                        $new = $this->autoapprove($invoice_id);
                    }

                    $data['status']     = true;
                    $data['invoice_id'] = $invoice_id;
                    $data['message']    = display('save_successfully');
                    $mailsetting        = $this->db->select('*')->from('email_config')->get()->result_array();

                    if($mailsetting[0]['isinvoice']==1){
                        $mail  = $this->invoice_pdf_generate($invoice_id);
                        if($mail == 0){
                            $data['exception'] = $this->session->set_userdata(array('error_message' => display('please_config_your_mail_setting')));
                        }
                    }
                    if($normal == 1){
                        $printdata       = $this->invoice_model->bdtask_invoice_pos_print_direct($invoice_id);
                        $data['details'] = $this->load->view('invoice/invoice_html_manual', $printdata, true);
                    }else{
                        $printdata       = $this->invoice_model->bdtask_invoice_pos_print_direct($invoice_id);
                        $data['details'] = $this->load->view('invoice/pos_print', $printdata, true);
                    }
            
                }else{
                    $data['status']    = false;
                    $data['exception'] = 'Please Try Again';
                }
            
            }else{
                $data['status']    = false;
                $data['exception'] = validation_errors();  
            }
        }
        echo json_encode($data);
    }

    public function delivery_note(){

        $data['invoice_no']    =  $this->input->post('invoice_no',TRUE);
        $data['delivery_note'] = $this->db->select('delivery_note')
        ->from('invoice')->where('invoice_id',$data['invoice_no'])->get()->row()->delivery_note;

        $this->load->view('invoice/delivery_note',$data); 
      }

    public function save_delivery_note($invoice_id){

        $delivery_note = $this->input->post('note',true);
        $data =  array('delivery_note' => $delivery_note);
        
        if ($this->db->where('invoice_id', $invoice_id)->update('invoice', $data)) {
            #set success message
            $this->session->set_flashdata('message', display('save_successfully'));
        } else {
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
        
        redirect("invoice_list");
        
    }


    
    public function bdtask_invoice_details_old($invoice_id = null){
        $invoice_detail     = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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
                $invoice_detail[$k]['final_date'] = $invoice_detail[$k]['date'];
                $subTotal_quantity = $subTotal_quantity + $invoice_detail[$k]['quantity'];
                $subTotal_ammount  = $subTotal_ammount + $invoice_detail[$k]['total_price'];
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


        $totalbal      = $invoice_detail[0]['total_amount'];
        $amount_inword = $totalbal;
        $user_id       = $invoice_detail[0]['sales_by'];
        $users         = $this->invoice_model->user_invoice_data($user_id);
        $data = array(
        'title'             => display('invoice_details'),
        'invoice_id'        => $invoice_detail[0]['invoice_id'],
        'invoice_no'        => $invoice_detail[0]['invoice'],
        'customer_name'     => $invoice_detail[0]['customer_name'],
        'customer_address'  => $invoice_detail[0]['customer_address'],
        'customer_mobile'   => $invoice_detail[0]['customer_mobile'],
        'customer_email'    => $invoice_detail[0]['customer_email'],
        'added_on'        => $invoice_detail[0]['added_on'],
        'final_date'        => $invoice_detail[0]['final_date'],
        'email_address'     => $invoice_detail[0]['email_address'],
        'contact'           => $invoice_detail[0]['contact'],
        'invoice_details'   => $invoice_detail[0]['invoice_details'],
        'total_amount'      => number_format($invoice_detail[0]['total_amount'], 2, '.', ','),
        'subTotal_quantity' => $subTotal_quantity,
        'total_discount'    => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_discount_cal'=> $invoice_detail[0]['total_discount'],
        'total_vat'         => number_format($invoice_detail[0]['total_vat_amnt'], 2, '.', ','),
        'total_tax'         => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
        'subTotal_ammount'  => number_format($subTotal_ammount, 2, '.', ','),
        'subTotal_amount_cal'=> $subTotal_ammount,
        'paid_amount'       => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
        'due_amount'        => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
        'previous'          => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
        'shipping_cost'     => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
        'invoice_all_data'  => $invoice_detail,
        'am_inword'         => $amount_inword,
        'is_discount'       => $invoice_detail[0]['total_discount']-$invoice_detail[0]['invoice_discount'],
        'users_name'        => $users->first_name.' '.$users->last_name,
        'tax_regno'         => $txregname,
        'is_desc'           => $descript,
        'is_dis_val'        => $is_dis_val,
        'vat_amnt_per'      => $vat_amnt_per,
        'vat_amnt'          => $vat_amnt,
        'is_discount'       => $is_discount,
        'is_serial'         => $isserial,
        'is_unit'           => $isunit,
        );
        $data['module']     = "invoice";
        $data['page']       = "invoice_html"; 
        echo modules::run('template/layout', $data);
    }

    public function bdtask_delivery_invoice_details($invoice_id = null){
        $invoice_detail     = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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
                $invoice_detail[$k]['final_date'] = $invoice_detail[$k]['date'];
                $subTotal_quantity = $subTotal_quantity + $invoice_detail[$k]['quantity'];
                $subTotal_ammount  = $subTotal_ammount + $invoice_detail[$k]['total_price'];
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


        $totalbal      = $invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'];
        $amount_inword = $totalbal;
        $user_id       = $invoice_detail[0]['sales_by'];
        $users         = $this->invoice_model->user_invoice_data($user_id);
        $data = array(
        'title'             => display('invoice_details'),
        'invoice_id'        => $invoice_detail[0]['invoice_id'],
        'invoice_no'        => $invoice_detail[0]['invoice'],
        'customer_name'     => $invoice_detail[0]['customer_name'],
        'customer_address'  => $invoice_detail[0]['customer_address'],
        'customer_mobile'   => $invoice_detail[0]['customer_mobile'],
        'customer_email'    => $invoice_detail[0]['customer_email'],
        'final_date'        => $invoice_detail[0]['final_date'],
        'email_address'     => $invoice_detail[0]['email_address'],
        'contact'           => $invoice_detail[0]['contact'],
        'invoice_details'   => $invoice_detail[0]['invoice_details'],
        'total_amount'      => number_format($invoice_detail[0]['total_amount'], 2, '.', ','),
        'subTotal_quantity' => $subTotal_quantity,
        'total_discount'    => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_discount_cal'=> $invoice_detail[0]['total_discount'],
        'total_vat'         => number_format($invoice_detail[0]['total_vat_amnt'], 2, '.', ','),
        'total_tax'         => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
        'subTotal_ammount'  => number_format($subTotal_ammount, 2, '.', ','),
        'subTotal_amount_cal'=> $subTotal_ammount,
        'paid_amount'       => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
        'due_amount'        => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
        'previous'          => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
        'shipping_cost'     => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
        'invoice_all_data'  => $invoice_detail,
        'am_inword'         => $amount_inword,
        'is_discount'       => $invoice_detail[0]['total_discount']-$invoice_detail[0]['invoice_discount'],
        'users_name'        => $users->first_name.' '.$users->last_name,
        'tax_regno'         => $txregname,
        'is_desc'           => $descript,
        'is_dis_val'        => $is_dis_val,
        'vat_amnt_per'      => $vat_amnt_per,
        'vat_amnt'          => $vat_amnt,
        'is_discount'       => $is_discount,
        'is_serial'         => $isserial,
        'is_unit'           => $isunit,
        );
        $data['module']     = "invoice";
        $data['page']       = "delivery_invoice_html"; 
        echo modules::run('template/layout', $data);
    }


    public function bdtask_invoice_pad_print($invoice_id){
           $invoice_detail = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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

        $totalbal      = $invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'];
        $amount_inword = $this->numbertowords->convert_number($totalbal);
        $user_id       = $invoice_detail[0]['sales_by'];
        $users         = $this->invoice_model->user_invoice_data($user_id);
        $data = array(
        'title'            => display('pad_print'),
        'invoice_id'       => $invoice_detail[0]['invoice_id'],
        'invoice_no'       => $invoice_detail[0]['invoice'],
        'customer_name'    => $invoice_detail[0]['customer_name'],
        'customer_address' => $invoice_detail[0]['customer_address'],
        'customer_mobile'  => $invoice_detail[0]['customer_mobile'],
        'customer_email'   => $invoice_detail[0]['customer_email'],
        'final_date'       => $invoice_detail[0]['final_date'],
        'print_setting'    => $this->invoice_model->bdtask_print_settingdata(),
        'invoice_details'  => $invoice_detail[0]['invoice_details'],
        'total_amount'     => number_format($totalbal, 2, '.', ','),
        'subTotal_cartoon' => $subTotal_cartoon,
        'subTotal_quantity'=> $subTotal_quantity,
        'total_vat'        => number_format($invoice_detail[0]['total_vat_amnt'], 2, '.', ','),
        'invoice_discount' => number_format($invoice_detail[0]['invoice_discount'], 2, '.', ','),
        'total_discount'   => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_tax'        => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
        'subTotal_ammount' => number_format($subTotal_ammount, 2, '.', ','),
        'paid_amount'      => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
        'due_amount'       => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
         'shipping_cost'   => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
        'invoice_all_data' => $invoice_detail,
        'previous'         => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
        'am_inword'        => $amount_inword,
        'is_discount'      => $invoice_detail[0]['total_discount']-$invoice_detail[0]['invoice_discount'],
        'is_dis_val'       => $is_dis_val,
        'vat_amnt_per'     => $vat_amnt_per,
        'vat_amnt'         => $vat_amnt,
        'is_discount'      => $is_discount,
        'users_name'       => $users->first_name.' '.$users->last_name,
        'tax_regno'        => $txregname,
        'is_desc'          => $descript,
        'is_serial'        => $isserial,
        'is_unit'          => $isunit,
        );

        $data['module']     = "invoice";
        $data['page']       = "pad_print"; 
        echo modules::run('template/layout', $data);
    }


    public function bdtask_invoice_pos_print($invoice_id = null){
        $invoice_detail = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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

        $payment_method_list = $this->invoice_model->invoice_method_wise_balance($invoice_id);
        $terms_list = $this->db->select('*')->from('seles_termscondi')->where('status', 1)->get()->result(); 
        $totalbal = $invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'];
        $user_id  = $invoice_detail[0]['sales_by'];
        $users    = $this->invoice_model->user_invoice_data($user_id);
        $data = array(
        'title'                => display('pos_print'),
        'invoice_id'           => $invoice_detail[0]['invoice_id'],
        'invoice_no'           => $invoice_detail[0]['invoice'],
        'customer_name'        => $invoice_detail[0]['customer_name'],
        'customer_address'     => $invoice_detail[0]['customer_address'],
        'customer_mobile'      => $invoice_detail[0]['customer_mobile'],
        'customer_email'       => $invoice_detail[0]['customer_email'],
        'final_date'           => $invoice_detail[0]['final_date'],
        'invoice_details'      => $invoice_detail[0]['invoice_details'],
        'grand_total'          => $invoice_detail[0]['total_amount'],
        'total_amount'         => number_format($totalbal, 2, '.', ','),
        'subTotal_cartoon'     => $subTotal_cartoon,
        'subTotal_quantity'    => $subTotal_quantity,
        'invoice_discount'     => number_format($invoice_detail[0]['invoice_discount'], 2, '.', ','),
        'total_discount'       => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_vat'            => number_format($invoice_detail[0]['total_vat_amnt'], 2, '.', ','),
        'total_tax'            => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
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

        $data['module']     = "invoice";
        $data['page']       = "pos_print"; 
        echo modules::run('template/layout', $data);

    }


    public function bdtask_pos_print_direct(){
        $invoice_id = $this->input->post('invoice_id',true);
        $invoice_detail = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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
            }
        }

 
        $totalbal = $invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'];
        $user_id  = $invoice_detail[0]['sales_by'];
        $users    = $this->invoice_model->user_invoice_data($user_id);
        $data = array(
        'title'                => display('pos_print'),
        'invoice_id'           => $invoice_detail[0]['invoice_id'],
        'invoice_no'           => $invoice_detail[0]['invoice'],
        'customer_name'        => $invoice_detail[0]['customer_name'],
        'customer_address'     => $invoice_detail[0]['customer_address'],
        'customer_mobile'      => $invoice_detail[0]['customer_mobile'],
        'customer_email'       => $invoice_detail[0]['customer_email'],
        'final_date'           => $invoice_detail[0]['final_date'],
        'invoice_details'      => $invoice_detail[0]['invoice_details'],
        'total_amount'         => number_format($totalbal, 2, '.', ','),
        'subTotal_cartoon'     => $subTotal_cartoon,
        'subTotal_quantity'    => $subTotal_quantity,
        'invoice_discount'     => number_format($invoice_detail[0]['invoice_discount'], 2, '.', ','),
        'total_discount'       => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_tax'            => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
        'subTotal_ammount'     => number_format($subTotal_ammount, 2, '.', ','),
        'paid_amount'          => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
        'due_amount'           => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
        'shipping_cost'        => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
        'invoice_all_data'     => $invoice_detail,
        'previous'             => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
         'is_discount'         => $is_discount,
        'users_name'           => $users->first_name.' '.$users->last_name,
        'tax_regno'            => $txregname,
        'is_desc'              => $descript,
        'is_serial'            => $isserial,
        'is_unit'              => $isunit,
        'url'                  => $this->input->post('url',TRUE),

        );

        $data['module']     = "invoice";
        $data['page']       = "pos_invoice_html_direct"; 
        echo modules::run('template/layout', $data);

    }


    public function bdtask_download_invoice($invoice_id = null){
        $invoice_detail = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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
        $isunit            = 0;
        $is_discount       = 0;
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
                 if(!empty($invoice_detail[$k]['discount_per'])){
                    $is_discount = $is_discount+1;
                }
                if(!empty($invoice_detail[$k]['unit'])){
                    $isunit = $isunit+1;
                }
            }
        }

        $currency_details = $this->invoice_model->retrieve_setting_editdata();
        $company_info     = $this->invoice_model->retrieve_company();
        $totalbal         = $invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'];
        $amount_inword    = $this->numbertowords->convert_number($totalbal);
        $user_id          = $invoice_detail[0]['sales_by'];
        $users            = $this->invoice_model->user_invoice_data($user_id);
        $data = array(
        'title'             => display('invoice_details'),
        'invoice_id'        => $invoice_detail[0]['invoice_id'],
        'customer_info'     => $invoice_detail,
        'invoice_no'        => $invoice_detail[0]['invoice'],
        'customer_name'     => $invoice_detail[0]['customer_name'],
        'customer_address'  => $invoice_detail[0]['customer_address'],
        'customer_mobile'   => $invoice_detail[0]['customer_mobile'],
        'customer_email'    => $invoice_detail[0]['customer_email'],
        'final_date'        => $invoice_detail[0]['final_date'],
        'invoice_details'   => $invoice_detail[0]['invoice_details'],
        'total_amount'      => number_format($invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'], 2, '.', ','),
        'subTotal_quantity' => $subTotal_quantity,
        'total_discount'    => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_tax'         => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
        'total_vat'         => number_format($invoice_detail[0]['total_vat_amnt'], 2, '.', ','),
        'subTotal_ammount'  => number_format($subTotal_ammount, 2, '.', ','),
        'paid_amount'       => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
        'due_amount'        => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
        'previous'          => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
        'shipping_cost'     => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
        'invoice_all_data'  => $invoice_detail,
        'company_info'      => $company_info,
        'currency'          => $currency_details[0]['currency'],
        'position'          => $currency_details[0]['currency_position'],
        'discount_type'     => $currency_details[0]['discount_type'],
        'currency_details'  => $currency_details,
        'am_inword'         => $amount_inword,
        'is_discount'       => $is_discount,
        'users_name'        => $users->first_name.' '.$users->last_name,
        'tax_regno'         => $txregname,
        'is_desc'           => $descript,
        'is_serial'         => $isserial,
        'is_unit'           => $isunit,
        );



        $this->load->library('pdfgenerator');
        $dompdf = new DOMPDF();
        $page = $this->load->view('invoice/invoice_download', $data, true);
        $file_name = time();
        $dompdf->load_html($page,'UTF-8');
        $dompdf->render();
        $output = $dompdf->output();
        @exec("sudo chmod " . "$file_name 777");
        file_put_contents("assets/data/pdf/invoice/$file_name.pdf", $output);
        $filename = $file_name . '.pdf';
        $file_path = base_url() . 'assets/data/pdf/invoice/' . $filename;

        $this->load->helper('download');
        force_download('./assets/data/pdf/invoice/' . $filename, NULL);
        redirect("invoice_list");
        
    }

    

    public function autoapprove($invoice_id){

        $vouchers = $this->db->select('referenceNo, VNo')->from('acc_vaucher')->where('referenceNo',$invoice_id)->where('status',0)->get()->result();
        foreach ($vouchers as $value) {
            # code...
            $data = $this->Accounts_model->approved_vaucher($value->VNo, 'active');
        }
        return true;
        
    }

    public function bdtask_showpaymentmodal(){
        $is_credit =  $this->input->post('is_credit_edit',TRUE);
        $data['is_credit'] = $is_credit;
        if ($is_credit == 1) {
            # code...
            $data['all_pmethod'] = $this->invoice_model->pmethod_dropdown();
        }else{

            $data['all_pmethod'] = $this->invoice_model->pmethod_dropdown_new();
        }
        $this->load->view('invoice/newpaymentveiw',$data); 
    }


    public function bdtask_edit_invoice($invoice_id = null){

        $invoice_detail = $this->invoice_model->retrieve_invoice_editdata($invoice_id);
        $vat_tax_info   = $this->invoice_model->vat_tax_setting();
        if ($invoice_detail[0]['is_dynamic'] ==1) {
            if ($invoice_detail[0]['is_dynamic'] != $vat_tax_info->dynamic_tax) {

                $this->session->set_flashdata('exception', 'VAT and TAX are set globally, which is not the same as VAT and TAX on this invoice. (which was configured when the invoice was created). It is not editable.');
                redirect("invoice_list");
            }
            
        }
        elseif ($invoice_detail[0]['is_fixed'] ==1) {
            if ($invoice_detail[0]['is_fixed'] != $vat_tax_info->fixed_tax) {

                $this->session->set_flashdata('exception', 'VAT and TAX are set globally, which is not the same as VAT and TAX on this invoice. (which was configured when the invoice was created). It is not editable.');
                redirect("invoice_list");
            }
        }
     
        $taxinfo        = $this->invoice_model->invoice_taxinfo($invoice_id);
        $taxfield       = $this->db->select('tax_name,default_value')
                                ->from('tax_settings')
                                ->get()
                                ->result_array();
        $i = 0;
        if (!empty($invoice_detail)) {
            foreach ($invoice_detail as $k => $v) {
                $i++;
                $invoice_detail[$k]['sl'] = $i;
                $stock = $this->invoice_model->stock_qty_check($invoice_detail[$k]['product_id']);
                $invoice_detail[$k]['stock_qty'] = $stock + $invoice_detail[$k]['quantity'];
            }
        }

        $currency_details = $this->invoice_model->retrieve_setting_editdata();

        $multi_pay_data = $this->db->select('COAID, Debit')
                        ->from('acc_vaucher')
                        ->where('referenceNo',$invoice_detail[0]['invoice'])
                        ->where('Vtype','CV')
                        ->get()->result();
        
        $data = array(
            'title'           => display('invoice_edit'),
            'dbinv_id'        => $invoice_detail[0]['dbinv_id'],
            'invoice_id'      => $invoice_detail[0]['invoice_id'],
            'customer_id'     => $invoice_detail[0]['customer_id'],
            'customer_name'   => $invoice_detail[0]['customer_name'],
            'date'            => $invoice_detail[0]['date'],
            'invoice_details' => $invoice_detail[0]['invoice_details'],
            'invoice'         => $invoice_detail[0]['invoice'],
            'total_amount'    => $invoice_detail[0]['total_amount'],
            'paid_amount'     => $invoice_detail[0]['paid_amount'],
            'due_amount'      => $invoice_detail[0]['due_amount'],
            'invoice_discount'=> $invoice_detail[0]['invoice_discount'],
            'total_discount'  => $invoice_detail[0]['total_discount'],
            'total_vat_amnt'  => $invoice_detail[0]['total_vat_amnt'],
            'unit'            => $invoice_detail[0]['unit'],
            'tax'             => $invoice_detail[0]['tax'],
            'taxes'           => $taxfield,
            'prev_due'        => $invoice_detail[0]['prevous_due'],
            'net_total'       => $invoice_detail[0]['prevous_due'] + $invoice_detail[0]['total_amount'], 
            'shipping_cost'   => $invoice_detail[0]['shipping_cost'],
            'total_tax'       => $invoice_detail[0]['taxs'],
            'invoice_all_data'=> $invoice_detail,
            'taxvalu'         => $taxinfo,
            'discount_type'   => $currency_details[0]['discount_type'],
            'bank_id'         => $invoice_detail[0]['bank_id'],
            'multi_paytype'   => $multi_pay_data,
            'is_credit'       => $invoice_detail[0]['is_credit'],
        );
        $data['all_pmethod'] = $this->invoice_model->pmethod_dropdown_new();
        $data['all_pmethodwith_cr'] = $this->invoice_model->pmethod_dropdown();
        $data['module']     = "invoice";
        $vatortax              = $this->invoice_model->vat_tax_setting();
        if($vatortax->fixed_tax == 1){
            
            $data['page']       = "edit_invoice_form"; 
        }
        if($vatortax->dynamic_tax == 1){
            $data['page']          = "edit_invoice_form_dynamic"; 
        }
        echo modules::run('template/layout', $data);
    }

    public function bdtask_update_invoice(){
     $this->form_validation->set_rules('customer_id', display('customer_name') ,'required|max_length[15]');
    $this->form_validation->set_rules('invoice_no', display('invoice_no') ,'required|max_length[20]');
    $this->form_validation->set_rules('multipaytype[]',display('payment_type'),'required');
    $this->form_validation->set_rules('product_id[]',display('product'),'required|max_length[20]');
    $this->form_validation->set_rules('product_quantity[]',display('quantity'),'required|max_length[20]');
    $this->form_validation->set_rules('product_rate[]',display('rate'),'required|max_length[20]');

    $multipaytype = $this->input->post('multipaytype',TRUE);
    $finyear = $this->input->post('finyear',true);
    if($finyear<=0){
        $data['status'] = false;
        $data['exception'] = 'Please Create Financial Year First';
    }else {
   
        if ($this->form_validation->run() === true) { 
        $invoice_id = $this->invoice_model->update_invoice();
            if(!empty($invoice_id)){
                $setting_data = $this->db->select('is_autoapprove_v')->from('web_setting')->where('setting_id', 1)->get()->result_array();
                    if ($setting_data[0]['is_autoapprove_v'] == 1) {
                        
                        $new = $this->autoapprove($invoice_id);
                    }
            $data['status'] = true;
            $data['invoice_id'] = $invoice_id;
            $data['message'] = display('update_successfully');
            $mailsetting = $this->db->select('*')->from('email_config')->get()->result_array();
            if($mailsetting[0]['isinvoice']==1){
            $mail = $this->invoice_pdf_generate($invoice_id);
            if($mail == 0){
            $data['exception'] = $this->session->set_userdata(array('error_message' => display('please_config_your_mail_setting')));
            }
            }
            $data['details'] = $this->load->view('invoice/invoice_html', $data, true);
            }else{
            $data['status'] = false;
            $data['exception'] = 'Please Try Again';
            }
        
        }else{
            $data['status'] = false;
        $data['exception'] = validation_errors();  
        }
    }
     echo json_encode($data);
    }

    public function invoice_pdf_generate($invoice_id = null) {
        $id = $invoice_id; 
        $invoice_detail = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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
        $subTotal_cartoon = 0;
        $subTotal_discount = 0;
        $subTotal_ammount = 0;
        $descript = 0;
        $isserial = 0;
        $isunit = 0;
        $is_discount = 0;
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
                 if(!empty($invoice_detail[$k]['discount_per'])){
                    $is_discount = $is_discount+1;
                    
                }

                if(!empty($invoice_detail[$k]['unit'])){
                    $isunit = $isunit+1;
                    
                }
   
            }
        }

        $currency_details = $this->invoice_model->retrieve_setting_editdata();
        $company_info = $this->invoice_model->retrieve_company();
        $totalbal = $invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'];
        $amount_inword = $this->numbertowords->convert_number($totalbal);
        $user_id = $invoice_detail[0]['sales_by'];
        
        $name    = $invoice_detail[0]['customer_name'];
        $email   = $invoice_detail[0]['customer_email'];
        $data = array(
        'title'             => display('invoice_details'),
        'invoice_id'        => $invoice_detail[0]['invoice_id'],
        'customer_info'     => $invoice_detail,
        'invoice_no'        => $invoice_detail[0]['invoice'],
        'customer_name'     => $invoice_detail[0]['customer_name'],
        'customer_address'  => $invoice_detail[0]['customer_address'],
        'customer_mobile'   => $invoice_detail[0]['customer_mobile'],
        'customer_email'    => $invoice_detail[0]['customer_email'],
        'final_date'        => $invoice_detail[0]['final_date'],
        'invoice_details'   => $invoice_detail[0]['invoice_details'],
        'total_amount'      => number_format($invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'], 2, '.', ','),
        'subTotal_quantity' => $subTotal_quantity,
        'total_discount'    => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_vat'         => number_format($invoice_detail[0]['total_vat_amnt'], 2, '.', ','),
        'total_tax'         => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
        'subTotal_ammount'  => number_format($subTotal_ammount, 2, '.', ','),
        'paid_amount'       => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
        'due_amount'        => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
        'previous'          => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
        'shipping_cost'     => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
        'invoice_all_data'  => $invoice_detail,
        'company_info'      => $company_info,
        'currency'          => $currency_details[0]['currency'],
        'position'          => $currency_details[0]['currency_position'],
        'discount_type'     => $currency_details[0]['discount_type'],
        'currency_details'  => $currency_details,
        'am_inword'         => $amount_inword,
        'is_discount'       => $is_discount,
        
        'tax_regno'         => $txregname,
        'is_desc'           => $descript,
        'is_serial'         => $isserial,
        'is_unit'           => $isunit,
        );

        $this->load->library('pdfgenerator');
        $html = $this->load->view('invoice/invoice_download', $data, true);
        $dompdf = new DOMPDF();
        $dompdf->load_html($html);
        $dompdf->render();
        $output = $dompdf->output();
        file_put_contents('assets/data/pdf/invoice/' . $id . '.pdf', $output);
        $file_path = getcwd() . '/assets/data/pdf/invoice/' . $id . '.pdf';
        $send_email = '';
        if (!empty($email)) {
            $send_email = $this->setmail($email, $file_path, $id, $name);
            
            if($send_email){
           return 1;
            }else{
               return 0;
               
            }
           
        }
      return 0; 
       
    }

    

    public function setmail($email, $file_path, $id = null, $name = null) {
        $setting_detail = $this->db->select('*')->from('email_config')->get()->row();
        $subject = 'Product Purchase Information';
        $message = strtoupper($name) . '-' . $id;

        $config = Array(
            'protocol'  => $setting_detail->protocol,
            'smtp_host' => $setting_detail->smtp_host,
            'smtp_port' => $setting_detail->smtp_port,
            'smtp_user' => $setting_detail->smtp_user,
            'smtp_pass' => $setting_detail->smtp_pass,
            'mailtype'  => 'html', 
            'charset'   => 'utf-8',
            'wordwrap'  => TRUE
        );
       
        $this->load->library('email');
        $this->email->initialize($config);
        $this->email->set_newline("\r\n");
        $this->email->set_mailtype("html");
        $this->email->from($setting_detail->smtp_user);
        $this->email->to($email);

        $config = Array(
        'protocol'  => $setting_detail->protocol,
        'smtp_host' => $setting_detail->smtp_host,
        'smtp_port' => $setting_detail->smtp_port,
        'smtp_user' => $setting_detail->smtp_user,
        'smtp_pass' => $setting_detail->smtp_pass,
        'mailtype'  => 'html', 
        'charset'   => 'utf-8',
        'wordwrap'  => TRUE
        );
        
        $this->load->library('email');
        $this->email->initialize($config);
        $this->email->set_newline("\r\n");
        $this->email->set_mailtype("html");
        $this->email->from($setting_detail->smtp_user);
        $this->email->to($email);
        $this->email->subject($subject);
        $this->email->message($message);
        $this->email->attach($file_path);
        $check_email = $this->test_input($email);
        if (filter_var($check_email, FILTER_VALIDATE_EMAIL)) {
            if ($this->email->send()) {
                return true;
            } else {
                $this->session->set_flashdata(array('exception' => display('please_configure_your_mail.')));
                return false;
            }
        } else {
           
            return false;
        }
    }


    //Email testing for email
    public function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }


    function bdtask_pos_invoice() {
        $taxfield = $this->db->select('tax_name,default_value')
                ->from('tax_settings')
                ->get()
                ->result_array();
                $tablecolumn   = $this->db->list_fields('tax_collection');
                $num_column    = count($tablecolumn)-4;
        $walking_customer      = $this->invoice_model->pos_customer_setup();
        $data['customer_name'] = $walking_customer[0]['customer_name'];
        $data['customer_id']   = $walking_customer[0]['customer_id'];
        $data['invoice_no']    = $this->number_generator();
        $data['title']         = display('pos_invoice');
        $data['taxes']         = $this->invoice_model->tax_fileds();
        $data['taxnumber']     = $num_column;
        $data['module']        = "invoice";
        $data['page']          = "add_pos_invoice_form"; 
        echo modules::run('template/layout', $data);
    }



  public function bdtask_gui_pos(){
            $taxfield = $this->db->select('tax_name,default_value')
                ->from('tax_settings')
                ->get()
                ->result_array();
                $tablecolumn       = $this->db->list_fields('tax_collection');
                $num_column        = count($tablecolumn)-4;
            $data['title']         = display('gui_pos');
            $saveid                = $this->session->userdata('id');
            $walking_customer      = $this->invoice_model->walking_customer();
            $data['customer_id']   = $walking_customer[0]['customer_id'];
            $data['customer_name'] = $walking_customer[0]['customer_name'];
            $data['categorylist']  = $this->invoice_model->category_list();
            $customer_details      = $this->invoice_model->pos_customer_setup();
            $data['customerlist']  = $this->invoice_model->customer_dropdown();
            $data['customer_name'] = $customer_details[0]['customer_name'];
            $data['customer_id']   = $customer_details[0]['customer_id'];
            $data['itemlist']      = $this->invoice_model->allproduct();
            $data['product_list']  = $this->invoice_model->product_list();
            $data['taxes']         = $taxfield;
            $data['taxnumber']     = $num_column;
            $data['invoice_no']    = $this->number_generator();
            $data['todays_invoice']= $this->invoice_model->todays_invoice();
            $data['all_pmethod']   = $this->invoice_model->pmethod_dropdown();
            $data['module']        = "invoice";
            $vatortax              = $this->invoice_model->vat_tax_setting();
            if($vatortax->fixed_tax == 1){
                $data['page']      = "gui_pos_invoice"; 
                $data['tax_type']  = "fixed"; 

            }
            if($vatortax->dynamic_tax == 1){
                $data['page']      = "gui_pos_invoice_dynamic"; 
                $data['tax_type']  = "dynamic";
            }
            echo modules::run('template/layout', $data); 
        }


      public function getitemlist(){
                $catid       = $this->input->post('category_id',TRUE);
                $category_id = (!empty($catid)?$catid:'');
                $getproduct  = $this->invoice_model->searchprod($category_id);
                if(!empty($getproduct)){
                $data['itemlist']=$getproduct;
                $this->load->view('invoice/getproductlist', $data);  
                }else{
                $title['title'] = 'Product Not found';
                $this->load->view('invoice/productnot_found', $title);
                }
        }


     public function getitemlist_byname(){
            $product_name     = $this->input->post('product_name',TRUE);
            $getproduct       = $this->invoice_model->searchprod_byname($product_name);
            if(!empty($getproduct)){
            $data['itemlist'] = $getproduct;
            $this->load->view('invoice/getproductlist', $data);  
            }else{
            $title['title']   = 'Product Not found';
            $this->load->view('invoice/productnot_found', $title);
            }
     }



        public function getitemlist_byproductname(){
                $prod       = $this->input->post('product_name',TRUE);
                $catid      = $this->input->post('category_id',TRUE);
                $getproduct = $this->invoice_model->searchprod_byname($catid,$prod);
                if(!empty($getproduct)){
                $data['itemlist']=$getproduct;
                $this->load->view('invoice/getproductlist', $data);  
                }
                else{
                    $title['title'] = 'Product Not found';
                    $this->load->view('invoice/productnot_found', $title);
                    }
        }

        public function gui_pos_invoice() {
        $product_id = $this->input->post('product_id',TRUE);
        $pro_id = $this->input->post('product_id',TRUE);

        $product_details = $this->invoice_model->pos_invoice_setup($product_id);
        $taxfield       = $this->db->select('tax_name,default_value')
                ->from('tax_settings')
                ->get()
                ->result_array();
           $prinfo = $this->db->select('*')->from('product_information')->where('product_id',$product_id)->get()->result_array();

        $tr = " ";
        if (!empty($product_details)) {
            $product_id = $this->generator(5);
            $serialdata =explode(',', $product_details->serial_no);
            if($product_details->total_product > 0){
              $qty = 1;
            }else{
                $qty = 0;
            }

            $this->db->select('SUM(quantity) as purchase_qty,batch_id,product_id');
            $this->db->from('product_purchase_details');
            $this->db->where('product_id', $product_details->product_id);
            $this->db->group_by('batch_id');
            $pur_product_batch = $this->db->get()->result();


        $html = "";
        if (empty($pur_product_batch)) {
            $html .="No Serial Found !";
        }else{
            // Select option created for product
            $html .="<select name=\"serial_no[]\"   class=\"serial_no_1 form-control\" required onchange=\"invoice_product_batch('" . $product_details->product_id . "')\" id=\"serial_no_".$product_details->product_id."\">";
                $html .= "<option value=''>".display('select_one')."</option>";
                foreach ($pur_product_batch as $p_batch) {


                    $sellt_prod_batch = $this->db->select('SUM(quantity) as sale_qty,batch_id, product_id')->from('invoice_details')->where('product_id', $p_batch->product_id)->where('batch_id', $p_batch->batch_id)->get()->row();
                    $pur_prod = (empty($sellt_prod_batch->sale_qty)?0:$sellt_prod_batch->sale_qty);
                    $available_prod = $p_batch->purchase_qty - $pur_prod;
                    if ($available_prod > 0) {
                        $html .="<option value=".$p_batch->batch_id.">".$p_batch->batch_id."</option>";
                    }
                }   
            $html .="</select>";
        }
            
            $tr .= "<tr id=\"row_" . $product_details->product_id . "\">
                        <td class=\"\" style=\"width:220px\">
                            
                            <input type=\"text\" name=\"product_name\" onkeypress=\"invoice_productList('" . $product_details->product_id . "');\" class=\"form-control productSelection \" value='" . $product_details->product_name . "- (" . $product_details->product_model . ")" . "' placeholder='" . display('product_name') . "' required=\"\"  tabindex=\"\" readonly>

                            <input type=\"hidden\" class=\"form-control autocomplete_hidden_value product_id_" . $product_details->product_id . "\" name=\"product_id[]\" id=\"SchoolHiddenId_" . $product_details->product_id . "\" value = \"$product_details->product_id\"/>
                        </td>
                        <td>".$html."</td>
                        <td>
                            <input type=\"text\" name=\"available_quantity[]\" class=\"form-control text-right available_quantity_" . $product_details->product_id . "\" value='' readonly=\"\" id=\"available_quantity_" . $product_details->product_id . "\"/>
                        </td>
                        <td>
                            <input type=\"text\" name=\"product_quantity[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" class=\"total_qntt_" . $product_details->product_id . " form-control text-right\" id=\"total_qntt_" . $product_details->product_id . "\" placeholder=\"0.00\" min=\"0\" value='" . $qty . "' required=\"required\"/>
                        </td>
                        <td style=\"width:85px\">
                            <input type=\"text\" name=\"product_rate[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" value='" . $product_details->price . "' id=\"price_item_" . $product_details->product_id . "\" class=\"price_item1 form-control text-right\" required placeholder=\"0.00\" min=\"0\"/>
                        </td>

                        <td class=\"\">
                            <input type=\"text\" name=\"discount[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" id=\"discount_" . $product_details->product_id . "\" class=\"form-control text-right\" placeholder=\"0.00\" min=\"0\"/>

                          
                        </td>
                        <td class=\"\">
                            <input type=\"text\" name=\"discountvalue[]\"  id=\"discount_value_" . $product_details->product_id . "\" class=\"form-control text-right\" placeholder=\"0.00\" min=\"0\" readonly/>
                        </td>
                        <td class=\"\">
                            <input type=\"text\" name=\"vatpercent[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" id=\"vat_percent_" . $product_details->product_id . "\" value='" . $product_details->product_vat . "' class=\"form-control text-right\" placeholder=\"0.00\" min=\"0\"/>

                        </td>
                        <td class=\"\">
                            <input type=\"text\" name=\"vatvalue[]\"  id=\"vat_value_" . $product_details->product_id . "\" class=\"form-control text-right total_vatamnt\" placeholder=\"0.00\" min=\"0\" readonly/>
                        </td>
                        <td class=\"text-right\" style=\"width:100px\">
                            <input class=\"total_price form-control text-right\" type=\"text\" name=\"total_price[]\" id=\"total_price_" . $product_details->product_id . "\" value='" . $product_details->price . "' tabindex=\"-1\" readonly=\"readonly\"/>
                        </td>

                        <td>";
                     
                            $sl=0;

                           $tr.="<input type=\"hidden\" id=\"total_discount_" . $product_details->product_id . "\" />
                            <input type=\"hidden\" id=\"all_discount_" . $product_details->product_id . "\" class=\"total_discount dppr\"/>
                            <a style=\"text-align: right;\" class=\"btn btn-danger btn-xs\" href=\"#\"  onclick=\"deleteRow(this,'".$product_details->product_id."')\">" . '<i class="fa fa-close"></i>' . "</a>
                             <a style=\"text-align: right;\" class=\"btn btn-success btn-xs\" href=\"#\"  onclick=\"detailsmodal('".$product_details->product_name."','".$product_details->total_product."','".$product_details->product_model."','".$product_details->unit."','".$product_details->price."','".$product_details->image."')\">" . '<i class="fa fa-eye"></i>' . "</a>
                        </td>
                    </tr>";
            echo $tr;
        } else {
            return false;
        }
    }
        public function gui_pos_invoice_dynamic() {
        $product_id = $this->input->post('product_id',TRUE);
        $pro_id = $this->input->post('product_id',TRUE);

        $product_details = $this->invoice_model->pos_invoice_setup($product_id);
        $taxfield       = $this->db->select('tax_name,default_value')
                ->from('tax_settings')
                ->get()
                ->result_array();
           $prinfo = $this->db->select('*')->from('product_information')->where('product_id',$product_id)->get()->result_array();

        $tr = " ";
        if (!empty($product_details)) {
            $product_id = $this->generator(5);
            $serialdata =explode(',', $product_details->serial_no);
            if($product_details->total_product > 0){
              $qty = 1;
            }else{
                $qty = 0;
            }

            $this->db->select('SUM(quantity) as purchase_qty,batch_id,product_id');
            $this->db->from('product_purchase_details');
            $this->db->where('product_id', $product_details->product_id);
            $this->db->group_by('batch_id');
            $pur_product_batch = $this->db->get()->result();


        $html = "";
        if (empty($pur_product_batch)) {
            $html .="No Serial Found !";
        }else{
            // Select option created for product
            $html .="<select name=\"serial_no[]\"   class=\"serial_no_1 form-control\" required onchange=\"invoice_product_batch('" . $product_details->product_id . "')\" id=\"serial_no_".$product_details->product_id."\">";
                $html .= "<option value=''>".display('select_one')."</option>";
                foreach ($pur_product_batch as $p_batch) {


                    $sellt_prod_batch = $this->db->select('SUM(quantity) as sale_qty,batch_id, product_id')->from('invoice_details')->where('product_id', $p_batch->product_id)->where('batch_id', $p_batch->batch_id)->get()->row();
                    $pur_prod = (empty($sellt_prod_batch->sale_qty)?0:$sellt_prod_batch->sale_qty);
                    $available_prod = $p_batch->purchase_qty - $pur_prod;
                    if ($available_prod > 0) {
                        # code...
                        $html .="<option value=".$p_batch->batch_id.">".$p_batch->batch_id."</option>";
                    }
                }   
            $html .="</select>";
        }
            
            $tr .= "<tr id=\"row_" . $product_details->product_id . "\">
                        <td class=\"\" style=\"width:220px\">
                            
                            <input type=\"text\" name=\"product_name\" onkeypress=\"invoice_productList('" . $product_details->product_id . "');\" class=\"form-control productSelection \" value='" . $product_details->product_name . "- (" . $product_details->product_model . ")" . "' placeholder='" . display('product_name') . "' required=\"\"  tabindex=\"\" readonly>

                            <input type=\"hidden\" class=\"form-control autocomplete_hidden_value product_id_" . $product_details->product_id . "\" name=\"product_id[]\" id=\"SchoolHiddenId_" . $product_details->product_id . "\" value = \"$product_details->product_id\"/>
                        </td>
                        <td>".$html."</td>
                        <td>
                            <input type=\"text\" name=\"available_quantity[]\" class=\"form-control text-right available_quantity_" . $product_details->product_id . "\" value='' readonly=\"\" id=\"available_quantity_" . $product_details->product_id . "\"/>
                        </td>
                        <td>
                            <input type=\"text\" name=\"product_quantity[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" class=\"total_qntt_" . $product_details->product_id . " form-control text-right\" id=\"total_qntt_" . $product_details->product_id . "\" placeholder=\"0.00\" min=\"0\" value='" . $qty . "' required=\"required\"/>
                        </td>
                        <td style=\"width:85px\">
                            <input type=\"text\" name=\"product_rate[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" value='" . $product_details->price . "' id=\"price_item_" . $product_details->product_id . "\" class=\"price_item1 form-control text-right\" required placeholder=\"0.00\" min=\"0\"/>
                        </td>

                        <td class=\"\">
                            <input type=\"text\" name=\"discount[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" id=\"discount_" . $product_details->product_id . "\" class=\"form-control text-right\" placeholder=\"0.00\" min=\"0\"/>

                          
                        </td>
                        <td class=\"\">
                            <input type=\"text\" name=\"discountvalue[]\"  id=\"discount_value_" . $product_details->product_id . "\" class=\"form-control text-right\" placeholder=\"0.00\" min=\"0\" readonly/>
                        </td>
                        
                        <td class=\"text-right\" style=\"width:100px\">
                            <input class=\"total_price form-control text-right\" type=\"text\" name=\"total_price[]\" id=\"total_price_" . $product_details->product_id . "\" value='" . $product_details->price . "' tabindex=\"-1\" readonly=\"readonly\"/>
                        </td>

                        <td>";
                     
                            $sl=0;
                        foreach ($taxfield as $taxes) {
                            $txs = 'tax'.$sl;
                           $tr .= "<input type=\"hidden\" id=\"total_tax".$sl."_" . $product_details->product_id . "\" class=\"total_tax".$sl."_" . $product_details->product_id . "\" value='" . $prinfo[0][$txs] . "'/>
                            <input type=\"hidden\" id=\"all_tax".$sl."_" . $product_details->product_id . "\" class=\" total_tax".$sl."\" value='" . $prinfo[0][$txs]*$product_details->price . "' name=\"tax[]\"/>";  
                       $sl++; }

                           $tr.="<input type=\"hidden\" id=\"total_discount_" . $product_details->product_id . "\" />
                            <input type=\"hidden\" id=\"all_discount_" . $product_details->product_id . "\" class=\"total_discount dppr\"/>
                            <a style=\"text-align: right;\" class=\"btn btn-danger btn-xs\" href=\"#\"  onclick=\"deleteRow(this,'".$product_details->product_id."')\">" . '<i class="fa fa-close"></i>' . "</a>
                             <a style=\"text-align: right;\" class=\"btn btn-success btn-xs\" href=\"#\"  onclick=\"detailsmodal('".$product_details->product_name."','".$product_details->total_product."','".$product_details->product_model."','".$product_details->unit."','".$product_details->price."','".$product_details->image."')\">" . '<i class="fa fa-eye"></i>' . "</a>
                        </td>
                    </tr>";
            echo $tr;
        } else {
            return false;
        }
    }


        //Insert pos invoice
    public function insert_pos_invoice() {
        $product_id      = $this->input->post('product_id',TRUE);
        $product_details = $this->invoice_model->pos_invoice_setup($product_id);
        $taxfield = $this->db->select('tax_name,default_value')
                ->from('tax_settings')
                ->get()
                ->result_array();
           $prinfo = $this->db->select('*')->from('product_information')->where('product_id',$product_id)->get()->result_array();
        $tr = " ";
        if (!empty($product_details)) {
            $product_id = $this->generator(5);
            $serialdata =explode(',', $product_details->serial_no);
            if($product_details->total_product > 0){
              $qty = 1;
            }else{
                $qty = 1;
            }

        $html = "";
        if (empty($serialdata)) {
            $html .="No Serial Found !";
        }else{
            // Select option created for product
            $html .="<select name=\"serial_no[]\"   class=\"serial_no_1 form-control\" id=\"serial_no_" . $product_details->product_id . "\">";
                $html .= "<option value=''>".display('select_one')."</option>";
                foreach ($serialdata as $serial) {
                    $html .="<option value=".$serial.">".$serial."</option>";
                }   
            $html .="</select>";
        }
            
            $tr .= "<tr id=\"row_" . $product_details->product_id . "\">
                        <td class=\"\" style=\"width:220px\">
                            
                            <input type=\"text\" name=\"product_name\" onkeypress=\"invoice_productList('" . $product_details->product_id . "');\" class=\"form-control productSelection \" value='" . $product_details->product_name . "- (" . $product_details->product_model . ")" . "' placeholder='" . display('product_name') . "' required=\"\" id=\"product_name_" . $product_details->product_id . "\" tabindex=\"\" readonly>

                            <input type=\"hidden\" class=\"form-control autocomplete_hidden_value product_id_" . $product_details->product_id . "\" name=\"product_id[]\" id=\"SchoolHiddenId_" . $product_details->product_id . "\" value = \"$product_details->product_id\"/>
                            
                        </td>
                         <td>
                             <input type=\"text\" name=\"desc[]\" class=\"form-control text-right \"  />
                                        </td>
                                        <td>".$html."</td>
                        <td>
                            <input type=\"text\" name=\"available_quantity[]\" class=\"form-control text-right available_quantity_" . $product_details->product_id . "\" value='" . $product_details->total_product . "' readonly=\"\" id=\"available_quantity_" . $product_details->product_id . "\"/>
                        </td>

                        <td>
                            <input class=\"form-control text-right unit_'" . $product_details->product_id . "' valid\" value=\"$product_details->unit\" readonly=\"\" aria-invalid=\"false\" type=\"text\">
                        </td>
                    
                        <td>
                            <input type=\"text\" name=\"product_quantity[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" class=\"total_qntt_" . $product_details->product_id . " form-control text-right\" id=\"total_qntt_" . $product_details->product_id . "\" placeholder=\"0.00\" min=\"0\" value='" . $qty . "'/>
                        </td>

                        <td style=\"width:85px\">
                            <input type=\"text\" name=\"product_rate[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" value='" . $product_details->price . "' id=\"price_item_" . $product_details->product_id . "\" class=\"price_item1 form-control text-right\" required placeholder=\"0.00\" min=\"0\"/>
                        </td>

                        <td class=\"\">
                            <input type=\"text\" name=\"discount[]\" onkeyup=\"quantity_calculate('" . $product_details->product_id . "');\" onchange=\"quantity_calculate('" . $product_details->product_id . "');\" id=\"discount_" . $product_details->product_id . "\" class=\"form-control text-right\" placeholder=\"0.00\" min=\"0\"/>

                           
                        </td>

                        <td class=\"text-right\" style=\"width:100px\">
                            <input class=\"total_price form-control text-right\" type=\"text\" name=\"total_price[]\" id=\"total_price_" . $product_details->product_id . "\" value='" . $product_details->price . "' tabindex=\"-1\" readonly=\"readonly\"/>
                        </td>

                        <td>";
                        $sl=0;
                        foreach ($taxfield as $taxes) {
                            $txs = 'tax'.$sl;
                           $tr .= "<input type=\"hidden\" id=\"total_tax".$sl."_" . $product_details->product_id . "\" class=\"total_tax".$sl."_" . $product_details->product_id . "\" value='" . $prinfo[0][$txs] . "'/>
                            <input type=\"hidden\" id=\"all_tax".$sl."_" . $product_details->product_id . "\" class=\" total_tax".$sl."\" value='" . $prinfo[0][$txs]*$product_details->price . "' name=\"tax[]\"/>";  
                       $sl++; }
                        
                             $tr .= "<input type=\"hidden\" id=\"total_discount_" . $product_details->product_id . "\" />
                            <input type=\"hidden\" id=\"all_discount_" . $product_details->product_id . "\" class=\"total_discount dppr\"/>
                            <button  class=\"btn btn-danger btn-xs text-center\" type=\"button\"  onclick=\"deleteRow(this)\">" . '<i class="fa fa-close"></i>' . "</button>
                        </td>
                    </tr>";
            echo $tr;
        } else {
            return false;
        }
    }

    public function invoice_inserted_data_manual(){
        $data['title']      = display('invoice_print');
        $invoice_id         = $this->input->post('invoice_id',TRUE);
        $invoice_detail     = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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
        $isunit            = 0;
        if (!empty($invoice_detail)) {
            foreach ($invoice_detail as $k => $v) {
                $invoice_detail[$k]['final_date'] = $invoice_detail[$k]['date'];
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
   
            }
        }


        $payment_method_list = $this->invoice_model->invoice_method_wise_balance($invoice_id);
        $terms_list = $this->db->select('*')->from('seles_termscondi')->where('status', 1)->get()->result(); 
        $totalbal      = $invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'];
        $amount_inword = $totalbal;
        $user_id       = $invoice_detail[0]['sales_by'];
        $users         = $this->invoice_model->user_invoice_data($user_id);
        $data = array(
        'title'             => display('invoice_details'),
        'invoice_id'        => $invoice_detail[0]['invoice_id'],
        'invoice_no'        => $invoice_detail[0]['invoice'],
        'customer_name'     => $invoice_detail[0]['customer_name'],
        'customer_address'  => $invoice_detail[0]['customer_address'],
        'customer_mobile'   => $invoice_detail[0]['customer_mobile'],
        'customer_email'    => $invoice_detail[0]['customer_email'],
        'final_date'        => $invoice_detail[0]['final_date'],
        'invoice_details'   => $invoice_detail[0]['invoice_details'],
        'total_amount'      => number_format($invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'], 2, '.', ','),
        'grand_total'       => $invoice_detail[0]['total_amount'],
        'subTotal_quantity' => $subTotal_quantity,
        'total_discount'    => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_tax'         => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
        'subTotal_ammount'  => number_format($subTotal_ammount, 2, '.', ','),
        'paid_amount'       => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
        'due_amount'        => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
        'previous'          => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
        'shipping_cost'     => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
        'invoice_all_data'  => $invoice_detail,
        'am_inword'         => $amount_inword,
        'is_discount'       => $invoice_detail[0]['total_discount']-$invoice_detail[0]['invoice_discount'],
        'users_name'        => $users->first_name.' '.$users->last_name,
        'tax_regno'         => $txregname,
        'is_desc'           => $descript,
        'is_serial'         => $isserial,
        'is_unit'           => $isunit,
        'all_discount'         => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'p_method_list'        => $payment_method_list,
        'terms_list'           => $terms_list,
        'total_vat'            => number_format($invoice_detail[0]['total_vat_amnt'] + $invoice_detail[0]['total_tax'], 2, '.', ','),
        );
        $data['module']     = "invoice";
        $data['page']       = "invoice_html_manual"; 
        echo modules::run('template/layout', $data);
    }
   /*invoice no generator*/
      public function number_generator() {
        $this->db->select_max('invoice', 'invoice_no');
        $query      = $this->db->get('invoice');
        $result     = $query->result_array();
        $invoice_no = $result[0]['invoice_no'];
        if ($invoice_no != '') {
            $invoice_no = $invoice_no + 1;
        } else {
            $invoice_no = 1000;
        }
        return $invoice_no;
    }

 public function bdtask_customer_autocomplete(){
        $customer_id    = $this->input->post('customer_id',TRUE);
        $customer_info  = $this->invoice_model->customer_search($customer_id);

        $list[''] = '';
        foreach ($customer_info as $value) {
            $json_customer[] = array('label'=>$value['customer_name'],'value'=>$value['customer_id']);
        } 
        echo json_encode($json_customer);
    }

     /*product autocomple search*/
        public function bdtask_autocomplete_product(){
        $product_name   = $this->input->post('product_name',TRUE);
        $product_info   = $this->invoice_model->autocompletproductdata($product_name);
       if(!empty($product_info)){
        $list[''] = '';
        foreach ($product_info as $value) {
            $json_product[] = array('label'=>$value['product_name'].'('.$value['product_model'].')','value'=>$value['product_id']);
        } 
    }else{
        $json_product[] = 'No Product Found';
        }
        echo json_encode($json_product);
    
    }
     
     /*after selecting product retrieve product info*/
        public function retrieve_product_data_inv() {
        $product_id   = $this->input->post('product_id',TRUE);
        $product_info = $this->invoice_model->get_total_product_invoic($product_id);
        echo json_encode($product_info);
        }
        public function bdtask_batchwise_productprice() {
        $product_id   = $this->input->post('prod_id',TRUE);
        $batch_no   = $this->input->post('batch_no',TRUE);

        $this->db->select('sum(quantity) as purchase_qty,batch_id,product_id');
        $this->db->from('product_purchase_details');
        $this->db->where('product_id', $product_id);
        $this->db->where('batch_id', $batch_no);
        $pur_product_batch = $this->db->get()->row();

        $sellt_prod_batch = $this->db->select('sum(quantity) as sale_qty,batch_id, product_id')
        ->from('invoice_details')->where('product_id', $product_id)
        ->where('batch_id', $batch_no)
        ->get()
        ->row();
        

        $batch_wise_stock =  (!empty($pur_product_batch->purchase_qty)?$pur_product_batch->purchase_qty:0)-(!empty($sellt_prod_batch->sale_qty)?$sellt_prod_batch->sale_qty:0);
        echo sprintf('%0.2f',$batch_wise_stock);
        
        }

        

    /*after select customer retrieve customer previous balance*/
        public function previous() {
        $customer_id = $this->input->post('customer_id',TRUE);
        $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)) as balance");
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         $this->db->where('a.customer_id',$customer_id);
        $result = $this->db->get()->result_array();
       $balance = $result[0]['balance'];   
       $b = (!empty($balance)?$balance:0);                            
        if ($b){
           echo  $b;
        } else {
           echo  $b;
        }
    }



    public function instant_customer(){
     
        $data = array(
            'customer_name'    => $this->input->post('customer_name',TRUE),
            'customer_address' => $this->input->post('address',TRUE),
            'customer_mobile'  => $this->input->post('mobile',TRUE),
            'customer_email'   => $this->input->post('email',TRUE),
            'status'           => 1
        );

        $result = $this->db->insert('customer_information',$data);
        if ($result) {

        $customer_id = $this->db->insert_id();
       
        //Customer  basic information adding.
        $coa = $this->customer_model->headcode();
            if($coa->HeadCode!=NULL){
                $headcode=$coa->HeadCode+1;
            }else{
                $headcode="102030001";
            }
        $c_acc      = $customer_id.'-'.$this->input->post('customer_name',TRUE);
        $createby   = $this->session->userdata('id');
        $createdate = date('Y-m-d H:i:s');

        $customer_coa = [
            'HeadCode'         => $headcode,
            'HeadName'         => $c_acc,
            'PHeadName'        => 'Customer Receivable',
            'HeadLevel'        => '4',
            'IsActive'         => '1',
            'IsTransaction'    => '1',
            'IsGL'             => '0',
            'HeadType'         => 'A',
            'IsBudget'         => '0',
            'IsDepreciation'   => '0',
            'customer_id'      => $customer_id,
            'DepreciationRate' => '0',
            'CreateBy'         => $createby,
            'CreateDate'       => $createdate,
        ];
            //Previous balance adding -> Sending to customer model to adjust the data.
            // $this->db->insert('acc_coa',$customer_coa);

        $sub_acc = [
            'subTypeId'   => 3,
            'name'        => $data['customer_name'],
            'referenceNo' => $customer_id,
            'status'      => 1,
            'created_date'=> date("Y-m-d"),
            
        ];
        $this->db->insert('acc_subcode',$sub_acc);
           
            
          
            $data['status']        = true;
            $data['message']       = display('save_successfully');
            $data['customer_id']   = $customer_id;
            $data['customer_name'] = $data['customer_name'];
        } else {
            $data['status'] = false;
            $data['exception'] = display('please_try_again');
        }
        echo json_encode($data);
    }



            public function bdtask_invoice_details_directprint($invoice_id = null){
         $invoice_detail     = $this->invoice_model->retrieve_invoice_html_data($invoice_id);
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
        $isunit            = 0;
        if (!empty($invoice_detail)) {
            foreach ($invoice_detail as $k => $v) {
                $invoice_detail[$k]['final_date'] = $invoice_detail[$k]['date'];
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
   
            }
        }


        $totalbal = $invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'];
        $amount_inword     = $totalbal;
        $user_id           = $invoice_detail[0]['sales_by'];
        $users             = $this->invoice_model->user_invoice_data($user_id);
        $company_info      = $this->invoice_model->retrieve_company();
        $currency_details  = $this->invoice_model->retrieve_setting_editdata();
        $data = array(
        'title'             => display('invoice_details'),
        'invoice_id'        => $invoice_detail[0]['invoice_id'],
        'invoice_no'        => $invoice_detail[0]['invoice'],
        'customer_name'     => $invoice_detail[0]['customer_name'],
        'customer_address'  => $invoice_detail[0]['customer_address'],
        'customer_mobile'   => $invoice_detail[0]['customer_mobile'],
        'customer_email'    => $invoice_detail[0]['customer_email'],
        'final_date'        => $invoice_detail[0]['final_date'],
        'invoice_details'   => $invoice_detail[0]['invoice_details'],
        'total_amount'      => number_format($invoice_detail[0]['total_amount']+$invoice_detail[0]['prevous_due'], 2, '.', ','),
        'subTotal_quantity' => $subTotal_quantity,
        'total_discount'    => number_format($invoice_detail[0]['total_discount'], 2, '.', ','),
        'total_tax'         => number_format($invoice_detail[0]['total_tax'], 2, '.', ','),
        'subTotal_ammount'  => number_format($subTotal_ammount, 2, '.', ','),
        'paid_amount'       => number_format($invoice_detail[0]['paid_amount'], 2, '.', ','),
        'due_amount'        => number_format($invoice_detail[0]['due_amount'], 2, '.', ','),
        'previous'          => number_format($invoice_detail[0]['prevous_due'], 2, '.', ','),
        'shipping_cost'     => number_format($invoice_detail[0]['shipping_cost'], 2, '.', ','),
        'invoice_all_data'  => $invoice_detail,
        'am_inword'         => $amount_inword,
        'is_discount'       => $invoice_detail[0]['total_discount']-$invoice_detail[0]['invoice_discount'],
        'users_name'        => $users->first_name.' '.$users->last_name,
        'tax_regno'         => $txregname,
        'is_desc'           => $descript,
        'is_serial'         => $isserial,
        'is_unit'           => $isunit,
        'discount_type'     => $currency_details[0]['discount_type'],
        'company_info'      => $company_info,
        'logo'              => $currency_details[0]['invoice_logo'],
        'position'          => $currency_details[0]['currency_position'],
        'currency'          => $currency_details[0]['currency'],
        );
       return $data;
    }


       public function generator($lenth)
    {
        $number=array("A","B","C","D","E","F","G","H","I","J","K","L","N","M","O","P","Q","R","S","U","V","T","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0");
    
        for($i=0; $i<$lenth; $i++)
        {
            $rand_value=rand(0,34);
            $rand_number=$number["$rand_value"];
        
            if(empty($con))
            { 
            $con=$rand_number;
            }
            else
            {
            $con="$con"."$rand_number";}
        }
        return $con;
    }

   /*invoice no generator*/
      public function number_generator_ajax() {
        $this->db->select_max('invoice', 'invoice_no');
        $query      = $this->db->get('invoice');
        $result     = $query->result_array();
        $invoice_no = $result[0]['invoice_no'];
        if ($invoice_no != '') {
            $invoice_no = $invoice_no + 1;
        } else {
            $invoice_no = 1000;
        }
        echo  $invoice_no;
    }

    // category part
    function bdtask_terms_list() {
        $data['title']      = display('terms_list');
        $data['module']     = "invoice";
        $data['page']       = "terms_list"; 
        $data["allterms_list"] = $this->invoice_model->allterms_list();
        echo modules::run('template/layout', $data);
    }


      public function bdtask_terms_form($id = null)
    {
        $data['title'] = display('terms_add');
        #-------------------------------#
        $this->form_validation->set_rules('term_condi',display('term_condi'),'required');
        $this->form_validation->set_rules('status', display('status') ,'max_length[2]');
        #-------------------------------#
        $data['single_terms'] = (object)$postData = [
            'id'          =>$id,
            'description' => $this->input->post('term_condi',true),
            'status'      => $this->input->post('status',true),
        ]; 
        #-------------------------------#
        if ($this->form_validation->run() === true) {

            #if empty $id then insert data
            if (empty($id)) {
                if ($this->invoice_model->create_terms($postData)) {
                    #set success message
                   $this->session->set_flashdata('message', display('save_successfully'));
                } else {
                 $this->session->set_flashdata('exception', display('please_try_again'));
                }
                
                redirect("terms_list");
           
            } else {
                if ($this->invoice_model->update_terms($postData)) {
                   $this->session->set_flashdata('message', display('update_successfully'));
                } else {
                  $this->session->set_flashdata('exception', display('please_try_again'));
                } 
                redirect("terms_list");
            
            }
            } else { 
                if(!empty($id)){
                $data['title']    = display('terms_update');
                $data['single_terms'] = $this->invoice_model->single_terms_data($id);  
                }
                
                $data['module']   = "invoice";  
                $data['page']     = "terms_form";
                echo Modules::run('template/layout', $data); 
           
            } 
    }



    public function bdtask_terms($id = null) {
        if ($this->invoice_model->delete_terms($id)) {
      $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
       $this->session->set_flashdata('exception', display('please_try_again'));
        }

        redirect("terms_list");
    }
}

