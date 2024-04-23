<?php  
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
// Include Rest Controller library 
require APPPATH . '/libraries/REST_Controller.php'; 
 
class User extends REST_Controller {

    public function __construct()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        header("Access-Control-Allow-Headers: Authorization, Token, Content-Type, Site");
        parent::__construct();
        $this->load->model('User_model', 'user');
    }

    public function signup_post()
    {
        $signup_data = json_decode(file_get_contents('php://input'), true);
        $res = $this->user->signup($signup_data);
        $data = array(
            "status"=>503,
            "msg"=>"user created failed"
        );
        if($res['status']){
            $data['status'] = 200;
            $data['msg'] = $res["msg"];
        }
        else{
            $data['status'] = 503;
            $data['msg'] = $res["msg"];
        }
        $this->response($data, REST_Controller::HTTP_OK);
    }

    public function login_post(){
        $login_data = json_decode(file_get_contents('php://input'), true);
        $res = $this->user->login($login_data);
        $data = array(
            "status"=>503,
            "login" => false,
            "msg"=>""
        );
        if($res['status']){
            $data['status'] = 200;
            $data['login'] = true;
            $data['token'] = $res['token'];
            $data['msg'] = "user found successfully";
        }
        else{
            $data['status'] = 200;
            $data['login'] = false;
            $data['msg'] = "user not found";
        }
        $this->response($data, REST_Controller::HTTP_OK);
    }

    public function logout_post(){
        $user_data = json_decode(file_get_contents('php://input'), true);
        $res = $this->user->logout($user_data);
        $this->response($res, REST_Controller::HTTP_OK);
    }
}