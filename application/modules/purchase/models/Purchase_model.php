<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Purchase_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
  
        $this->load->model(array('account/Accounts_model')); 
        
    }

     public function supplier_list(){
         $query = $this->db->select('*')
                    ->from('supplier_information')
                    ->where('status', '1')
                    ->get();
            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            return false;
    }
    function get_payment_method() {
        $query = $this->db->query("SELECT * FROM payment_method ORDER BY payment_method_name");
        return $query->result();
    }

     public function pmethod_dropdown(){
        $data = $this->db->select('*')
                ->from('acc_coa')
                ->where('PHeadName','Cash')
                ->or_where('PHeadName','Cash at Bank')
                ->get()
                ->result(); 

       $list[''] = 'Select Method';
       if (!empty($data)) {
        $list[0] = 'Credit Purchase';
           foreach($data as $value)
               $list[$value->HeadCode] = $value->HeadName;
           return $list;
       } else {
           return false; 
       }
    }
    function warehouse_list() {
        $query = $this->db->query("SELECT * FROM warehouse");
        return $query->result();
    }

    function get_product_by_supplier_id($supplier_id) {
        $query = $this->db->query("
            SELECT a.id, a.product_id, a.product_name
            FROM product_information a
            WHERE a.supplier_id = $supplier_id AND a.status = 1
            ORDER BY a.product_name
        ");
        return $query->result();
    }

    public function pmethod_dropdown_new(){
        $data = $this->db->select('*')
                ->from('acc_coa')
                ->where('PHeadName','Cash')
                ->or_where('PHeadName','Cash at Bank')
                ->get()
                ->result(); 

       $list[''] = 'Select Method';
       if (!empty($data)) {
        
           foreach($data as $value)
               $list[$value->HeadCode] = $value->HeadName;
           return $list;
       } else {
           return false; 
       }
    }

     public function product_search_item($supplier_id, $product_name) {
      $query=$this->db->select('*')
                ->from('supplier_product a')
                ->join('product_information b','a.product_id = b.product_id')
                ->where('a.supplier_id',$supplier_id)
                // ->like('b.product_model', $product_name, 'both')
                ->or_where('a.supplier_id',$supplier_id)
                ->like('b.product_name', $product_name, 'both')
                ->group_by('a.product_id')
                ->order_by('b.product_name','asc')
                // ->limit(15)
                ->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();  
        }
        return false;
    }

    function retrieve_purchase_info_data($purchase_id) {
        $query = $this->db->query("SELECT * FROM product_purchase WHERE purchase_id = $purchase_id");
        return $query->row();
    }
    function retrieve_purchase_detail_data($purchase_id) {
        $query = $this->db->query("SELECT * FROM product_purchase_details WHERE purchase_id = $purchase_id");
        return $query->result();
    }

    public function retrieve_purchase_editdata($purchase_id) {
        $this->db->select('a.*,
                        b.*,
                        a.id as dbpurs_id,
                        c.product_id,
                        c.product_name,
                        c.product_model,
                        d.supplier_id,
                        d.supplier_name'
        );
        $this->db->from('product_purchase a');
        $this->db->join('product_purchase_details b', 'b.purchase_id =a.id');
        $this->db->join('product_information c', 'c.product_id =b.product_id');
        $this->db->join('supplier_information d', 'd.supplier_id = a.supplier_id');
        $this->db->where('a.purchase_id', $purchase_id);
        $this->db->order_by('a.purchase_details', 'asc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function product_stock($product_id, $warehouse_id, $supplier_id)
    {
        $total_purchase = 0;
        $total_sale = 0;

        $query = $this->db->query("
            SELECT SUM(a.quantity) AS total_purchase
            FROM product_purchase_details a
            INNER JOIN product_purchase b ON (a.purchase_id = b.id)
            WHERE a.product_id = $product_id
            AND b.supplier_id = $supplier_id
            AND b.warehouse_id = $warehouse_id
            GROUP BY a.product_id
        ");
        if($query->num_rows())
            $total_purchase = $query->row()->total_purchase;

        $query1 = $this->db->query("
            SELECT SUM(a.quantity) AS total_sale
            FROM invoice_details a
            INNER JOIN invoice b ON (a.invoice_id = b.id)
            WHERE a.product_id = $product_id
            AND b.warehouse_id = $warehouse_id
            GROUP BY a.product_id
        ");
        if($query1->num_rows())
            $total_sale = $query1->row()->total_sale;

        return $total_purchase-$total_sale;
    }

    public function get_total_product($product_id, $warehouse_id, $supplier_id) {
        $query = $this->db->query("
            SELECT a.supplier_price, a.price, a.supplier_id, c.unit_name
            FROM product_information a 
            INNER JOIN units c ON (a.unit = c.unit_id)
            WHERE a.product_id= $product_id AND a.supplier_id = $supplier_id
        ");
        $product_information = $query->row();

        $data2 = array(
            'total_product'  => $this->product_stock($product_id, $warehouse_id, $supplier_id),
            'supplier_price' => $product_information->supplier_price,
            'price'          => $product_information->price,
            'supplier_id'    => $product_information->supplier_id,
            'unit'           => $product_information->unit_name
        );

        return $data2;
    }

     public function count_purchase() {
        $this->db->select('a.*,b.supplier_name');
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
        $this->db->order_by('a.purchase_date', 'desc');
        $query = $this->db->get();

        $last_query = $this->db->last_query();
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        }
        return false;
    }

      public function getPurchaseList($postData=null){
         $response = array();
         $fromdate = $this->input->post('fromdate');
         $todate   = $this->input->post('todate');
         if(!empty($fromdate)){
            $datbetween = "(a.purchase_date BETWEEN '$fromdate' AND '$todate')";
         }else{
            $datbetween = "";
         }
         ## Read value
         $draw = $postData['draw'];
         $start = $postData['start'];
         $rowperpage = $postData['length']; // Rows display per page
         $columnIndex = $postData['order'][0]['column']; // Column index
         $columnName = $postData['columns'][$columnIndex]['data']; // Column name
         $columnSortOrder = $postData['order'][0]['dir']; // asc or desc
         $searchValue = $postData['search']['value']; // Search value

         ## Search 
         $searchQuery = "";
         if($searchValue != ''){
            $searchQuery = " (b.supplier_name like '%".$searchValue."%' or a.chalan_no like '%".$searchValue."%' or a.purchase_id like'%".$searchValue."%' or a.purchase_id like'%".$searchValue."%')";
         }

         ## Total number of records without filtering
        $this->db->select('count(*) as allcount');
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id','left');
          if(!empty($fromdate) && !empty($todate)){
             $this->db->where($datbetween);
         }
          if($searchValue != '')
          $this->db->where($searchQuery);
          
         $records = $this->db->get()->result();
         $totalRecords = $records[0]->allcount;

         ## Total number of record with filtering
         $this->db->select('count(*) as allcount');
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id','left');
         if(!empty($fromdate) && !empty($todate)){
             $this->db->where($datbetween);
         }
         if($searchValue != '')
            $this->db->where($searchQuery);
          
         $records = $this->db->get()->result();
         $totalRecordwithFilter = $records[0]->allcount;

         ## Fetch records
        $this->db->select('a.*,b.supplier_name');
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id','left');
          if(!empty($fromdate) && !empty($todate)){
             $this->db->where($datbetween);
         }
         if($searchValue != '')
         $this->db->where($searchQuery);
       
         $this->db->order_by($columnName, $columnSortOrder);
         $this->db->limit($rowperpage, $start);
         $records = $this->db->get()->result();
         $data = array();
         $sl =1;
         foreach($records as $record ){
          $button = '';
          $base_url = base_url();
          $jsaction = "return confirm('Are You Sure ?')";

           $button .='  <a href="'.$base_url.'purchase_details/'.$record->purchase_id.'" class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="left" title="'.display('purchase_details').'"><i class="fa fa-window-restore" aria-hidden="true"></i></a>';
      if($this->permission1->method('manage_purchase','update')->access()){
            
            $button .=' <a href="'.$base_url.'purchase_edit/'.$record->purchase_id.'" class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="left" title="'. display('update').'"><i class="fa fa-pencil" aria-hidden="true"></i></a> ';
     }

     

         $purchase_ids ='<a href="'.$base_url.'purchase_details/'.$record->purchase_id.'">'.$record->purchase_id.'</a>';
               
            $data[] = array( 
                'sl'               =>$sl,
                'chalan_no'        =>$record->chalan_no,
                'purchase_id'      =>$purchase_ids,
                'supplier_name'    =>$record->supplier_name,
                'purchase_date'    =>$record->purchase_date,
                'total_amount'     =>$record->grand_total_amount,
                'button'           =>$button,
                
            ); 
            $sl++;
         }

         ## Response
         $response = array(
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecordwithFilter,
            "iTotalDisplayRecords" => $totalRecords,
            "aaData" => $data
         );

         return $response; 
    }

    public function purchase_details_data($purchase_id) {
        $this->db->select('a.*,b.*,c.*,d.product_id,d.product_name,d.product_model');
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
        $this->db->join('product_purchase_details c', 'c.purchase_id = a.id');
        $this->db->join('product_information d', 'd.product_id = c.product_id');
        $this->db->where('a.purchase_id', $purchase_id);
        $this->db->group_by('d.product_id');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    /*invoice no generator*/
    public function number_generator() {
        $this->db->select_max('purchase_id');
        $query      = $this->db->get('product_purchase');
        $result     = $query->result_array();
        $purchase_id = $result[0]['purchase_id'];
        if ($purchase_id != '') {
            $purchase_id = $purchase_id + 1;
        } else {
            $purchase_id = 1;
        }
        return $purchase_id;
    }

    public function insert_purchase() {
         
        $purchase_id = $this->number_generator();
        $added_by = $this->session->userdata('id');
        $added_on  = date('Y-m-d H:i:s');

        $paid_amount = $this->input->post('paid_amount',TRUE);
        $due_amount  = $this->input->post('due_amount',TRUE);

        $data = array(
            'purchase_id'        => $purchase_id,
            'chalan_no'          => $this->input->post('chalan_no',TRUE),
            'supplier_id'        => $this->input->post('supplier_id',TRUE),
            'grand_total_amount' => $this->input->post('grand_total_price',TRUE),
            'invoice_discount'   => $this->input->post('total_discount',TRUE),
            'purchase_date'      => $this->input->post('purchase_date',TRUE),
            'purchase_details'   => $this->input->post('purchase_details',TRUE),
            'paid_amount'        => $paid_amount,
            'due_amount'         => $due_amount,
            'status'             => 1,
            'added_on'             => $added_on,
            'added_by'             => $added_by,
            'payment_method_id'  => $this->input->post('payment_method_id',TRUE),
            'warehouse_id'  => $this->input->post('warehouse_id',TRUE),
        );

        $this->db->insert('product_purchase', $data);
        $purs_insert_id =  $this->db->insert_id();
        
        $product_id_A  = $this->input->post('product_id',TRUE);
        $rate         = $this->input->post('product_rate',TRUE);
        $quantity     = $this->input->post('product_quantity',TRUE);
        $t_price      = $this->input->post('total_price',TRUE);
        $discountvalue= $this->input->post('discountvalue',TRUE);
        $discount_per = $this->input->post('discount_per',TRUE);

        foreach($product_id_A as $key => $product_id) {
            $data1 = array(
                'purchase_detail_id' => $this->generator(15),
                'purchase_id'        => $purs_insert_id,
                'product_id'         => $product_id,
                'quantity'           => $quantity[$key],
                'rate'               => $rate[$key],
                'total_amount'       => $t_price[$key],
                'discount'           => $discount_per[$key],
                'discount_amnt'      => $discountvalue[$key],
                'status'             => 1
            );

            $this->db->insert('product_purchase_details', $data1);
        }
        return 1;
    }
    public function update_purchase() {
        $id = $this->input->post('id');
        $edited_by = $this->session->userdata('id');
        $edited_on  = date('Y-m-d H:i:s');

        $paid_amount = $this->input->post('paid_amount',TRUE);
        $due_amount  = $this->input->post('due_amount',TRUE);

        $data = array(
            'chalan_no'          => $this->input->post('chalan_no',TRUE),
            'supplier_id'        => $this->input->post('supplier_id',TRUE),
            'grand_total_amount' => $this->input->post('grand_total_price',TRUE),
            'invoice_discount'   => $this->input->post('total_discount',TRUE),
            'purchase_date'      => $this->input->post('purchase_date',TRUE),
            'purchase_details'   => $this->input->post('purchase_details',TRUE),
            'paid_amount'        => $paid_amount,
            'due_amount'         => $due_amount,
            'edited_on'             => $edited_on,
            'edited_by'             => $edited_by,
            'payment_method_id'  => $this->input->post('payment_method_id',TRUE),
            'warehouse_id'  => $this->input->post('warehouse_id',TRUE),
        );

        $this->db->where('id', $id);
        $this->db->update('product_purchase', $data);
        $purs_insert_id =  $id;
        
        $product_id_A  = $this->input->post('product_id',TRUE);
        $rate         = $this->input->post('product_rate',TRUE);
        $quantity     = $this->input->post('product_quantity',TRUE);
        $t_price      = $this->input->post('total_price',TRUE);
        $discountvalue= $this->input->post('discountvalue',TRUE);
        $discount_per = $this->input->post('discount_per',TRUE);

        // delete
        $this->db->where('purchase_id', $purs_insert_id);
        $this->db->delete('product_purchase_details');

        foreach($product_id_A as $key => $product_id) {
            $data1 = array(
                'purchase_detail_id' => $this->generator(15),
                'purchase_id'        => $purs_insert_id,
                'product_id'         => $product_id,
                'quantity'           => $quantity[$key],
                'rate'               => $rate[$key],
                'total_amount'       => $t_price[$key],
                'discount'           => $discount_per[$key],
                'discount_amnt'      => $discountvalue[$key],
                'status'             => 1
            );

            $this->db->insert('product_purchase_details', $data1);
        }
        return 1;
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

    // insert purchase debitvoucher
    public function insert_purchase_debitvoucher($is_credit = null,$purchase_id = null,$dbtid = null,$amnt_type = null,$amnt = null,$Narration = null,$Comment = null,$reVID = null,$subcode = null){  

        
        // $fyear = financial_year();          
        $VDate = date('Y-m-d');
        // $CreateBy=$this->session->userdata('id');
        $createdate=date('Y-m-d H:i:s');
        // if ($is_credit == 1) {
        //     $maxid = $this->Accounts_model->getMaxFieldNumber('id','acc_vaucher','Vtype','JV','VNo');             
        //     $vaucherNo = "JV-". ($maxid +1);

        //     $debitinsert = array(
        //         'fyear'          =>  $fyear,
        //         'VNo'            =>  $vaucherNo,
        //         'Vtype'          =>  'JV',
        //         'referenceNo'    =>  $purchase_id,
        //         'VDate'          =>  $VDate,
        //         'COAID'          =>  $reVID,    
        //         'Narration'      =>  $Narration,     
        //         'ledgerComment'  =>  $Comment,   
        //         'RevCodde'       =>  $dbtid,    
        //         'subType'        =>  4,    
        //         'subCode'        =>  $subcode,    
        //         'isApproved'     =>  0,                      
        //         'CreateBy'       =>  $CreateBy,
        //         'CreateDate'     =>  $createdate,      
        //         'status'         =>  0,      
        //     );

            
        // }else {
            
        // }
        $maxid = $this->Accounts_model->getMaxFieldNumber('id','acc_vaucher','Vtype','DV','VNo');             
        $vaucherNo = "DV-". ($maxid +1);
        $debitinsert = array(
            'fyear'          =>  1,
            'VNo'            =>  $vaucherNo,
            'Vtype'          =>  'DV',
            'referenceNo'    =>  $purchase_id,
            'VDate'          =>  $VDate,
            'COAID'          =>  $dbtid,     
            'Narration'      =>  $Narration,     
            'ledgerComment'  =>  $Comment,   
            'RevCodde'       =>  $reVID,    
            'isApproved'     =>  0,                      
            'CreateBy'       => 1,
            'CreateDate'     => $createdate,      
            'status'         => 0,      
        );
        $debitinsert['Debit']  = $amnt;
        $debitinsert['Credit'] =  0.00;    
        // if($amnt_type == 'Debit'){
            
        // }else{

        //     $debitinsert['Debit']  = 0.00;
        //     $debitinsert['Credit'] =  $amnt; 
        // }
        

        $this->db->insert('acc_vaucher',$debitinsert);
       
	    return true;
	}

    public function autoapprove($purchase_id){

        $vouchers = $this->db->select('referenceNo, VNo')->from('acc_vaucher')->where('referenceNo',$purchase_id)->where('status',0)->get()->result();
        foreach ($vouchers as $value) {
            # code...
            $this->Accounts_model->approved_vaucher($value->VNo, 'active');
        }
        return true;
        
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

