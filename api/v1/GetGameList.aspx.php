<?php
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);
require 'koneksi.php';
header('Content-Type: application/json');

if(isset($_GET['agent_token']) && isset($_GET['agent_code'])){
    $agent_token = mysqli_real_escape_string($call, $_GET['agent_token']);
    $agent_code = mysqli_real_escape_string($call, $_GET['agent_code']);
    
    $cek_op = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_token = '$agent_token' AND agent_code = '$agent_code'");
    
    if(empty($agent_token) || empty($agent_code)){
        $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
    } else if(mysqli_num_rows($cek_op) == 0){
        $res = array('status' => 'fail', 'msg' => 'Agent Tidak Ada');
    } else {
        $data_op = mysqli_fetch_array($cek_op);
        if($data_op['agent_status'] == "blocked"){
            $res = array('status' => 'fail', 'msg' => 'Agent Blocked');
        } else {
            $cek_p = mysqli_query($call, "SELECT * FROM tb_game");
            while($data_p = mysqli_fetch_array($cek_p)){
                $data[] = array(
                    'game_code' => $data_p['game_code'],
                    'game_name' => $data_p['game_name'],
                    'game_provider' => $data_p['game_provider'],
                    'game_type' => $data_p['game_type'],
                    'game_image' => $data_p['game_image'],
                    'game_status' => $data_p['game_status']);
            }
            $res = array('status' => 'success', 'games' => $data, 'msg' => 'SUCCESS');
        }
    }
} else {
    $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
}
print json_encode($res , JSON_PRETTY_PRINT);