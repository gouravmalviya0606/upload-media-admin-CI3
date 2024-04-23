<?php


defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class FileUploadController extends REST_Controller {

    public function __construct() {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        header("Access-Control-Allow-Headers: Authorization, Token, Content-Type, Site");
        parent::__construct();
        $this->load->model('FileModel');
        $this->load->helper('file');

    }

    public function uploadFile_post() {
        // $req = json_decode(file_get_contents('php://input'), true);
        $token = $this->input->post('token');
        $config['upload_path'] = '/opt/lampp/htdocs/projects/react/upload-media-admin/assets/uploads';
        $config['allowed_types'] = 'doc|docx|pdf|jpg|jpeg|png|gif';
        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('file')) {
            $error = array('error' => $this->upload->display_errors());
            echo json_encode($error);
        } else {
            $data = array('upload_data' => $this->upload->data());
            $res = $this->FileModel->storeFile($data,get_user_id_by_token($token));
            echo json_encode(array('status'=>200,'msg'=>'file upload successfully'));
        }
    }

    public function getAllData_post() {
        $req = json_decode(file_get_contents('php://input'), true);
        $res = $this->FileModel->getAllData(get_user_id_by_token($req['token']));
        $data = array(
            'status'=>'success',
            'data'=>$res
        );
        $this->response($data, REST_Controller::HTTP_OK);
    }
}

?>