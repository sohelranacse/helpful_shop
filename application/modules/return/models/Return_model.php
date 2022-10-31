<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 #------------------------------------    
    # Author: Bdtask Ltd
    # Author link: https://www.bdtask.com/
    # Dynamic style php file
    # Developed by :Isahaq
    #------------------------------------    

class Return_model extends CI_Model {

    public function invoice_return_data($invoice_id) {
        $this->db->select('a.*, sum(c.quantity) as sum_quantity,a.id as dbinv_id, a.total_tax as taxs,a. prevous_due,c.vat_amnt as total_vat, b.customer_name,c.*,c.tax as total_tax,c.product_id,d.product_name,d.product_model,d.tax,d.unit,d.*');
        $this->db->from('invoice a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->join('invoice_details c', 'c.invoice_id = a.id');
        $this->db->join('product_information d', 'd.product_id = c.product_id');
        $this->db->where('a.invoice', $invoice_id);
        $this->db->group_by('d.product_id');

        $query = $this->db->get();


        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function user_invoice_data($user_id){
        return  $this->db->select('*')->from('users')->where('user_id',$user_id)->get()->row();
    }

    public function retrieve_invoice_html_data($return_id) {
        $this->db->select('c.return_id,c.invoice_id,b.customer_name,b.customer_mobile, d.*,a.ret_adjust_amnt,a.date,
        a.invoice_discount,a.total_discount,a.shipping_cost,a.prevous_due,a.total_amount,a.sales_by,a.invoice,e.*,
        e.ret_invoice_id as invoice_id,a.returnable_amount');
        $this->db->from('product_return c');
        $this->db->join('invoice a', 'a.invoice_id = c.invoice_id');
        $this->db->join('invoice_details e', 'e.ret_invoice_id = c.invoice_id');
        $this->db->join('customer_information b', 'b.customer_id = c.customer_id');
        $this->db->join('product_information d', 'd.product_id = c.product_id');
        $this->db->where('c.return_id', $return_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function retrieve_invoice_return_replaced_item($return_id) {
        $this->db->select('a.*,b.*,d.*,c.*');
        $this->db->from('invoice_details a');
        $this->db->join('invoice b', 'b.invoice_id = a.ret_invoice_id');
        $this->db->join('product_information d', 'd.product_id = a.product_id');
        $this->db->join('customer_information c', 'c.customer_id = b.customer_id');
        $this->db->where('a.ret_invoice_id', $invoice_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function invoice_method_wise_balance($invoice_id){

        return $this->db->select('acc_vaucher.Debit,acc_vaucher.COAID,acc_coa.HeadName')
              ->from('acc_vaucher')
              ->join('acc_coa', 'acc_coa.HeadCode=acc_vaucher.COAID', 'left')
              ->where('acc_vaucher.referenceNo',$invoice_id)
              ->where('acc_vaucher.Vtype','CV')
              ->get()->result(); 
    }


    public function return_invoice_entry() {
        $invoice_id     = $this->input->post('invoice_id',TRUE);
        $dbinv_id       = $this->input->post('dbinv_id',TRUE);
        
        $total          = $this->input->post('grand_total_priceret',TRUE);
        $customer_id    = $this->input->post('customer_id',TRUE);
        $isrtn          = $this->input->post('rtn',TRUE);

        $cusifo = $this->db->select('*')->from('customer_information')->where('customer_id',$customer_id)->get()->row();
        $headn = $customer_id.'-'.$cusifo->customer_name;
        $coainfo = $this->db->select('*')->from('acc_coa')->where('customer_id',$customer_id)->get()->row();
        

        // product return part 
        $date          = date('Y-m-d');
        $createby      = $this->session->userdata('id');
        $createdate    = date('Y-m-d H:i:s');
        $ads           = $this->input->post('radio',TRUE);
        $quantity      = $this->input->post('product_quantityret',TRUE);
        $available_quantity = $this->input->post('available_quantity',TRUE);
        $batch         = $this->input->post('batch_noret',TRUE);
        $rate          = $this->input->post('product_rateret',TRUE);
        $p_id          = $this->input->post('product_idret',TRUE);
        $total_amount  = $this->input->post('total_priceret',TRUE);
        $discount_rate = $this->input->post('discountret',TRUE);
        $soldqty       = $this->input->post('sold_qtyret',TRUE);
        $d             = new DateTime();
        $return_id     = '3'.$d->format("Hisv");
        

        if (is_array($p_id))
        for ($i = 0; $i < count($p_id); $i++) {

            $product_quantity = $quantity[$i];
            $product_rate     = $rate[$i];
            $batch_no         = $batch[$i];
            $product_id       = $p_id[$i];
            $sqty             = $soldqty[$i];
            $total_price      = $total_amount[$i];
            $supplier_rate    = $this->supplier_rate($product_id);
            $discount         = $discount_rate[$i];

            $data1 = array(
                'invoice_details_id'=> $this->occational->generator(15),
                'invoice_id'        => $dbinv_id,
                'product_id'        => $product_id,
                'quantity'          => -$product_quantity,
                'rate'              => $product_rate,
                'batch_id'          => $batch_no,
                'discount'          => -is_numeric($discount),
                'tax'               => '',
                'supplier_rate'     => $supplier_rate[0]['supplier_price'],
                'paid_amount'       => -$total,
                'total_price'       => -$total_price,
                'status'            => 1
            );

            $returns = array(
                'return_id'     => $return_id,
                'invoice_id'    => $invoice_id,
                'product_id'    => $product_id,
                'customer_id'   => $this->input->post('customer_id',TRUE),
                'ret_qty'       => $product_quantity,
                'byy_qty'       => $sqty,
                'date_purchase' => $this->input->post('invoice_date',TRUE),
                'date_return'   => $date,
                'product_rate'  => $product_rate,
                'deduction'     => $discount,
                'total_deduct'  => $this->input->post('total_discountret',TRUE),
                'total_tax'     => '',
                'total_ret_amount' => $total_price,
                'net_total_amount' => $this->input->post('grand_total_priceret',TRUE),
                'reason'        => $this->input->post('details',TRUE),
                'usablity'      => $this->input->post('radio',TRUE)
            );

            if ($ads == 1) {
                $this->db->insert('invoice_details', $data1);
            }
            $this->db->insert('product_return', $returns);

        }
        // product return part end

        // new product add part start

        $prodquantity        = $this->input->post('product_quantity',TRUE);
        $prodrate            = $this->input->post('product_rate',TRUE);
        $prodp_id            = $this->input->post('product_id',TRUE);
        $prodtotal_amount    = $this->input->post('total_price',TRUE);
        $proddiscount_rate   = $this->input->post('discountvalue',TRUE);
        $discount_per        = $this->input->post('discount',TRUE);
        $vat_amnt            = $this->input->post('vatvalue',TRUE);
        $vat_amnt_pcnt       = $this->input->post('vatpercent',TRUE);
        $tax_amount          = $this->input->post('tax',TRUE);
        $invoice_description = $this->input->post('desc',TRUE);
        $prodserial_n        = $this->input->post('serial_no',TRUE);
        $paidamount          = $this->input->post('paid_amount',TRUE);

        for ($i = 0, $n = count($p_id); $i < $n; $i++) {
            $product_quantity = $prodquantity[$i];
            $product_rate     = $prodrate[$i];
            $product_id       = $prodp_id[$i];
            $serial_no        = (!empty($prodserial_n[$i])?$prodserial_n[$i]:null);
            $total_price      = $prodtotal_amount[$i];
            $supplier_rate    = $this->supplier_price($product_id);
            $disper           = $discount_per[$i];
            $discount         = $proddiscount_rate[$i];
            $vatper           = $vat_amnt_pcnt[$i];
            $vatanmt          = $vat_amnt[$i];
            $tax              = ($tax_amount?$tax_amount[$i]:0);
            $description      = (!empty($invoice_description)?$invoice_description[$i]:null);
        
            $data3 = array(
                'invoice_details_id' => $this->occational->generator(15),
                'ret_invoice_id'     => $invoice_id,
                'product_id'         => $product_id,
                'serial_no'          => '',
                'batch_id'           => $serial_no,
                'quantity'           => $product_quantity,
                'rate'               => $product_rate,
                'discount'           => $discount,
                'description'        => $description,
                'discount_per'       => $disper,
                'vat_amnt'           => $vatanmt,
                'vat_amnt_per'       => $vatper,
                'tax'                => $tax,
                'paid_amount'        => $paidamount,
                'due_amount'         => $this->input->post('due_amount',TRUE),
                'supplier_rate'      => $supplier_rate,
                'total_price'        => $total_price,
                'status'             => 1
            );
            if (!empty($quantity)) {
                $this->db->insert('invoice_details', $data3);
            }

        }
        // new product add part end

        //insert paid amount start

        $multipayamount     = $this->input->post('pamount_by_method',TRUE);
        $multipaytype       = $this->input->post('multipaytype',TRUE);
        $paidamount          = $this->input->post('paid_amount',TRUE);
        $predefine_account  = $this->db->select('*')->from('acc_predefine_account')->get()->row();
        $Narration          = "Sales Return Voucher";
        $Comment            = "Sales Return Voucher for customer";
        $reVID              = $predefine_account->salesCode;

        $ret_adjust_amnt = array(
            'returnable_amount'   => $this->input->post('n_total',TRUE),
            'ret_adjust_amnt'     => $paidamount,
        );
        $this->db->where('invoice_id', $invoice_id)->update('invoice', $ret_adjust_amnt);
        

        if($multipaytype && $multipayamount){

            $amnt_type = 'Debit';
            for ($i=0; $i < count($multipaytype); $i++) {

                $COAID = $multipaytype[$i];
                $amount_pay = $multipayamount[$i];

                $this->insert_sale_creditvoucher(0,$return_id,$COAID,$amnt_type,$amount_pay,$Narration,$Comment,$reVID);
                
            }
            
        }
        //insert paid amount end

        return $return_id;
    }

    // insert sales debitvoucher
    public function insert_sale_creditvoucher($is_credit = null,$invoice_id = null,$dbtid = null,$amnt_type = null,$amnt = null,$Narration = null,$Comment = null,$reVID = null,$subcode = null){  

        $fyear = financial_year();          
        $VDate = date('Y-m-d');
        $CreateBy=$this->session->userdata('id');
        $createdate=date('Y-m-d H:i:s');
        // Cash & credit voucher insert
        if ($is_credit == 1) {
            $maxid = $this->getMaxFieldNumber('id','acc_vaucher','Vtype','JV','VNo');             
            $vaucherNo = "JV-". ($maxid +1);

            $debitinsert = array(
                'fyear'          =>  $fyear,
                'VNo'            =>  $vaucherNo,
                'Vtype'          =>  'JV',
                'referenceNo'    =>  $invoice_id,
                'VDate'          =>  $VDate,
                'COAID'          =>  $dbtid,    
                'Narration'      =>  $Narration,     
                'ledgerComment'  =>  $Comment,   
                'RevCodde'       =>  $reVID,    
                'subType'        =>  3,    
                'subCode'        =>  $subcode,    
                'isApproved'     =>  0,                      
                'CreateBy'       =>  $CreateBy,
                'CreateDate'     =>  $createdate,      
                'status'         =>  0,      
            );

            
        }else {
            $maxid = $this->getMaxFieldNumber('id','acc_vaucher','Vtype','CV','VNo');             
            $vaucherNo = "CV-". ($maxid +1);
            $debitinsert = array(
                'fyear'          =>  $fyear,
                'VNo'            =>  $vaucherNo,
                'Vtype'          =>  'CV',
                'referenceNo'    =>  $invoice_id,
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

    


    
    

    public function supplier_price($product_id) {
        $this->db->select('supplier_price');
        $this->db->from('supplier_product');
        $this->db->where(array('product_id' => $product_id));
        $supplier_product = $this->db->get()->row();
   

        $this->db->select('Avg(rate) as supplier_price');
        $this->db->from('product_purchase_details');
        $this->db->where(array('product_id' => $product_id));
        $purchasedetails = $this->db->get()->row();
      $price = (!empty($purchasedetails->supplier_price)?$purchasedetails->supplier_price:$supplier_product->supplier_price);
 
        return (!empty($price)?$price:0);
    }

    public function supplier_rate($product_id) {
        $this->db->select('supplier_price');
        $this->db->from('supplier_product');
        $this->db->where(array('product_id' => $product_id));
        $query = $this->db->get();
        return $query->result_array();
    }


    /////////// supplier returns form data
    public function supplier_return($purchase_id) {
        $this->db->select('c.*,a.*,b.*,a.product_id,c.id as dbpurs_id, d.product_name,d.product_model,e.supplier_id');
        $this->db->from('product_purchase c');
        $this->db->join('product_purchase_details a', 'a.purchase_id = c.purchase_id');
        $this->db->join('product_information d', 'd.product_id = a.product_id');
        $this->db->join('supplier_product e', 'e.product_id = d.product_id');
        $this->db->join('supplier_information b', 'b.supplier_id = e.supplier_id');

        $this->db->where('c.purchase_id', $purchase_id);
        $this->db->group_by('d.product_id', 'desc');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function getMaxFieldNumber($field, $table,$where=null,$type=null,$fild2=null) {
  
        $this->db->select("$field,$fild2");
        $this->db->from($table); 
        if($where != null) {
            $this->db->where($where, $type);
        } 
        $this->db->order_by('id','desc')->limit(1) ; 
        $record = $this->db->get() ; 
        if($record->num_rows() >0) {     
         if($fild2 != null) {
            $num = $record->row($fild2);
            list($txt, $intval) = explode('-', $num);        
            return $intval;
         } else { 
         $num = $record->row($field);       
           return $num;
         }     
        } else {
            return 0;
        }
    }
    // insert purchase debitvoucher
    public function insert_purchase_debitvoucher_return($is_credit = null,$purchase_id = null,$dbtid = null,$amnt_type = null,$amnt = null,$Narration = null,$Comment = null,$reVID = null,$subcode = null){  

        
        $fyear = financial_year();          
        $VDate = date('Y-m-d');
        $CreateBy=$this->session->userdata('id');
        $createdate=date('Y-m-d H:i:s');
        if ($is_credit == 1) {
            $maxid = $this->getMaxFieldNumber('id','acc_vaucher','Vtype','JV','VNo');             
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
            $maxid = $this->getMaxFieldNumber('id','acc_vaucher','Vtype','DV','VNo');             
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

    ///#################### Supplier return  Entry ############///////////
    public function return_supplier_entry() {
        $purchase_id  = $this->input->post('purchase_id',TRUE);
        $dbpurs_id    = $this->input->post('dbpurs_id',TRUE);
        $total        = $this->input->post('grand_total_price',TRUE);
        $supplier_id  = $this->input->post('supplier_id',TRUE);
        $isrtn        = $this->input->post('rtn',TRUE);
        $supinfo      = $this->db->select('*')->from('supplier_information')->where('supplier_id',$supplier_id)->get()->row();
        $sup_head     = $supinfo->supplier_id.'-'.$supinfo->supplier_name;
        $sup_coa      = $this->db->select('*')->from('acc_coa')->where('supplier_id',$supplier_id)->get()->row();
        $receive_by   = $this->session->userdata('id');
        $receive_date = date('Y-m-d');
        $createdate   = date('Y-m-d H:i:s');
        $is_credit    = $this->input->post('is_credit',TRUE);
        $pay_method   = $this->input->post('pay_method',TRUE);
        $date         = date('Y-m-d');
        $d            = new DateTime();
        $return_id    = '3'.$d->format("Hisv");
        

        $predefine_account  = $this->db->select('*')->from('acc_predefine_account')->get()->row();
        $Narration          = "Purchase Return Voucher";
        $Comment            = "Purchase Return Voucher for supplier";
        $COAID              = $predefine_account->purchaseCode;
               
        if($pay_method){

            $amnt_type  = 'Credit';
            $reVID      = $pay_method;
            $amount_pay = $total;
            $insrt_pay_amnt_vcher = $this->insert_purchase_debitvoucher_return($is_credit,$return_id,$COAID,$amnt_type,$amount_pay,$Narration,$Comment,$reVID);
                
        } else {

            $amount_pay = $total;
            $amnt_type  = 'Debit';
            $reVID      = $predefine_account->supplierCode;
            $subcode    = $this->db->select('*')->from('acc_subcode')->where('referenceNo', $supplier_id)->where('subTypeId', 4)->get()->row()->id;
            $insrt_pay_amnt_vcher = $this->insert_purchase_debitvoucher_return($is_credit,$return_id,$COAID,$amnt_type,$amount_pay,$Narration,$Comment,$reVID,$subcode);

        }
        
        $quantity           = $this->input->post('product_quantity',TRUE);
        $available_quantity = $this->input->post('available_quantity',TRUE);
        $cartoon            = $this->input->post('cartoon',TRUE);
        $rate               = $this->input->post('product_rate',TRUE);
        $batch_no           = $this->input->post('batch_no',TRUE);
        $p_id               = $this->input->post('product_id',TRUE);
        $total_amount       = $this->input->post('total_price',TRUE);
        $discount_rate      = $this->input->post('discount',TRUE);
        $soldqty            = $this->input->post('ret_qty',TRUE);
        

        $pdid = $this->input->post('purchase_detail_id');


        if (is_array($p_id))
            for ($i = 0; $i < count($p_id); $i++) {
                $cartoon_quantity = $cartoon[$i];
                $product_quantity = $quantity[$i];
                $product_rate     = $rate[$i];
                $batch            = $batch_no[$i];
                $product_id       = $p_id[$i];
                $sqty             = $soldqty[$i];
                $total_price      = $total_amount[$i];
                $discount         = $discount_rate[$i];
                $detais_id        = $pdid[$i];

                $data1 = array(
                    'purchase_detail_id' => $detais_id,
                    'purchase_id'        => $dbpurs_id,
                    'product_id'         => $product_id,
                    'quantity'           => -$product_quantity,
                    'rate'               => $product_rate,
                    'batch_id'           => $batch,
                    'discount'           => -is_numeric($discount),
                    'total_amount'       => -$total_price,
                    'status'             => 1
                );


                $returns = array(
                    'return_id'    => $return_id,
                    'purchase_id'  => $purchase_id,
                    'product_id'   => $product_id,
                    'supplier_id'  => $this->input->post('supplier_id',TRUE),
                    'ret_qty'      => $product_quantity,
                    'byy_qty'      => $sqty,
                    'date_purchase'=> $this->input->post('return_date',TRUE),
                    'date_return'  => $date,
                    'product_rate' => $product_rate,
                    'deduction'    => $discount,
                    'total_deduct' => $this->input->post('total_discount',TRUE),
                    'total_ret_amount' => $total_price,
                    'net_total_amount' => $this->input->post('grand_total_price',TRUE),
                    'reason'       => $this->input->post('details',TRUE),
                    'usablity'     => $this->input->post('radio',TRUE)
                );


                $this->db->insert('product_purchase_details', $data1);

                $this->db->insert('product_return', $returns);
            }

           $data['purchase_id'] = $purchase_id;
           $data['return_id']   = $return_id;


        return $data;
    }
    public function pmethod_dropdown_new(){
       
    $data = $this->db->select('*')
            ->from('acc_coa')
            ->where('PHeadName','Cash')
            ->or_where('PHeadName','Cash at Bank')
            ->get()
            ->result(); 

            if (!empty($data)) {
                foreach($data as $value)
                    $list[$value->HeadCode] = $value->HeadName;
                
            } 
    

    if (!empty($list)) {
        return $list;
    }else {
        return false; 
    }
    }


     // supplier return html data 
    public function supplier_return_html_data($purchase_id) {
        $this->db->select('c.total_ret_amount,
                        c.*,
                        c.product_rate as price,
                        b.*,
                        d.product_id,
                        d.product_name,
                        d.product_details,
                        d.product_model');
        $this->db->from('product_return c');
        $this->db->join('supplier_information b', 'b.supplier_id = c.supplier_id');
        $this->db->join('product_information d', 'd.product_id = c.product_id');
        $this->db->where('c.purchase_id', $purchase_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


   public function return_list_count() {
        $this->db->select('a.*,b.customer_name');
        $this->db->from('product_return a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('usablity', 1);
        $this->db->group_by('a.invoice_id', 'desc');
        $this->db->limit('500');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        }
        return false;
    }

///start  return list
    public function return_list($perpage, $page) {
        $this->db->select('a.net_total_amount,a.*,b.customer_name');
        $this->db->from('product_return a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('usablity', 1);
        $this->db->group_by('a.invoice_id', 'desc');
        $this->db->limit($perpage, $page);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


    // return delete with invoice id  
    public function returninvoice_delete($invoice_id = null) {
        $this->db->where('invoice_id', $invoice_id)
                ->delete('product_return');

        if ($this->db->affected_rows()) {
            return true;
        } else {
            return false;
        }
    }

       public function return_dateWise_invoice($from_date, $to_date, $perpage, $page) {
        $dateRange = "a.date_return BETWEEN '$from_date' AND '$to_date'";

        $this->db->select('a.net_total_amount,a.*,b.customer_name');
        $this->db->from('product_return a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('usablity', 1);
        $this->db->where($dateRange, NULL, FALSE);
        $this->db->group_by('a.invoice_id', 'desc');
        $this->db->limit($perpage, $page);
        $query = $this->db->get();
        return $query->result_array();
    }

         public function return_dateWise_invoice_count($from_date, $to_date) {
        $dateRange = "a.date_return BETWEEN '$from_date' AND '$to_date'";

        $this->db->select('a.net_total_amount,a.*,b.customer_name');
        $this->db->from('product_return a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('usablity', 1);
        $this->db->where($dateRange, NULL, FALSE);
        $this->db->group_by('a.invoice_id', 'desc');
        $query = $this->db->get();
        return $query->num_rows();
    }

       public function supplier_return_list($perpage, $page) {
        $this->db->select('a.net_total_amount,a.*,b.supplier_name');
        $this->db->from('product_return a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
        $this->db->where('usablity', 2);
        $this->db->group_by('a.purchase_id', 'desc');
        $this->db->limit($perpage, $page);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    // supplier list count
    public function supplier_return_list_count() {
        $this->db->select('a.*,b.customer_name');
        $this->db->from('product_return a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('usablity', 2);
        $this->db->group_by('a.invoice_id', 'desc');
        $this->db->limit('500');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        }
        return false;
    }


// return delete with purchase id
    public function return_purchase_delete($purchase_id = null) {
        $this->db->where('purchase_id', $purchase_id)
                ->delete('product_return');

        if ($this->db->affected_rows()) {
            return true;
        } else {
            return false;
        }
    }

        public function return_dateWise_supplier($from_date, $to_date, $perpage, $page) {
        $dateRange = "a.date_return BETWEEN '$from_date' AND '$to_date'";

        $this->db->select('a.net_total_amount,a.*,b.supplier_name');
        $this->db->from('product_return a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
        $this->db->where('usablity', 2);
        $this->db->where($dateRange, NULL, FALSE);
        $this->db->group_by('a.purchase_id', 'desc');
        $this->db->limit($perpage, $page);
        $query = $this->db->get();
        return $query->result_array();
    }

     public function return_dateWise_supplier_count($from_date, $to_date) {
        $dateRange = "a.date_return BETWEEN '$from_date' AND '$to_date'";

        $this->db->select('a.net_total_amount,a.*,b.supplier_name');
        $this->db->from('product_return a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
        $this->db->where('usablity', 2);
        $this->db->where($dateRange, NULL, FALSE);
        $this->db->group_by('a.purchase_id', 'desc');
        $query = $this->db->get();
        return $query->num_rows();
    }

        public function wastage_return_list($perpage, $page) {
        $this->db->select('a.net_total_amount,a.*,b.customer_name');
        $this->db->from('product_return a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('usablity', 3);
        $this->db->group_by('a.invoice_id', 'desc');
        $this->db->limit($perpage, $page);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

        public function wastage_return_list_count() {
        $this->db->select('a.*,b.customer_name');
        $this->db->from('product_return a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('usablity', 3);
        $this->db->group_by('a.invoice_id', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        }
        return false;
    }

}

