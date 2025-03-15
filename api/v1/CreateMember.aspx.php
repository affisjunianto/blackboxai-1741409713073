<?php
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);
require 'koneksi.php';
header('Content-Type: application/json');

if(isset($_GET['agent_token']) && isset($_GET['agent_code']) && isset($_GET['username'])){
    $agent_token = mysqli_real_escape_string($call, $_GET['agent_token']);
    $agent_code = mysqli_real_escape_string($call, $_GET['agent_code']);
    $username = htmlspecialchars(mysqli_real_escape_string($call, $_GET['username']));
    $random_user = getName(8);
    $pass = getName(8);

    $cek_op = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_token = '$agent_token' AND agent_code = '$agent_code'");
    $cek_user = mysqli_query($call, "SELECT * FROM tb_user WHERE extUser = '$username' AND agent_code = '$agent_code'");

    if(empty($agent_token) || empty($agent_code) || empty($username)){
        $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
    } else if(mysqli_num_rows($cek_op) == 0){
        $res = array('status' => 'fail', 'msg' => 'Agent Tidak Ada');
    } else if(mysqli_num_rows($cek_user) == 1){
        $res = array('status' => 'fail', 'msg' => 'Username Sudah Ada');
    } else {
        $data_op = mysqli_fetch_array($cek_op);
        if($data_op['agent_status'] == "blocked"){
            $res = array('status' => 'fail', 'msg' => 'Agent Blocked');
        } else {
            $act = $GS->createUser($random_user);
            if($act['status'] == 1){
                if(mysqli_query($call, "INSERT INTO tb_user VALUES(NULL, '$random_user','$username','$pass','0','$agent_code','$date_cr','0')") == true){
                    $res = array('status' => 'success', 'username' => $username, 'msg' => 'Berhasil!');
                } else {
                    $res = array('status' => 'fail', 'msg' => 'Internal Error');
                }
            } else {
                $res = array('status' => 'fail', 'msg' => $act['msg']);
            }
        }
    }
} else {
    $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
}

print json_encode($res , JSON_PRETTY_PRINT);