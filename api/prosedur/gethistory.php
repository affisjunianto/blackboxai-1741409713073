<?php
require 'koneksi.php';
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);

$cek_h = mysqli_query($call, "SELECT * FROM tb_user");
while($data_h = mysqli_fetch_array($cek_h)){
    $username = $data_h['intUser'];
    $ac1 = $GS->getHistory($username, 'slot', date("Y-m-d").' 00:00:00',date("Y-m-d H:i:s"));
    
    for($i=0; $i < count($ac1['slot'])-1; $i++){
        $v = $ac1['slot'][$i];
        
        $user_code = $v['user_code'];
        
        $cek_user = mysqli_query($call, "SELECT * FROM tb_user WHERE intUser = '$user_code'");
        $data_user = mysqli_fetch_array($cek_user);
        
        $extUser = $data_user['extUser'];
        $bet_money = $v['bet_money'];
        $win_money = $v['win_money'];
        $provider_code = $v['provider_code'];
        $game_code = $v['game_code'];
        $type = $v['type'];
        $txn_id = $v['txn_id'];
        $txn_type = $v['txn_type'];
        $user_start_balance = $v['user_start_balance'];
        $user_end_balance = $v['user_end_balance'];
        $created_at = $v['created_at'];
        $agent_code = $data_user['agent_code'];
        
        $cek = mysqli_query($call, "SELECT * FROM tb_history WHERE txn_id = '$txn_id' AND intUser = '$user_code'");
        if(mysqli_num_rows($cek) == 0){
            if(mysqli_query($call, "INSERT INTO tb_history VALUES(NULL, '$user_code','$extUser','$bet_money','$win_money','$provider_code','$game_code','$type','$txn_id','$txn_type','$user_start_balance','$user_end_balance','$created_at','$agent_code')") == true){
                echo 'Sukses Add History : '.$provider_code.'<br>';
            } else {
                echo 'Gagal <br>';
            }
        }
    }
}