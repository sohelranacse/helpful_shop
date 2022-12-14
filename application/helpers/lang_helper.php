<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

/*
*
* ---------------how to use-----------------
* ------------------------------------------
* Developed by <sourav.diubd@gmail.com>
*
* $autoload['helper'] =  array('lang');

* display a language
* echo display('helloworld'); 

* display language list
* $lang = languageList(); 
* ------------------------------------------
*
*/


if (!function_exists('display')) {

    function display($text = null)
    {
        $ci =& get_instance();
        $ci->load->database();
        $table  = 'language';
        $phrase = 'phrase';
        $setting_table = 'web_setting';
        $default_lang  = 'english';

        //set language  
        $data = $ci->db->get($setting_table)->row();
        if (!empty($data->language)) {
            $language = $data->language; 
        } else {
            $language = $default_lang; 
        } 
 
        if (!empty($text)) {

            if ($ci->db->table_exists($table)) { 

                if ($ci->db->field_exists($phrase, $table)) { 

                    if ($ci->db->field_exists($language, $table)) {

                        $row = $ci->db->select($language)
                              ->from($table)
                              ->where($phrase, $text)
                              ->get()
                              ->row(); 

                        if (!empty($row->$language)) {
                            return $row->$language;
                        } else {
                            return false;
                        }

                    } else {
                        return false;
                    }

                } else {
                    return false;
                }

            } else {
                return false;
            }            
        } else {
            return false;
        }  

    }
 
}

function dd($array){
    echo '<pre>';
    print_r($array);
    echo '</pre>';
    exit;
}

if (!function_exists('addActivityLog')) {

    function addActivityLog($type, $action_name, $id, $table, $status=0, $data = null){

        $ci =& get_instance();
        $ci->load->database();

        $postData = (empty($_POST))?array():$_POST;
        $actionData = array(
          'user_id'   => $ci->session->userdata('id'),
          'type'      => $type, 
          'action'    => $action_name, 
          'action_id' => $id, 
          'table_name'=>$table,
          'slug'      => uri_string(),
          'form_data' => ($data==null)?json_encode($postData):json_encode($data),
          'status'    => $status
        );

        $ci->db->insert('activity_logs',$actionData);

    }

}

function financial_year(){
    $ci =& get_instance();
    $ci->load->database();
    $ci->db->select("COUNT(id) as num,id");
    $ci->db->from("financial_year");
    $ci->db->where("startDate<=",date("Y-m-d"));
    $ci->db->where("endDate>=",date("Y-m-d"));
    $ci->db->where("status",1);
    $query = $ci->db->get();
    $row = $query->row();
    return $row->id;
}  

function unit_name($product_id) {
    $ci =& get_instance();
    $ci->load->database();
    $query = $ci->db->query("
        SELECT b.unit_name
        FROM product_information a
        INNER JOIN units b ON (a.unit = b.unit_id)
        WHERE a.product_id = $product_id
    ");
    return $query->row()->unit_name;
}
function currentLanguage() {
    $ci =& get_instance();
    $ci->load->database();
    $query = $ci->db->query("SELECT language FROM web_setting");
    return $query->row()->language;
}