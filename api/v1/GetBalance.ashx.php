<?php
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);
require 'koneksi.php';
header('Content-Type: application/json');

if(isset($_GET['agent_token']) && isset($_GET['agent_code']) && isset($_GET['username'])){
    $agent_token = mysqli_real_escape_string($call, $_GET['agent_token']);
    $agent_code = mysqli_real_escape_string($call, $_GET['agent_code']);
    $username = mysqli_real_escape_string($call, $_GET['username']);
    
    $cek_op = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_token = '$agent_token' AND agent_code = '$agent_code'");
    $cek_user = mysqli_query($call, "SELECT * FROM tb_user WHERE extUser = '$username' AND agent_code = '$agent_code'");
    
    if(empty($agent_token) || empty($agent_code) || empty($username)){
        $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
    } else if(mysqli_num_rows($cek_op) == 0){
        $res = array('status' => 'fail', 'msg' => 'Agent Tidak Ada');
    } else if(mysqli_num_rows($cek_user) == 0){
        $res = array('status' => 'fail', 'msg' => 'Username Tidak Ada');
    } else {
        $data_op = mysqli_fetch_array($cek_op);
        $data_user = mysqli_fetch_array($cek_user);
        if($data_op['agent_status'] == "blocked"){
            $res = array('status' => 'fail', 'msg' => 'Agent Blocked');
        } else {
            $b = $GS->getBalanceUser($data_user['intUser']);
            if($b['status'] == 1){
                $balance = $b['user']['balance'];
                mysqli_query($call, "UPDATE tb_user SET balance = '$balance' WHERE extUser = '$username' AND agent_code = '$agent_code'");
                $res = array('status' => 'success', 'data' => array('username' => $username, 'balance' => $balance), 'msg' => 'SUCCESS');
            } else {
                $res = array('status' => 'fail', 'data' => array('username' => $username, 'balance' => 0), 'msg' => $b['msg']);
            }
            
        }
    }
} else {
    $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
}
print json_encode($res , JSON_PRETTY_PRINT);