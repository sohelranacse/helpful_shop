<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Purchase extends MX_Controller {

    public function __construct()
    {
        parent::__construct();
        // $this->output->enable_profiler(TRUE);
  
        $this->load->model(array(
            'purchase_model',
            'account/Accounts_model'
        )); 
        if (! $this->session->userdata('isLogIn'))
            redirect('login');
          
    }
   
    function product_by_supplier_id($supplier_id, $count){
        $data['supplier_id'] = $supplier_id;
        $data['count'] = $count;
        $data['product_list'] = $this->purchase_model->get_product_by_supplier_id($supplier_id);
        $this->load->view('purchase/get_product_by_supplier_id', $data);
    }
    function purchase_form() {
        $data['title']       = display('add_purchase');
        $data['all_supplier']= $this->purchase_model->supplier_list();
        $data['payment_method'] = $this->purchase_model->get_payment_method();
        $data['warehouse_list'] = $this->purchase_model->warehouse_list();
        $data['module']      = "purchase";
        $data['page']        = "add_purchase_form";
        echo modules::run('template/layout', $data);
    }
    function purchase_edit_form($purchase_id){
        $data['title']       = display('purchase_edit');
        $data['info'] = $this->purchase_model->retrieve_purchase_info_data($purchase_id);
        $data['detail'] = $this->purchase_model->retrieve_purchase_detail_data($purchase_id);
        $data['all_supplier']= $this->purchase_model->supplier_list();
        $data['payment_method'] = $this->purchase_model->get_payment_method();
        $data['warehouse_list'] = $this->purchase_model->warehouse_list();
        $data['module']         = "purchase";
        $data['page']           = "edit_purchase_form"; 
        echo modules::run('template/layout', $data);
    }

    public function showpaymentmodal(){
        $is_credit =  $this->input->post('is_credit_edit',TRUE);
        $data['is_credit'] = $is_credit;
        if ($is_credit == 1) {
            # code...
            $data['all_pmethod'] = $this->purchase_model->pmethod_dropdown();
        }else{

            $data['all_pmethod'] = $this->purchase_model->pmethod_dropdown_new();
        }
        $this->load->view('purchase/newpaymentveiw',$data); 
    }

    public function purchase_list(){
        $data['title']      = display('manage_purchase');
        $data['total_purhcase']= $this->purchase_model->count_purchase();
        $data['module']     = "purchase";
        $data['page']       = "purchase"; 
        echo modules::run('template/layout', $data);
    }


    public function purchase_details($purchase_id = null){
        $purchase_detail = $this->purchase_model->purchase_details_data($purchase_id);

        if (!empty($purchase_detail)) {
            $i = 0;
            foreach ($purchase_detail as $k => $v) {
                $i++;
                $purchase_detail[$k]['sl'] = $i;
            }

            foreach ($purchase_detail as $k => $v) {
                $purchase_detail[$k]['convert_date'] = $purchase_detail[$k]['purchase_date'];
            }
        }

        $data = array(
            'title'            => display('purchase_details'),
            'purchase_id'      => $purchase_detail[0]['purchase_id'],
            'purchase_details' => $purchase_detail[0]['purchase_details'],
            'supplier_name'    => $purchase_detail[0]['supplier_name'],
            'address'          => $purchase_detail[0]['address'],
            'mobile'           => $purchase_detail[0]['mobile'],
            'vat_no'           => $purchase_detail[0]['email_address'],
            'final_date'       => $purchase_detail[0]['convert_date'],
            'order_time'       => $purchase_detail[0]['added_on'],
            'sub_total_amount' => number_format($purchase_detail[0]['grand_total_amount'], 2, '.', ','),
            'chalan_no'        => $purchase_detail[0]['chalan_no'],
            'total'            =>  number_format($purchase_detail[0]['grand_total_amount']+(!empty($purchase_detail[0]['total_discount'])?$purchase_detail[0]['total_discount']:0), 2),
            'discount'         => number_format((!empty($purchase_detail[0]['total_discount'])?$purchase_detail[0]['total_discount']:0),2),
            'invoice_discount' => number_format((!empty($purchase_detail[0]['invoice_discount'])?$purchase_detail[0]['invoice_discount']:0),2),
            'ttl_val'          => number_format((!empty($purchase_detail[0]['total_vat_amnt'])?$purchase_detail[0]['total_vat_amnt']:0),2),
            'paid_amount'      => number_format($purchase_detail[0]['paid_amount'],2),
            'due_amount'      => number_format($purchase_detail[0]['due_amount'],2),
            'purchase_all_data'=> $purchase_detail,
        );
        $data['module']     = "purchase";
        $data['page']       = "purchase_detail"; 
        echo modules::run('template/layout', $data);
    }

    public function purchase_edit_form_old($purchase_id = null){
        $purchase_detail = $this->purchase_model->retrieve_purchase_editdata($purchase_id);
        $supplier_id = $purchase_detail[0]['supplier_id'];
        $supplier_list = $this->purchase_model->supplier_list();
       
        if (!empty($purchase_detail)) {
            $i = 0;
            foreach ($purchase_detail as $k => $v) {
                $i++;
                $purchase_detail[$k]['sl'] = $i;
            }
        }
        $multi_pay_data = $this->db->select('RevCodde, Debit')
                        ->from('acc_vaucher')
                        ->where('referenceNo',$purchase_detail[0]['purchase_id'])
                        ->get()->result();

            

        $data = array(
            'title'             => display('purchase_edit'),
            'dbpurs_id'         => $purchase_detail[0]['dbpurs_id'],
            'purchase_id'       => $purchase_detail[0]['purchase_id'],
            'chalan_no'         => $purchase_detail[0]['chalan_no'],
            'supplier_name'     => $purchase_detail[0]['supplier_name'],
            'supplier_id'       => $purchase_detail[0]['supplier_id'],
            'grand_total'       => $purchase_detail[0]['grand_total_amount'],
            'purchase_details'  => $purchase_detail[0]['purchase_details'],
            'purchase_date'     => $purchase_detail[0]['purchase_date'],
            'total_discount'    => $purchase_detail[0]['total_discount'],
            'invoice_discount'  => $purchase_detail[0]['invoice_discount'],
            'total_vat_amnt'    => $purchase_detail[0]['total_vat_amnt'],
            'total'             => number_format($purchase_detail[0]['grand_total_amount'] + (!empty($purchase_detail[0]['total_discount'])?$purchase_detail[0]['total_discount']:0),2),
            'bank_id'           =>  $purchase_detail[0]['bank_id'],
            'purchase_info'     => $purchase_detail,
            'supplier_list'     => $supplier_list,
            'paid_amount'       => $purchase_detail[0]['paid_amount'],
            'due_amount'        => $purchase_detail[0]['due_amount'],
            'multi_paytype'     => $multi_pay_data,
            'is_credit'         => $purchase_detail[0]['is_credit'],
        );
        
        $data['all_pmethod']    = $this->purchase_model->pmethod_dropdown_new();

        
        $data['all_pmethodwith_cr'] = $this->purchase_model->pmethod_dropdown();
        $data['module']         = "purchase";
        $data['page']           = "edit_purchase_form"; 
        echo modules::run('template/layout', $data);
    }

    public function CheckPurchaseList(){
        $postData  = $this->input->post();
        $data = $this->purchase_model->getPurchaseList($postData);
        echo json_encode($data);
    }

    public function save_purchase(){
        if(!empty($_POST)){
            $this->form_validation->set_rules('warehouse_id', display('warehouse') ,'required|max_length[15]');
            $this->form_validation->set_rules('supplier_id', display('supplier') ,'required|max_length[15]');
            $this->form_validation->set_rules('payment_method_id', display('payment_method') ,'required|max_length[15]');
            $this->form_validation->set_rules('purchase_date', display('purchase_date') ,'required|max_length[15]');
            $this->form_validation->set_rules('chalan_no', display('invoice_no') ,'required|max_length[20]|is_unique[product_purchase.chalan_no]');
            $this->form_validation->set_rules('product_id[]',display('product'),'required|max_length[20]');
            $this->form_validation->set_rules('product_quantity[]',display('quantity'),'required|max_length[20]');
            $this->form_validation->set_rules('product_rate[]',display('rate'),'required|max_length[20]');
            
            if ($this->form_validation->run() === true) {
                $purchase_data = $this->purchase_model->insert_purchase();

                if ($purchase_data == 1) {
                   
                    $this->session->set_flashdata('message', display('save_successfully'));
                    redirect("purchase_list");
                } else {
                   
                    $this->session->set_flashdata('exception', display('ooops_something_went_wrong'));
                    redirect("add_purchase");
                }

            } else {
                $this->session->set_flashdata('exception', validation_errors());
                redirect("add_purchase");
            }
        }
    }

    public function update_purchase($id) {
        if(!empty($_POST)){
            $this->form_validation->set_rules('id', display('id') ,'required|max_length[15]');
            $this->form_validation->set_rules('warehouse_id', display('warehouse') ,'required|max_length[15]');
            $this->form_validation->set_rules('supplier_id', display('supplier') ,'required|max_length[15]');
            $this->form_validation->set_rules('payment_method_id', display('payment_method') ,'required|max_length[15]');
            $this->form_validation->set_rules('purchase_date', display('purchase_date') ,'required|max_length[15]');
            $this->form_validation->set_rules('chalan_no', display('invoice_no') ,'required|max_length[20]');
            $this->form_validation->set_rules('product_id[]',display('product'),'required|max_length[20]');
            $this->form_validation->set_rules('product_quantity[]',display('quantity'),'required|max_length[20]');
            $this->form_validation->set_rules('product_rate[]',display('rate'),'required|max_length[20]');
            
            if ($this->form_validation->run() === true) {
                $purchase_data = $this->purchase_model->update_purchase();

                if ($purchase_data == 1) {
                   
                    $this->session->set_flashdata('message', display('update_successfully'));
                    redirect("purchase_list");
                } else {
                   
                    $this->session->set_flashdata('exception', display('ooops_something_went_wrong'));
                    redirect("purchase_edit/".$id);
                }

            } else {
                $this->session->set_flashdata('exception', validation_errors());
                redirect("purchase_edit/".$id);
            }
        }
    }

    

    
    
    public function update_purchase_old() {
    $purchase_id  = $this->input->post('purchase_id',TRUE);
    $dbpurs_id    = $this->input->post('dbpurs_id',TRUE);
    $this->form_validation->set_rules('supplier_id', display('supplier') ,'required|max_length[15]');
    $this->form_validation->set_rules('chalan_no', display('invoice_no') ,'required|max_length[20]');
    $this->form_validation->set_rules('product_id[]',display('product'),'required|max_length[20]');
    $this->form_validation->set_rules('multipaytype[]',display('payment_type'),'required');
    $this->form_validation->set_rules('product_quantity[]',display('quantity'),'required|max_length[20]');
    $this->form_validation->set_rules('product_rate[]',display('rate'),'required|max_length[20]');
    $finyear = $this->input->post('finyear',true);
    if($finyear<=0){
        $this->session->set_flashdata('exception', 'Please Create Financial Year First');
        redirect("add_purchase");
    }else {

        if ($this->form_validation->run() === true) {
            
            $paid_amount  = $this->input->post('paid_amount',TRUE);
            $due_amount   = $this->input->post('due_amount',TRUE);
            $bank_id      = $this->input->post('bank_id',TRUE);
                if(!empty($bank_id)){
            $bankname = $this->db->select('bank_name')->from('bank_add')->where('bank_id',$bank_id)->get()->row()->bank_name;
            $bankcoaid   = $this->db->select('HeadCode')->from('acc_coa')->where('HeadName',$bankname)->get()->row()->HeadCode;
            }
            $p_id        = $this->input->post('product_id',TRUE);
            $supplier_id = $this->input->post('supplier_id',TRUE);
            $supinfo     = $this->db->select('*')->from('supplier_information')->where('supplier_id',$supplier_id)->get()->row();
            $sup_head    = $supinfo->supplier_id.'-'.$supinfo->supplier_name;
            $sup_coa     = $this->db->select('*')->from('acc_coa')->where('HeadName',$sup_head)->get()->row();
            $receive_by  = $this->session->userdata('id');
            $receive_date= date('Y-m-d');
            $createdate  = date('Y-m-d H:i:s');
            $multipayamount = $this->input->post('pamount_by_method',TRUE);
            $multipaytype = $this->input->post('multipaytype',TRUE);

            if ($multipaytype[0] == 0) {
                $is_credit = 1;
            }
            else {
                $is_credit = '';
            }
            $data = array(
                'purchase_id'        => $purchase_id,
                'chalan_no'          => $this->input->post('chalan_no',TRUE),
                'supplier_id'        => $this->input->post('supplier_id',TRUE),
                'grand_total_amount' => $this->input->post('grand_total_price',TRUE),
                'total_discount'     => $this->input->post('discount',TRUE),
                'invoice_discount'   => $this->input->post('total_discount',TRUE),
                'total_vat_amnt'     => $this->input->post('total_vat_amnt',TRUE),
                'purchase_date'      => $this->input->post('purchase_date',TRUE),
                'purchase_details'   => $this->input->post('purchase_details',TRUE),
                'paid_amount'        => $paid_amount,
                'due_amount'         => $due_amount,
                'bank_id'           =>  $this->input->post('bank_id',TRUE),
                'payment_type'       =>  1,
                'is_credit'          =>  $is_credit,
            );
        
            
            $predefine_account  = $this->db->select('*')->from('acc_predefine_account')->get()->row();
            $Narration          = "Purchase Voucher";
            $Comment            = "Purchase Voucher for supplier";
            $COAID              = $predefine_account->purchaseCode;

            if ($purchase_id != '') {
                $this->db->where('id', $dbpurs_id);
                $this->db->update('product_purchase', $data);

                //account transaction update
                $this->db->where('referenceNo', $purchase_id);
                $this->db->delete('acc_vaucher');

                $this->db->where('purchase_id', $dbpurs_id);
                $this->db->delete('product_purchase_details');
            }


            $multipayamount = $this->input->post('pamount_by_method',TRUE);
            $multipaytype = $this->input->post('multipaytype',TRUE);
            
            if($multipaytype && $multipayamount){

                if ($multipaytype[0] == 0) {
                    
                    $amount_pay = $data['grand_total_amount'];
                    $amnt_type = 'Credit';
                    $reVID     = $predefine_account->supplierCode;
                    $subcode   = $this->db->select('*')->from('acc_subcode')->where('referenceNo', $supplier_id)->where('subTypeId', 4)->get()->row()->id;
                    $insrt_pay_amnt_vcher = $this->insert_purchase_debitvoucher($is_credit,$purchase_id,$COAID,$amnt_type,$amount_pay,$Narration,$Comment,$reVID,$subcode);

                }else {
                    $amnt_type = 'Debit';
                    for ($i=0; $i < count($multipaytype); $i++) {

                        $reVID = $multipaytype[$i];
                        $amount_pay = $multipayamount[$i];

                        $insrt_pay_amnt_vcher = $this->insert_purchase_debitvoucher($is_credit,$purchase_id,$COAID,$amnt_type,$amount_pay,$Narration,$Comment,$reVID);
                        
                    }
                }

                
            }

            $rate         = $this->input->post('product_rate',TRUE);
            $p_id         = $this->input->post('product_id',TRUE);
            $quantity     = $this->input->post('product_quantity',TRUE);
            $t_price      = $this->input->post('total_price',TRUE);
            $expiry_date  = $this->input->post('expiry_date',TRUE);
            $batch_no     = $this->input->post('batch_no',TRUE);
            $discountvalue= $this->input->post('discountvalue',TRUE);
            $vatpercent   = $this->input->post('vatpercent',TRUE);
            $vatvalue     = $this->input->post('vatvalue',TRUE);
            $discount_per = $this->input->post('discount_per',TRUE);

            $discount = $this->input->post('discount',TRUE);

            for ($i = 0, $n = count($p_id); $i < $n; $i++) {
                $product_quantity = $quantity[$i];
                $product_rate     = $rate[$i];
                $product_id       = $p_id[$i];
                $total_price      = $t_price[$i];
                $disc             = $discount[$i];
                $ba_no            = $batch_no[$i];
                $exp_date         = $expiry_date[$i];
                $dis_per          = $discount_per[$i];
                $disval           = $discountvalue[$i];
                $vatper           = $vatpercent[$i];
                $vatval           = $vatvalue[$i];
                

                $data1 = array(
                    'purchase_detail_id' => $this->generator(15),
                    'purchase_id'        => $dbpurs_id,
                    'product_id'         => $product_id,
                    'quantity'           => $product_quantity,
                    'rate'               => $product_rate,
                    'batch_id'           => $ba_no,
                    'expiry_date'        => $exp_date,
                    'total_amount'       => $total_price,
                    'discount'           => $dis_per,
                    'discount_amnt'      => $disval,
                    'vat_amnt_per'       => $vatper,
                    'vat_amnt'           => $vatval,
                    'status'             => 1
                );

                $product_price = array(

                    'supplier_price' => $product_rate
                );

                if (($quantity)) {

                    $this->db->insert('product_purchase_details', $data1);
                    $this->db->where('product_id', $product_id)->update('supplier_product', $product_price);
                }
            }
            $setting_data = $this->db->select('is_autoapprove_v')->from('web_setting')->where('setting_id', 1)->get()->result_array();
            if ($setting_data[0]['is_autoapprove_v'] == 1) {	
                
                $new = $this->autoapprove($purchase_id);
            }
            $this->session->set_flashdata('message', display('update_successfully'));
            redirect("purchase_list");
            } else {
                $this->session->set_flashdata('exception', validation_errors());
                redirect("purchase_edit/".$purchase_id);
            } 
        }
    }

    // insert purchase debitvoucher
    public function insert_purchase_debitvoucher($is_credit = null,$purchase_id = null,$dbtid = null,$amnt_type = null,$amnt = null,$Narration = null,$Comment = null,$reVID = null,$subcode = null){  

        
        $fyear = financial_year();          
        $VDate = date('Y-m-d');
        $CreateBy=$this->session->userdata('id');
        $createdate=date('Y-m-d H:i:s');
        if ($is_credit == 1) {
            $maxid = $this->Accounts_model->getMaxFieldNumber('id','acc_vaucher','Vtype','JV','VNo');             
            $vaucherNo = "JV-". ($maxid +1);

            $debitinsert = array(
                'fyear'          =>  $fyear,
                'VNo'            =>  $vaucherNo,
                'Vtype'          =>  'JV',
                'referenceNo'    =>  $purchase_id,
                'VDate'          =>  $VDate,
                'COAID'          =>  $reVID,    
                'Narration'      =>  $Narration,     
                'ledgerComment'  =>  $Comment,   
                'RevCodde'       =>  $dbtid,    
                'subType'        =>  4,    
                'subCode'        =>  $subcode,    
                'isApproved'     =>  0,                      
                'CreateBy'       =>  $CreateBy,
                'CreateDate'     =>  $createdate,      
                'status'         =>  0,      
            );

            
        }else {
            $maxid = $this->Accounts_model->getMaxFieldNumber('id','acc_vaucher','Vtype','DV','VNo');             
            $vaucherNo = "DV-". ($maxid +1);
            $debitinsert = array(
                'fyear'          =>  $fyear,
                'VNo'            =>  $vaucherNo,
                'Vtype'          =>  'DV',
                'referenceNo'    =>  $purchase_id,
                'VDate'          =>  $VDate,
                'COAID'          =>  $dbtid,     
                'Narration'      =>  $Narration,     
                'ledgerComment'  =>  $Comment,   
                'RevCodde'       =>  $reVID,    
                'isApproved'     =>  0,                      
                'CreateBy'       => $CreateBy,
                'CreateDate'     => $createdate,      
                'status'         => 0,      
            );

        }
        if($amnt_type == 'Debit'){
            
            $debitinsert['Debit']  = $amnt;
            $debitinsert['Credit'] =  0.00;    
        }else{

            $debitinsert['Debit']  = 0.00;
            $debitinsert['Credit'] =  $amnt; 
        }
        

        $this->db->insert('acc_vaucher',$debitinsert);
       
	    return true;
	}

    public function product_search_by_supplier() {
        $supplier_id = $this->input->post('supplier_id',TRUE);
        $product_name = $this->input->post('product_name',TRUE);
        $product_info = $this->purchase_model->product_search_item($supplier_id, $product_name);
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

    public function retrieve_product_data() {
        $product_id  = $this->input->post('product_id',TRUE);
        $warehouse_id = $this->input->post('warehouse_id',TRUE);
        $supplier_id = $this->input->post('supplier_id',TRUE);
        $product_info = $this->purchase_model->get_total_product($product_id, $warehouse_id, $supplier_id);

        echo json_encode($product_info);
    }

    public function product_supplier_check($product_id, $supplier_id) {
        $this->db->select('*');
        $this->db->from('supplier_product');
        $this->db->where('product_id', $product_id);
        $this->db->where('supplier_id', $supplier_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return true;
        }
        return 0;
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

}

