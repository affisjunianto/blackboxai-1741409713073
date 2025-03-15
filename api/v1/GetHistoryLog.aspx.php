<?php
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);
require 'koneksi.php';
header('Content-Type: application/json');

if(isset($_GET['agent_token']) && isset($_GET['agent_code']) && isset($_GET['username']) && isset($_GET['type'])){
    $agent_token = mysqli_real_escape_string($call, $_GET['agent_token']);
    $agent_code = mysqli_real_escape_string($call, $_GET['agent_code']);
    $type = mysqli_real_escape_string($call, $_GET['type']);
    $username = mysqli_real_escape_string($call, $_GET['username']);
    
    $cek_op = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_token = '$agent_token' AND agent_code = '$agent_code'");
    
    if(empty($agent_token) || empty($agent_code) || empty($type) || empty($username)){
        $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
    } else if(mysqli_num_rows($cek_op) == 0){
        $res = array('status' => 'fail', 'msg' => 'Agent Tidak Ada');
    } else {
        $data_op = mysqli_fetch_array($cek_op);
        if($data_op['agent_status'] == "blocked"){
            $res = array('status' => 'fail', 'msg' => 'Agent Blocked');
        } else {
            
            $cek_user = mysqli_query($call, "SELECT * FROM tb_user WHERE extUser = '$username' AND agent_code = '$agent_code'");
            if(mysqli_num_rows($cek_user) == 1){
            
                $data_user = mysqli_fetch_array($cek_user);
                
                $ac1 = $GS->getHistory($data_user['intUser'], $type, date("Y-m-d").' 00:00:00',date("Y-m-d H:i:s"));
                if($ac1['status'] == 1){
                    for($i=0; $i < count($ac1[$type])-1; $i++){
                        $v = $ac1[$type][$i];
                        
                        $data[] = array(
                            'username' => $username,
                            'bet_money' => $v['bet_money'],
                            'win_money' => $v['win_money'],
                            'provider_code' => $v['provider_code'],
                            'game_code' => $v['game_code'],
                            'type' => $v['type'],
                            'txn' => array(
                                'txn_id' => $v['txn_id'],
                                'txn_type' => $v['txn_type']),
                            'user_start_balance' => $v['user_start_balance'],
                            'user_end_balance' => $v['user_end_balance'],
                            'created_at' => $v['created_at'],);
                    }
                    $res = array('status' => 'success', 'game_log' => $data, 'msg' => 'Total Count '.$ac1['total_count']); 
                } else {
                    $res = array('status' => 'success', 'game_log' => "No Logger", 'msg' => 'SUCCESS');   
                }
            } else {
                $res = array('status' => 'fail', 'msg' => 'User atau AgentCode tidak cocok!');   
            }
        }
    }
} else {
    $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
}
print json_encode($res , JSON_PRETTY_PRINT);