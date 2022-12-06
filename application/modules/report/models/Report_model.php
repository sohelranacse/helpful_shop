<?php
defined('BASEPATH') OR exit('No direct script access allowed');

 #------------------------------------    
    # Author: Bdtask Ltd
    # Author link: https://www.bdtask.com/
    # Dynamic style php file
    # Developed by :Isahaq
    #------------------------------------    

class Report_model extends CI_Model {


    function warehouse_list() {
        $query = $this->db->query("SELECT * FROM warehouse");
        return $query->result();
    }
    function get_item_list_by_warehouse($warehouse_id) {
        $query = $this->db->query("
            SELECT a.product_id, a.product_name, b.quantity
            FROM product_information a
            LEFT JOIN opening_item_stock b ON (a.product_id = b.product_id)
            AND b.warehouse_id = $warehouse_id
            ORDER BY a.product_name
        ");
        return $query->result();
    }
    function add_opening_stock() {
        $warehouse_id = $this->input->post('warehouse_id');
        $product_id_A = $this->input->post('product_id');
        $quantity = $this->input->post('quantity');


        // flash warehouse opening quantity
        $this->db->where('warehouse_id', $warehouse_id);
        $this->db->delete('opening_item_stock');

        foreach($product_id_A as $key => $product_id) {

            if($quantity[$key]) {
                $data = array(
                    'product_id'    => $product_id,
                    'quantity'      => $quantity[$key],
                    'warehouse_id'  => $warehouse_id,
                );
                // insert now
                $this->db->insert('opening_item_stock', $data);
            }
        }
    }
    public function bdtask_getStock($postData=null){

         $response = array();

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
            $searchQuery = " (a.product_name like '%".$searchValue."%' or a.product_model like '%".$searchValue."%') ";
         }

         ## Total number of records without filtering
         $this->db->select('count(*) as allcount');
         $this->db->from('product_information a');
          if($searchValue != ''){
         $this->db->where($searchQuery);
        }
        $this->db->group_by('a.product_id');
         $records = $this->db->get()->num_rows();
         $totalRecords = $records;

         ## Total number of record with filtering
         $this->db->select('count(*) as allcount');
         $this->db->from('product_information a');
         if($searchValue != ''){
            $this->db->where($searchQuery);
        }
         $this->db->group_by('a.product_id');
         $records = $this->db->get()->num_rows();
         $totalRecordwithFilter = $records;

         ## Fetch records
         $this->db->select("a.*,
                a.product_name,
                a.product_id,
                b.category_name
                ");
         $this->db->from('product_information a');
         $this->db->join('product_category b', 'b.category_id =a.category_id', 'inner');
         if($searchValue != '')
            $this->db->where($searchQuery);
         $this->db->order_by($columnName, $columnSortOrder);
         $this->db->group_by('a.product_id');
         $this->db->limit($rowperpage, $start);
         $records = $this->db->get()->result();
         $data = array();
         $sl =1;
         foreach($records as $record ){
            $opening_quantity = 0;

            $and_warehouse_id = "";
            $warehouse_id = $this->session->userdata('warehouse_id');
            if($this->session->userdata('user_type') != 1)
                $and_warehouse_id = "AND a.warehouse_id = $warehouse_id";


            $q = $this->db->query("SELECT * FROM opening_item_stock a WHERE a.product_id = $record->product_id $and_warehouse_id");
            if($q->num_rows())
                $opening_quantity = $q->row()->quantity;



            $q1 = $this->db->query("
                SELECT SUM(b.quantity) AS totalSalesQnty
                FROM invoice a
                INNER JOIN invoice_details b ON (a.id = b.invoice_id)
                WHERE b.product_id = $record->product_id
                $and_warehouse_id
            ");
            $stockin = $q1->row();

            $q2 = $this->db->query("
                SELECT SUM(b.quantity) AS totalPurchaseQnty, Avg(b.rate) as purchaseprice
                FROM product_purchase a
                INNER JOIN product_purchase_details b ON (a.id = b.purchase_id)
                WHERE b.product_id = $record->product_id
                $and_warehouse_id
            ");
            $stockout = $q2->row();

            // $stockin = $this->db->select('sum(quantity) as totalSalesQnty')->from('invoice_details')->where('product_id',$record->product_id)->get()->row();
            // $stockout = $this->db->select('sum(quantity) as totalPurchaseQnty,Avg(rate) as purchaseprice')->from('product_purchase_details')->where('product_id',$record->product_id)->get()->row();
            

            $sprice = (!empty($record->price)?$record->price:0);
            $pprice = (!empty($stockout->purchaseprice)?sprintf('%0.2f',$stockout->purchaseprice):0); 
            $stock =  (!empty($stockout->totalPurchaseQnty)?$stockout->totalPurchaseQnty:0)-(!empty($stockin->totalSalesQnty)?$stockin->totalSalesQnty:0);
            $data[] = array( 
                'sl'            =>   $sl,
                'product_name'  =>  $record->product_name,
                'product_model' =>  $record->category_name,
                'sales_price'   =>  sprintf('%0.2f',$sprice),
                'purchase_p'    =>  $pprice,
                'opening_quantity'  =>  $opening_quantity,
                'totalPurchaseQnty'=>$stockout->totalPurchaseQnty,
                'totalSalesQnty'=>  $stockin->totalSalesQnty,
                'stok_quantity' => sprintf('%0.2f',$stock+$opening_quantity),
                
                'total_sale_price'=> ($opening_quantity + $stockout->totalPurchaseQnty-$stockin->totalSalesQnty)*$sprice,
                'purchase_total' =>  ($opening_quantity + $stockout->totalPurchaseQnty-$stockin->totalSalesQnty)*$pprice,
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



        public function totalnumberof_product(){

        $this->db->select("a.*,
                a.product_name,
                a.product_id,
                c.supplier_price
                ");
        $this->db->from('product_information a');
    
        $this->db->join('supplier_product c','c.product_id = a.product_id','left');
        $this->db->group_by('a.product_id');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();  
        }
        return false;

    }


     public function accounts_closing_data() {
        $last_closing_amount = $this->get_last_closing_amount();
        $cash_in = $this->cash_data_receipt();
        $cash_out = $this->cash_data();
        if ($last_closing_amount != null) {
            $last_closing_amount = $last_closing_amount[0]['amount'];
            $cash_in_hand = ($last_closing_amount+$cash_in) - $cash_out;
        } else {
            $last_closing_amount = 0;
            $cash_in_hand = $cash_in - $cash_out;
        }


        return array(
            "last_day_closing" => number_format($last_closing_amount, 2, '.', ','),
            "cash_in"          => number_format($cash_in, 2, '.', ','),
            "cash_out"         => number_format($cash_out, 2, '.', ','),
            "cash_in_hand"     => number_format($cash_in_hand, 2, '.', ',')
        );
    }

     public function get_last_closing_amount() {
        $sql = "SELECT amount FROM daily_closing WHERE date = (SELECT MAX(date) FROM daily_closing)";
        $query = $this->db->query($sql);
        $result = $query->result_array();
        if ($result) {
            return $result;
        } else {
            return FALSE;
        }
    }

          public function cash_data_receipt() {
        //-----------
        $cash = 0;
        $datse = date('Y-m-d');
        $this->db->select('sum(Debit) as amount');
        $this->db->from('acc_transaction');
        $this->db->where('COAID', 111000001);
        $this->db->where('VDate', $datse);
        $result_amount = $this->db->get();
        $amount = $result_amount->result_array();
        $cash += $amount[0]['amount'];
        return $cash;
    }


    public function cash_data() {
        //-----------
        $cash = 0;
        $datse = date('Y-m-d');
        $this->db->select('sum(Credit) as amount');
        $this->db->from('acc_transaction');
        $this->db->where('COAID', 111000001);
        $this->db->where('VDate', $datse);
        $result_amount = $this->db->get();
        $amount = $result_amount->result_array();
        $cash += $amount[0]['amount'];
        return $cash;
    }

    //CLOSING ENTRY
    public function daily_closing_entry($data) {
        return $this->db->insert('daily_closing', $data);
    }



    public function get_closing_report() {
        $this->db->select("* ,(opening_balance + amount_in) - amount_out as 'cash_in_hand'");
        $this->db->from('closing_records');
        $this->db->where('status', 1);
        $this->db->order_by('datetime', 'desc');
        $query = $this->db->get();
        return $query->result_array();
    }


    public function get_date_wise_closing_report($from_date, $to_date) {
        $dateRange = "DATE(datetime) BETWEEN '$from_date' AND '$to_date'";
        $this->db->select("* ,(opening_balance + amount_in) - amount_out as 'cash_in_hand'");
        $this->db->from('closing_records');
        $this->db->where('status', 1);
        $this->db->where($dateRange, NULL, FALSE);
        $this->db->order_by('datetime', 'desc');
        $query = $this->db->get();
        return $query->result_array();
    }


        //Retrieve todays_sales_report
    public function todays_sales_report() {
        $today = date('Y-m-d');
        $this->db->select("a.*,b.customer_id,b.customer_name");
        $this->db->from('invoice a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('a.date', $today);
        $this->db->order_by('a.invoice_id', 'desc');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
    public function getSalesReportList($postData=null){

        $response = array();

        $fromdate = $this->input->post('fromdate');
        $todate   = $this->input->post('todate');
        if(!empty($fromdate)){
           $datbetween = "(a.date BETWEEN '$fromdate' AND '$todate')";
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
           $searchQuery = " (a.date like '%".$searchValue."%' or a.invoice_id like '%".$searchValue."%' or a.total_amount like'%".$searchValue."%' or b.customer_name like'%".$searchValue."%') ";
        }

        ## Total number of records without filtering
        $this->db->select('count(*) as allcount');
        $this->db->from('invoice a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        if(!empty($fromdate) && !empty($todate)){
            $this->db->where($datbetween);
        }
         if($searchValue != '')
        $this->db->where($searchQuery);
        $records = $this->db->get()->result();
        $totalRecords = $records[0]->allcount;

        ## Total number of record with filtering
        $this->db->select('count(*) as allcount');
        $this->db->from('invoice a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        if(!empty($fromdate) && !empty($todate)){
            $this->db->where($datbetween);
        }
        if($searchValue != '')
           $this->db->where($searchQuery);
        $records = $this->db->get()->result();
        $totalRecordwithFilter = $records[0]->allcount;

        ## Fetch records
        $this->db->select("a.*,b.customer_id,b.customer_name");
        $this->db->from('invoice a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
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
 
        $sales_amount = 0;
        foreach($records as $record ){
         $button = '';
         $base_url = base_url();
        $customer = $record->customer_name;
              
           $data[] = array( 
               'date'                   =>$record->date,               
               'invoice_id'             =>$record->invoice_id,               
               'customer_name'          =>$customer,
               'due_amount'             =>$record->due_amount,               
               'total_amount'     =>$record->total_amount,               
           ); 
           $sales_amount += $record->total_amount;
           $sl++;
        }

        ## Response
        $response = array(
           "draw" => intval($draw),
           "iTotalRecords" => $totalRecordwithFilter,
           "iTotalDisplayRecords" => $totalRecords,
           "sales_amount" => $sales_amount,
           "aaData" => $data
        );

        return $response; 
   }

    //Retrieve all Report
    public function retrieve_dateWise_SalesReports($from_date, $to_date) {
        $this->db->select("a.*,b.*");
        $this->db->from('invoice a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('a.date >=', $from_date);
        $this->db->where('a.date <=', $to_date);
        $this->db->order_by('a.date', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

        //Retrieve todays_purchase_report
       public function todays_purchase_report() {
        $today = date('Y-m-d');
        $this->db->select("a.*,b.supplier_id,b.supplier_name");
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
        $this->db->where('a.purchase_date', $today);
        $this->db->order_by('a.purchase_id', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    //    ======= its for  todays_customer_receipt ===========
    public function todays_customer_receipt($today = null) {
         $this->db->select('a.*,b.HeadName, c.name');
        $this->db->from('acc_transaction a');
        $this->db->join('acc_coa b','a.COAID=b.HeadCode');
         $this->db->join('acc_subcode c','a.subCode=c.id');
        $this->db->where('a.subType',3);
        $this->db->where('a.Credit >',0);
        $this->db->where('DATE(a.VDate)',$today);
        $this->db->where('a.IsAppove',1);
        $query = $this->db->get();
        return $query->result();
    }

        public function filter_customer_wise_receipt($custome_id = null, $from_date = null) {
        $this->db->select('a.Narration,b.HeadName,a.Credit,b.HeadName, c.name');
        $this->db->from('acc_transaction a');
        $this->db->join('acc_coa b','a.COAID=b.HeadCode');
        $this->db->join('acc_subcode c','a.subCode=c.id');
        $this->db->where('c.referenceNo',$custome_id);
        $this->db->where('a.Credit >',0);
        $this->db->where('a.subType',3);
        $this->db->where('DATE(a.VDate)',$from_date);
        $this->db->where('a.IsAppove',1);
        $query = $this->db->get();
        return $query->result();
    }

    public function customerinfo_rpt($customer_id){
       return $this->db->select('*')   
            ->from('customer_information')
            ->where('customer_id',$customer_id)
            ->get()
            ->result_array(); 
    }


        // ======================= user sales report ================
    public function user_sales_report($from_date,$to_date,$user_id) {
        $this->db->select("sum(total_amount) as amount,count(a.invoice_id) as toal_invoice,a.*,b.first_name,b.last_name");
        $this->db->from('invoice a');
        $this->db->join('users b', 'b.user_id = a.sales_by','left');
        if(!empty($user_id)){
        $this->db->where('a.sales_by', $user_id);    
        }
        $this->db->where('a.date >=', $from_date);
        $this->db->where('a.date <=', $to_date);
        $this->db->group_by('a.sales_by');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


        public function userList(){
        $this->db->select("*");
        $this->db->from('users');
        $this->db->order_by('first_name', 'asc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


    public function retrieve_dateWise_DueReports($from_date, $to_date) {
        $this->db->select("a.*,b.*,c.*");
        $this->db->from('invoice a');
        $this->db->join('invoice_details c', 'c.invoice_id = a.id');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('a.date BETWEEN "'.$from_date. '" and "'.$to_date.'"');
        $this->db->where('a.due_amount >',0);
        $this->db->group_by('a.invoice_id');
        $this->db->order_by('a.invoice', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
    public function get_retrieve_dateWise_DueReports($postData=null){

        $response = array();

        $fromdate = $this->input->post('fromdate');
        $todate   = $this->input->post('todate');
        if(!empty($fromdate)){
           $datbetween = "(a.date BETWEEN '$fromdate' AND '$todate')";
        }else{
           $datbetween = "";
        }
        // dd($datbetween);

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
           $searchQuery = " (a.date like '%".$searchValue."%' or a.invoice_id like '%".$searchValue."%' or a.total_amount like'%".$searchValue."%' or b.customer_name like'%".$searchValue."%') ";
        }

        ## Total number of records without filtering
        $this->db->select('count(*) as allcount');
        $this->db->from('invoice a');
        $this->db->join('invoice_details c', 'c.invoice_id = a.id');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('a.due_amount >',0);
        if(!empty($fromdate) && !empty($todate)){
            $this->db->where($datbetween);
        }
         if($searchValue != '')
        $this->db->where($searchQuery);
        $records = $this->db->get()->result();
        $totalRecords = $records[0]->allcount;

        ## Total number of record with filtering
        $this->db->select('count(*) as allcount');
        $this->db->from('invoice a');
        $this->db->join('invoice_details c', 'c.invoice_id = a.id');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('a.due_amount >',0);
        if(!empty($fromdate) && !empty($todate)){
            $this->db->where($datbetween);
        }
        if($searchValue != '')
           $this->db->where($searchQuery);
        $records = $this->db->get()->result();
        $totalRecordwithFilter = $records[0]->allcount;

        ## Fetch records
        $this->db->select("a.*,b.customer_id,b.customer_name");
        $this->db->from('invoice a');
        $this->db->join('invoice_details c', 'c.invoice_id = a.id');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('a.due_amount >',0);
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
 
        $sales_amount = 0;
        // dd($records);
        foreach($records as $record ){
         $button = '';
         $base_url = base_url();
        $customer = $record->customer_name;
              
           $data[] = array( 
               'date'                   =>$record->date,               
               'invoice_id'             =>$record->invoice_id,               
               'customer_name'          =>$customer,
               'total_amount'           =>$record->total_amount,               
               'paid_amount'            =>$record->paid_amount,               
               'due_amount'             =>$record->due_amount,               
           ); 
           $sales_amount += $record->total_amount;
           $sl++;
        }

        ## Response
        $response = array(
           "draw" => intval($draw),
           "iTotalRecords" => $totalRecordwithFilter,
           "iTotalDisplayRecords" => $totalRecords,
           "sales_amount" => $sales_amount,
           "aaData" => $data
        );

        return $response; 
   }



        // ================= Shipping cost ===========================
        public function retrieve_dateWise_Shippingcost($from_date, $to_date) {
        $this->db->select("a.*");
        $this->db->from('invoice a');
        $this->db->where('a.date >=', $from_date);
        $this->db->where('a.date <=', $to_date);
         $this->db->group_by('a.invoice_id');
        $this->db->order_by('a.date', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

   

        //Retrieve todays_purchase_report
    public function bdtask_purchase_report($from_date, $to_date) {
        $today = date('Y-m-d');
        $this->db->select("a.*,b.supplier_id,b.supplier_name");
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
        $this->db->where('a.purchase_date >=', $from_date);
        $this->db->where('a.purchase_date <=', $to_date);
        $this->db->order_by('a.purchase_date', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }
    public function getReportList($postData=null){

        $response = array();

        $fromdate = $this->input->post('fromdate');
        $todate   = $this->input->post('todate');
        if(!empty($fromdate)){
           $datbetween = "(a.purchase_date BETWEEN '$fromdate' AND '$todate')";
        }else{
           $datbetween = "";
        }
        // dd($datbetween);

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
           $searchQuery = " (a.purchase_date like '%".$searchValue."%' or a.purchase_id like '%".$searchValue."%' or a.grand_total_amount like'%".$searchValue."%' or b.supplier_name like'%".$searchValue."%') ";
        }

        ## Total number of records without filtering
        $this->db->select('count(*) as allcount');
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
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
        $this->db->join('supplier_information b','b.supplier_id = a.supplier_id','left');
        if(!empty($fromdate) && !empty($todate)){
            $this->db->where($datbetween);
        }
        if($searchValue != '')
           $this->db->where($searchQuery);
        $records = $this->db->get()->result();
        $totalRecordwithFilter = $records[0]->allcount;

        ## Fetch records
        $this->db->select("a.*,b.supplier_id,b.supplier_name");
        $this->db->from('product_purchase a');
        $this->db->join('supplier_information b','b.supplier_id = a.supplier_id','left');
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
 
        $purchase_amount = 0;
        // dd($records);
        foreach($records as $record ){
         $button = '';
         $base_url = base_url();
        $supplier = $record->supplier_name;
              
           $data[] = array( 
               'purchase_date'          =>$record->purchase_date,               
               'purchase_id'            =>$record->purchase_id,               
               'supplier_name'          =>$supplier,
               'due_amount'             =>$record->due_amount,               
               'grand_total_amount'     =>$record->grand_total_amount,               
           ); 
           $purchase_amount += $record->grand_total_amount;
           $sl++;
        }

        ## Response
        $response = array(
           "draw" => intval($draw),
           "iTotalRecords" => $totalRecordwithFilter,
           "iTotalDisplayRecords" => $totalRecords,
           "purchase_amount" => $purchase_amount,
           "aaData" => $data
        );

        return $response; 
   }


        public function category_list_product() {
        $this->db->select('*');
        $this->db->from('product_category');
        $this->db->where('status', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


    //    ============= its for purchase_report_category_wise ===============
    public function purchase_report_category_wise($from_date,$to_date,$category) {
        $this->db->select('b.product_name, b.product_model, SUM(a.quantity) as quantity, SUM(a.total_amount) as total_amount, d.purchase_date, c.category_name');
        $this->db->group_by('b.product_id, c.category_id');
        $this->db->from('product_purchase_details a');
        $this->db->join('product_information b', 'b.product_id = a.product_id');
        $this->db->join('product_category c', 'c.category_id = b.category_id');
        $this->db->join('product_purchase d', 'd.id = a.purchase_id');
        $this->db->where('d.purchase_date >=', $from_date);
        $this->db->where('d.purchase_date <=', $to_date);
        if($category){
        $this->db->where('c.category_id', $category);
    }
        $query = $this->db->get();
        return $query->result();
    }


        //RETRIEVE DATE WISE SINGE PRODUCT REPORT
    public function retrieve_product_sales_report($from_date,$to_date,$product_id) {
        $this->db->select("a.*,b.product_name,b.product_model,c.date,c.invoice,c.total_amount,d.customer_name");
        $this->db->from('invoice_details a');
        $this->db->join('product_information b', 'b.product_id = a.product_id');
        $this->db->join('invoice c', 'c.id = a.invoice_id');
        $this->db->join('customer_information d', 'd.customer_id = c.customer_id');
        $this->db->where('c.date >=', $from_date);
        $this->db->where('c.date <=', $to_date);
        if($product_id){
        $this->db->where('a.product_id', $product_id);   
        }
        $this->db->order_by('c.date', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

        public function product_list(){
        $this->db->select('*');
        $this->db->from('product_information');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


        //    ============= its for sales_report_category_wise ===============
    public function sales_report_category_wise($from_date,$to_date,$category) {
        $this->db->select('b.product_name, b.product_model, sum(a.quantity) as quantity, sum(a.total_price) as total_price, d.date, c.category_name');
        $this->db->from('invoice_details a');
        $this->db->join('product_information b', 'b.product_id = a.product_id');
        $this->db->join('product_category c', 'c.category_id = b.category_id');
        $this->db->join('invoice d', 'd.id = a.invoice_id');
        $this->db->where('d.date >=', $from_date);
        $this->db->where('d.date <=', $to_date);
        if($category){
        $this->db->where('b.category_id', $category);   
        }
        $this->db->group_by('b.product_id, c.category_id');
        $query = $this->db->get();
        return $query->result();
    }


    // sales return data
        public function sales_return_list($start,$end) {
        $this->db->select('a.net_total_amount,a.*,b.customer_name');
        $this->db->from('product_return a');
        $this->db->join('customer_information b', 'b.customer_id = a.customer_id');
        $this->db->where('usablity', 1);
        $this->db->where('a.date_return >=', $start);
        $this->db->where('a.date_return <=', $end);
        $this->db->order_by('a.date_return', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


        // return supplier
     public function supplier_return($start,$end) {
        $this->db->select('a.net_total_amount,a.*,b.supplier_name');
        $this->db->from('product_return a');
        $this->db->join('supplier_information b', 'b.supplier_id = a.supplier_id');
        $this->db->where('usablity', 2);
        $this->db->where('a.date_return >=', $start);
        $this->db->where('a.date_return <=', $end);
        $this->db->order_by('a.date_return', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


    // tax report query
 public function retrieve_dateWise_tax($from_date, $to_date) {
        $this->db->select("a.*");
        $this->db->from('invoice a');
        $this->db->where('a.date >=', $from_date);
        $this->db->where('a.date <=', $to_date);
        $this->db->group_by('a.invoice_id');
        $this->db->order_by('a.date', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }


     //Total profit report
    public function total_profit_report($start_date,$end_date) {
        $this->db->select("a.date,a.invoice,b.invoice_id, CAST(sum(total_price) AS DECIMAL(16,2)) as total_sale");
        $this->db->select('CAST(sum(`quantity`*`supplier_rate`) AS DECIMAL(16,2)) as total_supplier_rate', FALSE);
        $this->db->select("CAST(SUM(total_price) - SUM(`quantity`*`supplier_rate`) AS DECIMAL(16,2)) AS total_profit");
        $this->db->from('invoice a');
        $this->db->join('invoice_details b', 'b.invoice_id = a.id');
        $this->db->where('a.date >=', $start_date);
        $this->db->where('a.date <=', $end_date);
        $this->db->group_by('b.invoice_id');
        $this->db->order_by('a.invoice', 'desc');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
    }

    public function payment_methods()
    {
         return $data = $this->db->select('*')
            ->from('acc_coa')
            ->where('PHeadName','Cash')
                ->or_where('PHeadName','Cash at Bank')
            ->get()
            ->result();   
    }

    public function received_bypayment_method($seller_id,$headcode)
    {
          $data = $this->db->select('sum(Debit) as total_received')
            ->from('acc_transaction')
            ->where('COAID',$headcode)
            ->where('CreateBy',$seller_id)
            ->where('VDate',date('Y-m-d'))
            ->where('IsAppove',1)
            ->get()
            ->row();
            return ($data?$data->total_received:0);   
    }

    public function paid_bypayment_method($seller_id,$headcode)
    {
        $data = $this->db->select('sum(Credit) as total_paid')
            ->from('acc_transaction')
            ->where('COAID',$headcode)
            ->where('CreateBy',$seller_id)
            ->where('VDate',date('Y-m-d'))
            ->where('IsAppove',1)
            ->get()
            ->row();
            return ($data?$data->total_paid:0);   
    }

    public function create_opening($data=[])
    {
       return $this->db->insert('closing_records', $data);
    }
}

