<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class FileModel extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function storeFile($data,$user_id) {
        $res = $this->db->insert('files', array('file_name'=>$data['upload_data']['file_name'],'file_type'=>$data['upload_data']['file_type'],'user_id'=>$user_id,'created_at'=>date('y-m-d')));
        if(!empty($res)){
            return true;
        }
    }

    public function getAllData($user_id) {
        $res = $this->db->select('*')->where('user_id',$user_id)->from('files')->get()->result_array();
        return $res;
    }
}