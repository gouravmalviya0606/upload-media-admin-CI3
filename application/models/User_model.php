<?php
 /**

 * Copyright (c) 2003-2019 BrightOutcome Inc.  All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * BrightOutcome Inc. ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only
 * in accordance with the terms of the license agreement you
 * entered into with BrightOutcome.
 *
 * BRIGHTOUTCOME MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE
 * SUITABILITY OF THE SOFTWARE, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT
 * NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE, OR NON-INFRINGEMENT. BRIGHTOUTCOME SHALL NOT BE LIABLE
 * FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR
 * DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/**
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * @desc Arm_model having functions related to Arm
 *
 */
class User_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function signup($params=array()){
        extract($params);
        $query = $this->db->select('email')
                ->where('email', $email)
                ->get('user');
        if($query->row()){
            return array("msg"=>"email already exist","status"=>false);
        }   
        else{
            $res = $this->db->insert('user', array('firstname' => $firstName, 'lastname' => $lastName, 'email' => $email, 'password' => $password));
            return array("msg"=>"user created successfully","status"=>true);
        }     
    }

    public function login($params = array()){
        extract($params);
        $query = $this->db->select('*')
                ->where('email', $email)
                ->where('password', $password)
                ->get('user');

        $user_id = 0;
        $token = null;
        if($query->row()){
            $token = base64_encode($query->row()->email);
            $user_id = $query->row()->id;
            $res = $this->db->insert('user_token', array('user_id' => $user_id,'token'=>$token));
        }        
        return array('status'=>$query->row() ? true : false,"token"=>$token);
    }

    public function logout($params){
        extract($params);
        if(!empty($token)){
            $res = $this->db->update('user_token', array('logout_at'=>date('Y-m-d')), array('token' => $token));
        }

        return $res ? true : false;
    }

}