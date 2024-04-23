<?php 

// get user id
if (!function_exists('get_user_id_by_token')) {
    function get_user_id_by_token($token)
    {
        $CI = & get_instance();
        $CI->db->select('user_id');
        $CI->db->from('user_token');
        $CI->db->where('token', $token);
        $results = $CI->db->get()->row();
        if(isset($results) && !empty($results)){
            return $results->user_id;
        }
        return false;
    }
}

?>