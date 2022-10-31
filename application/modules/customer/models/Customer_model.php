<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 #------------------------------------    
    # Author: Bdtask Ltd
    # Author link: https://www.bdtask.com/
    # Dynamic style php file
    # Developed by :Isahaq
    #------------------------------------    

class Customer_model extends CI_Model {

     
   public function create($data = array())
	{
		$add_customer =  $this->db->insert('customer_information', $data);

		 $customer_id = $this->db->insert_id();
        $coa = $this->headcode();
           if($coa->HeadCode!=NULL){
                $headcode=$coa->HeadCode+1;
           }else{
                $headcode="113100000001";
            }
    $c_acc=$customer_id.'-'.$data['customer_name'];
    $createby=$this->session->userdata('id');
    $createdate=date('Y-m-d H:i:s');
       

    $customer_coa = [
             'HeadCode'         => $headcode,
             'HeadName'         => $c_acc,
             'PHeadName'        => 'Customers',
             'HeadLevel'        => '4',
             'IsActive'         => '1',
             'IsTransaction'    => '1',
             'IsGL'             => '0',
             'HeadType'         => 'A',
             'IsBudget'         => '0',
             'IsDepreciation'   => '0',
             'DepreciationRate' => '0',
             'customer_id'      => $customer_id,
             'CreateBy'         => $createby,
             'CreateDate'       => $createdate,
        ];
        
    $sub_acc = [
             'subTypeId'   => 3,
             'name'        => $data['customer_name'],
             'referenceNo' => $customer_id,
             'status'      => 1,
             'created_date'=> date("Y-m-d"),
             
        ];

        if($add_customer){
            $this->db->insert('acc_subcode',$sub_acc);
        }
        if(!empty($this->input->post('previous_balance'))){
          }
        return true;
	}

	public function customer_dropdown()
	{
		$data =  $this->db->select("*")
			->from('customer_information')
			->order_by('customer_name', 'asc')
			->get()
			->result();

      $list[''] = display('select_option');
    if (!empty($data)) {
      foreach($data as $value)
        $list[$value->customer_id] = $value->customer_name;
      return $list;
    } else {
      return false; 
    }
	}

  //credit customer dropdown
    public function bdtask_credit_customer_dropdown()
  {
    $data =  $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode`)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode`)) as balance")
      ->from('customer_information a')
      ->join('acc_coa b','a.customer_id = b.customer_id','left')
      ->having('balance > 0')
      ->group_by('a.customer_id')
      ->order_by('a.customer_name', 'asc')
      ->get()
      ->result();

      $list[''] = display('select_option');
    if (!empty($data)) {
      foreach($data as $value)
        $list[$value->customer_id] = $value->customer_name;
      return $list;
    } else {
      return false; 
    }
  }


  // paid customer dropdown
   public function bdtask_paid_customer_dropdown()
  {
    $data =  $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode`)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode`)) as balance")
      ->from('customer_information a')
      ->join('acc_coa b','a.customer_id = b.customer_id','left')
      ->having('balance <= 0')
      ->group_by('a.customer_id')
      ->order_by('a.customer_name', 'asc')
      ->get()
      ->result();

      $list[''] = display('select_option');
    if (!empty($data)) {
      foreach($data as $value)
        $list[$value->customer_id] = $value->customer_name;
      return $list;
    } else {
      return false; 
    }
  }

	public function customer_list($offset=null, $limit=null)
    {
  

        return $result = $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode`)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode`)) as balance")
			->from('customer_information a')
			->join('acc_coa b','a.customer_id = b.customer_id','left')
			->group_by('a.customer_id')
			->order_by('a.customer_name', 'asc')
			->limit($offset, $limit)
			->get()
			->result();

         
    }


      public function getCustomerList($postData=null){

         $response = array();
         $customer_id =  $this->input->post('customer_id');
         $custom_data = $this->input->post('customfiled');
         if(!empty($custom_data)){
         $cus_data = [''];
         foreach ($custom_data as $cusd) {
           $cus_data[] = $cusd;
         }
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
            $searchQuery = " (a.customer_name like '%".$searchValue."%' or a.customer_mobile like '%".$searchValue."%' or a.customer_email like '%".$searchValue."%'or a.phone like '%".$searchValue."%' or a.customer_address like '%".$searchValue."%' or a.country like '%".$searchValue."%' or a.state like '%".$searchValue."%' or a.zip like '%".$searchValue."%' or a.city like '%".$searchValue."%') ";
         }

         ## Total number of records without filtering
         $this->db->select('count(*) as allcount');
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         
         if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
         if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
         }
          if($searchValue != '')
         $this->db->where($searchQuery);
         $this->db->group_by('a.customer_id');
         $totalRecords =$this->db->get()->num_rows();

         ## Total number of record with filtering
         $this->db->select('count(*) as allcount');
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
          if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
         }
         if($searchValue != '')
            $this->db->where($searchQuery);
           $this->db->group_by('a.customer_id');
         $totalRecordwithFilter = $this->db->get()->num_rows();

         ## Fetch records
         $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction  where subCode= `s`.`id` AND subType = 3)-(select ifnull(sum(Credit),0) from acc_transaction where subCode= `s`.`id` AND subType = 3)) as balance");
         $this->db->from('customer_information a');
         
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         $this->db->join('acc_subcode s','a.customer_id = s.referenceNo','left');
         $this->db->where('s.subTypeId',3);

         $this->db->group_by('a.customer_id');
          if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
          if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
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
 
    if($this->permission1->method('manage_customer','update')->access()){
      $button .=' <a href="'.$base_url.'edit_customer/'.$record->customer_id.'" class="btn btn-info btn-xs m-b-5 custom_btn" data-toggle="tooltip" data-placement="left" title="Update"><i class="pe-7s-note" aria-hidden="true"></i></a>';
    }
    if($this->permission1->method('manage_customer','delete')->access()){
      $button .=' <a onclick="customerdelete('.$record->customer_id.')" href="javascript:void(0)"  class="btn btn-danger btn-xs m-b-5 custom_btn" data-toggle="tooltip" data-placement="right" title="Delete "><i class="pe-7s-trash" aria-hidden="true"></i></a>';
    }


        
               
            $data[] = array( 
                'sl'               =>$sl,
                'customer_name'    =>$record->customer_name,
                'address'          =>$record->customer_address,
                'address2'         =>$record->address2,
                'mobile'           =>$record->customer_mobile,
                'phone'            =>$record->phone,
                'email'            =>$record->customer_email,
                'email_address'    =>$record->email_address,
                'contact'          =>$record->contact,
                'fax'              =>$record->fax,
                'city'             =>$record->email_address,
                'state'            =>$record->contact,
                'zip'              =>$record->zip,
                'country'          =>$record->country,
                'balance'          =>(!empty($record->balance)?$record->balance:0),
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



          public function getCreditCustomerList($postData=null){

         $response = array();
         $customer_id =  $this->input->post('customer_id');
         $custom_data = $this->input->post('customfiled');
         if(!empty($custom_data)){
         $cus_data = [''];
         foreach ($custom_data as $cusd) {
           $cus_data[] = $cusd;
         }
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
            $searchQuery = " (a.customer_name like '%".$searchValue."%' or a.customer_mobile like '%".$searchValue."%' or a.customer_email like '%".$searchValue."%'or a.phone like '%".$searchValue."%' or a.customer_address like '%".$searchValue."%' or a.country like '%".$searchValue."%' or a.state like '%".$searchValue."%' or a.zip like '%".$searchValue."%' or a.city like '%".$searchValue."%') ";
         }

         ## Total number of records without filtering
         $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)) as balance");
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         
         if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
         if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
         }
          if($searchValue != '')
         $this->db->where($searchQuery);
         $this->db->having('balance > 0'); 
         $this->db->group_by('a.customer_id');
         $totalRecords =$this->db->get()->num_rows();

         ## Total number of record with filtering
         $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)) as balance");
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
          if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
         }
         if($searchValue != '')
            $this->db->where($searchQuery);
           $this->db->having('balance > 0');
           $this->db->group_by('a.customer_id');
         $totalRecordwithFilter = $this->db->get()->num_rows();

         ## Fetch records
         $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)) as balance");
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         $this->db->group_by('a.customer_id');
          if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
          if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
         }
         if($searchValue != '')
         $this->db->where($searchQuery);
         $this->db->having('balance > 0');
         $this->db->order_by($columnName, $columnSortOrder);
         $this->db->limit($rowperpage, $start);
         $records = $this->db->get()->result();
         $data = array();
         $sl =1;
  
         foreach($records as $record ){
          $button = '';
          $base_url = base_url();
 
          if($this->permission1->method('credit_customer','update')->access()){
            $button .=' <a href="'.$base_url.'edit_customer/'.$record->customer_id.'" class="btn btn-info btn-xs m-b-5 custom_btn" data-toggle="tooltip" data-placement="left" title="Update"><i class="pe-7s-note" aria-hidden="true"></i></a>';
          }
          if($this->permission1->method('credit_customer','dalete')->access()){
            $button .=' <a onclick="customerdelete('.$record->customer_id.')" href="javascript:void(0)"  class="btn btn-danger btn-xs m-b-5 custom_btn" data-toggle="tooltip" data-placement="right" title="Delete "><i class="pe-7s-trash" aria-hidden="true"></i></a>';
          }


        
               
            $data[] = array( 
                'sl'               =>$sl,
                'customer_name'    =>$record->customer_name,
                'address'          =>$record->customer_address,
                'address2'         =>$record->address2,
                'mobile'           =>$record->customer_mobile,
                'phone'            =>$record->phone,
                'email'            =>$record->customer_email,
                'email_address'    =>$record->email_address,
                'contact'          =>$record->contact,
                'fax'              =>$record->fax,
                'city'             =>$record->city,
                'state'            =>$record->state,
                'zip'              =>$record->zip,
                'country'          =>$record->country,
                'balance'          =>(!empty($record->balance)?$record->balance:0),
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

    //paid customer list
     public function bdtask_getPaidCustomerList($postData=null){

         $response = array();
         $customer_id =  $this->input->post('customer_id');
         $custom_data = $this->input->post('customfiled');
         if(!empty($custom_data)){
         $cus_data = [''];
         foreach ($custom_data as $cusd) {
           $cus_data[] = $cusd;
         }
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
            $searchQuery = " (a.customer_name like '%".$searchValue."%' or a.customer_mobile like '%".$searchValue."%' or a.customer_email like '%".$searchValue."%'or a.phone like '%".$searchValue."%' or a.customer_address like '%".$searchValue."%' or a.country like '%".$searchValue."%' or a.state like '%".$searchValue."%' or a.zip like '%".$searchValue."%' or a.city like '%".$searchValue."%') ";
         }

         ## Total number of records without filtering
         $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)) as balance");
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         
         if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
         if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
         }
          if($searchValue != '')
         $this->db->where($searchQuery);
         $this->db->having('balance <= 0'); 
         $this->db->group_by('a.customer_id');
         $totalRecords =$this->db->get()->num_rows();

         ## Total number of record with filtering
         $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)) as balance");
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
          if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
         }
         if($searchValue != '')
            $this->db->where($searchQuery);
           $this->db->having('balance <= 0');
           $this->db->group_by('a.customer_id');
         $totalRecordwithFilter = $this->db->get()->num_rows();

         ## Fetch records
         $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode` AND IsAppove = 1)) as balance");
         $this->db->from('customer_information a');
         $this->db->join('acc_coa b','a.customer_id = b.customer_id','left');
         $this->db->group_by('a.customer_id');
          if(!empty($customer_id)){
             $this->db->where('a.customer_id',$customer_id);
         }
          if(!empty($custom_data)){
             $this->db->where_in('a.customer_id',$cus_data);
         }
         if($searchValue != '')
         $this->db->where($searchQuery);
         $this->db->having('balance <= 0');
         $this->db->order_by($columnName, $columnSortOrder);
         $this->db->limit($rowperpage, $start);
         $this->db->group_by('a.customer_id');
         $records = $this->db->get()->result();
         $data = array();
         $sl =1;
  
         foreach($records as $record ){
          $button = '';
          $base_url = base_url();
 
          if($this->permission1->method('paid_customer','update')->access()){
            $button .=' <a href="'.$base_url.'edit_customer/'.$record->customer_id.'" class="btn btn-info btn-xs m-b-5 custom_btn" data-toggle="tooltip" data-placement="left" title="Update"><i class="pe-7s-note" aria-hidden="true"></i></a>';
          }
          if($this->permission1->method('paid_customer','delete')->access()){
            $button .=' <a onclick="customerdelete('.$record->customer_id.')" href="javascript:void(0)"  class="btn btn-danger btn-xs m-b-5 custom_btn" data-toggle="tooltip" data-placement="right" title="Delete "><i class="pe-7s-trash" aria-hidden="true"></i></a>';
          }


        
               
            $data[] = array( 
                'sl'               =>$sl,
                'customer_name'    =>$record->customer_name,
                'address'          =>$record->customer_address,
                'address2'         =>$record->address2,
                'mobile'           =>$record->customer_mobile,
                'phone'            =>$record->phone,
                'email'            =>$record->customer_email,
                'email_address'    =>$record->email_address,
                'contact'          =>$record->contact,
                'fax'              =>$record->fax,
                'city'             =>$record->city,
                'state'            =>$record->state,
                'zip'              =>$record->zip,
                'country'          =>$record->country,
                'balance'          =>(!empty($record->balance)?$record->balance:0),
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

    public function individual_info($id){
      return $result = $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode`)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode`)) as balance")
      ->from('customer_information a')
      ->join('acc_coa b','a.customer_id = b.customer_id','left')
      ->where('a.customer_id',$id)
      ->group_by('a.customer_id')
      ->order_by('a.customer_name', 'asc')
      ->get()
      ->result();
    }

    public function credit_customer($offset=null, $limit=null)
    {
  

        return $result = $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode`)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode`)) as balance")
			->from('customer_information a')
			->join('acc_coa b','a.customer_id = b.customer_id','left')
			->having('balance > 0') 
			->group_by('a.customer_id')
			->order_by('a.customer_name', 'asc')
			->limit($offset, $limit)
			->get()
			->result();

         
    }


     public function count_credit_customer()
    {
        return $result = $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode`)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode`)) as balance")
			->from('customer_information a')
			->join('acc_coa b','a.customer_id = b.customer_id','left')
			->having('balance > 0') 
			->group_by('a.customer_id')
			->order_by('a.customer_name', 'asc')
			->get()
			->num_rows();

         
    }

	public function singledata($id = null)
	{
		return $this->db->select('*')
			->from('customer_information')
			->where('customer_id', $id)
			->get()
			->row();
	}

  public function allcustomer()
  {
    return $this->db->select('*')
      ->from('customer_information')
      ->get()
      ->result();
  }

  public function bdtask_all_credit_customer(){

   return $data =  $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode`)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode`)) as balance")
      ->from('customer_information a')
      ->join('acc_coa b','a.customer_id = b.customer_id','left')
      ->having('balance > 0')
      ->group_by('a.customer_id')
      ->order_by('a.customer_name', 'asc')
      ->get()
      ->result();
  }

    public function bdtask_all_paid_customer(){

   return $data =  $this->db->select("a.*,b.HeadCode,((select ifnull(sum(Debit),0) from acc_transaction where COAID= `b`.`HeadCode`)-(select ifnull(sum(Credit),0) from acc_transaction where COAID= `b`.`HeadCode`)) as balance")
      ->from('customer_information a')
      ->join('acc_coa b','a.customer_id = b.customer_id','left')
      ->having('balance <= 0')
      ->group_by('a.customer_id')
      ->order_by('a.customer_name', 'asc')
      ->get()
      ->result();
  }

	public function update($data = array())
	{
		$updatecustomer =  $this->db->where('customer_id', $data["customer_id"])
			->update("customer_information", $data);

		$customer_id = $data["customer_id"];
        $old_headnam = $customer_id.'-'.$this->input->post("old_name");
        $c_acc=$customer_id.'-'.$data["customer_name"];
         $customer_coa = [
             'HeadName'         => $c_acc
        ];

        $sub_acc = [
          'name'        => $data['customer_name'],
        ];

        $this->db->where('referenceNo', $customer_id)
                 ->where('subTypeId', 3)
                 ->update('acc_subcode',$sub_acc);
     
      return true;
	}

	public function delete($id = null)
	{
    $this->db->where('referenceNo', $id)
                 ->where('subTypeId', 3)
                 ->delete('acc_subcode');

		return $this->db->where('customer_id', $id)
			->delete("customer_information");
	}


	   public function headcode(){
        $query=$this->db->query("SELECT MAX(HeadCode) as HeadCode FROM acc_coa WHERE HeadLevel='4' And HeadCode LIKE '113100%'");
        return $query->row();

    }


    public function previous_balance_add($balance, $customer_id) {
    $cusifo = $this->db->select('*')->from('customer_information')->where('customer_id',$customer_id)->get()->row();
    $headn = $customer_id.'-'.$cusifo->customer_name;
    $coainfo = $this->db->select('*')->from('acc_coa')->where('HeadName',$headn)->get()->row();
    $customer_headcode = $coainfo->HeadCode;
        $transaction_id = $this->generator(10);
       

// Customer debit for previous balance
      $cosdr = array(
      'VNo'            =>  $transaction_id,
      'Vtype'          =>  'PR Balance',
      'VDate'          =>  date("Y-m-d"),
      'COAID'          =>  $customer_headcode,
      'Narration'      =>  'Customer debit For '.$cusifo->customer_name,
      'Debit'          =>  $balance,
      'Credit'         =>  0,
      'IsPosted'       => 1,
      'CreateBy'       => $this->session->userdata('id'),
      'CreateDate'     => date('Y-m-d H:i:s'),
      'IsAppove'       => 1
    );
       $inventory = array(
      'VNo'            =>  $transaction_id,
      'Vtype'          =>  'PR Balance',
      'VDate'          =>  date("Y-m-d"),
      'COAID'          =>  1141,
      'Narration'      =>  'Inventory credit For Old sale For'.$cusifo->customer_name,
      'Debit'          =>  0,
      'Credit'         =>  $balance,//purchase price asbe
      'IsPosted'       => 1,
      'CreateBy'       => $this->session->userdata('id'),
      'CreateDate'     => date('Y-m-d H:i:s'),
      'IsAppove'       => 1
    ); 

       
        if(!empty($balance)){
           $this->db->insert('acc_transaction', $cosdr); 
           $this->db->insert('acc_transaction', $inventory); 
        }
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


          public function customer_ledgerdata($per_page, $page) {
        $this->db->select('a.*,b.HeadName');
        $this->db->from('acc_transaction a');
        $this->db->join('acc_coa b','a.COAID=b.HeadCode');
        $this->db->where('b.PHeadName','Customer Receivable');
        $this->db->where('a.IsAppove',1);
        $this->db->order_by('a.VDate','desc');
        $this->db->limit($per_page, $page);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

        
        public function count_customer_ledger() {
        $this->db->select('a.*,b.HeadName');
        $this->db->from('acc_transaction a');
        $this->db->join('acc_coa b','a.COAID=b.HeadCode');
        $this->db->where('b.PHeadName','Customer Receivable');
        $this->db->where('a.IsAppove',1);
        $this->db->order_by('a.VDate','desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();
        }
        return false;
    }
  

      public function customer_list_ledger() {
        $this->db->select('*');
        $this->db->from('customer_information');
        $this->db->order_by('customer_name', 'asc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

        public function customer_personal_data($customer_id) {
        $this->db->select('*');
        $this->db->from('customer_information');
        $this->db->where('customer_id', $customer_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

           public function customerledger_searchdata($customer_id, $start, $end) {
        $this->db->select('a.*,b.HeadName');
        $this->db->from('acc_transaction a');
        $this->db->join('acc_coa b','a.COAID=b.HeadCode');
        $this->db->where(array('b.customer_id' => $customer_id, 'a.VDate >=' => $start, 'a.VDate <=' => $end));
        $this->db->where('a.IsAppove',1);
        $this->db->order_by('a.VDate','desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

        public function customer_list_advance(){
        $this->db->select('*');
        $this->db->from('customer_information');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

        public function advance_details($transaction_id,$customer_id){

        $headcode = $this->db->select('HeadCode')->from('acc_coa')->where('customer_id',$customer_id)->get()->row();
        return $data  = $this->db->select('*')
                        ->from('acc_transaction')
                        ->where('VNo',$transaction_id)
                        ->where('COAID',$headcode->HeadCode)
                        ->get()
                        ->result_array();

    }

}

