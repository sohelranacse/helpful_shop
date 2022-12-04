<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Operational extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
    }

    // test purpose
	function updateLanguage() {

		$query = $this->db->query("SELECT * FROM language WHERE bangla IS NULL");
		$result = $query->result();
		foreach($result as $key => $value) {
			$id = $value->id;
			$english = $value->english;

			$bangla = $this->translate($english, "en", "bn"); // translated

			$data = array(
				'bangla'	=>	$bangla
			);
			$this->db->where('id', $id);
			$this->db->update('language', $data);
			echo $bangla.'<br>';
		}

	}

	function translate($q, $sl, $tl){
		$res="";

		$qqq=explode(".", $q);

		if(count($qqq)<2) {

			@unlink($_SERVER['DOCUMENT_ROOT']."/transes.html");
			copy("http://translate.googleapis.com/translate_a/single?client=gtx&ie=UTF-8&oe=UTF-8&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&dt=at&sl=".$sl."&tl=".$tl."&hl=hl&q=".urlencode($q), $_SERVER['DOCUMENT_ROOT']."/transes.html");
			if(file_exists($_SERVER['DOCUMENT_ROOT']."/transes.html")){
				$dara=file_get_contents($_SERVER['DOCUMENT_ROOT']."/transes.html");
				$f=explode("\"", $dara);

				$res.= $f[1];
			}
		} else{

			for($i=0;$i<(count($qqq)-1);$i++){

				if($qqq[$i]==' ' || $qqq[$i]==''){
				} else {
					copy("http://translate.googleapis.com/translate_a/single?client=gtx&ie=UTF-8&oe=UTF-8&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&dt=at&sl=".$s."&tl=".$e."&hl=hl&q=".urlencode($qqq[$i]), $_SERVER['DOCUMENT_ROOT']."/transes.html");

					$dara=file_get_contents($_SERVER['DOCUMENT_ROOT']."/transes.html");
					@unlink($_SERVER['DOCUMENT_ROOT']."/transes.html");
					$f=explode("\"", $dara);

					$res.= $f[1].". ";
				}
			}
		}
		return $res;
	}


	// language mode
	function languageMode($arg='') { // 1=English, 2= Bangl
		if($arg !== '') {
			$this->db->where('setting_id', 1);
			$this->db->update('web_setting', array('language' => $arg ));
		}
		redirect($_SERVER['HTTP_REFERER']);
	}


}