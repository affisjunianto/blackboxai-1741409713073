<?php
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);
require 'koneksi.php';
header('Content-Type: application/json');

if(isset($_GET['agent_token']) && isset($_GET['agent_code']) && isset($_GET['username']) && isset($_GET['game_code'])){
    $agent_token = mysqli_real_escape_string($call, $_GET['agent_token']);
    $agent_code = mysqli_real_escape_string($call, $_GET['agent_code']);
    $game_code = mysqli_real_escape_string($call, $_GET['game_code']);
    $username = mysqli_real_escape_string($call, $_GET['username']);
    
    $cek_op = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_token = '$agent_token' AND agent_code = '$agent_code'");
    $cek_user = mysqli_query($call, "SELECT * FROM tb_user WHERE extUser = '$username' AND agent_code = '$agent_code'");
    $cek_game = mysqli_query($call, "SELECT * FROM tb_game WHERE game_code = '$game_code'");
    
    if(empty($agent_token) || empty($agent_code) || empty($username || empty($game_code))){
        $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
    } else if(mysqli_num_rows($cek_op) == 0){
        $res = array('status' => 'fail', 'msg' => 'Agent Tidak Ada');
    } else if(mysqli_num_rows($cek_user) == 0){
        $res = array('status' => 'fail', 'msg' => 'Username Tidak Ada');
    } else if(mysqli_num_rows($cek_game) == 0){
        $res = array('status' => 'fail', 'msg' => 'Game Tidak Ada');
    } else {
        $data_game = mysqli_fetch_array($cek_game);
        $data_user = mysqli_fetch_array($cek_user);
        $data_op = mysqli_fetch_array($cek_op);
        
        if($data_game['game_status'] == 0){
            $res = array('status' => 'fail', 'msg' => 'Game Undermaintance');
        } else if($data_op['agent_status'] == "blocked"){
            $res = array('status' => 'fail', 'msg' => 'Agent Blocked');
        } else {
            $act = $GS->openGame($data_user['intUser'],$data_game['game_provider'],$game_code);
            
            $gamestart = date("Y-m-d H:i:s");
            $tc = md5($game_code.$data_user['intUser']);
            $cek_play = mysqli_query($call, "SELECT * FROM tb_play WHERE tc = '$tc'");
            if(mysqli_num_rows($cek_play) == 1){
                if($act['status'] == 1){
                    mysqli_query($call, "UPDATE tb_play SET provider = '".$data_game['game_provider']."', gamecode = '$game_code', gamestart = '$gamestart', url = '".$act['launch_url']."', title = '".$data_game['game_name']."' WHERE user = '".$data_user['intUser']."'");
                    $urls = "https://playgame.lvapi.asia/?tc=".$tc;
                    $res = array('status' => 'success', 'gameUrl' => $urls, 'msg' => 'SUCCESS');
                } else {
                    $res = array('status' => 'fail', 'msg' => $act['msg']);
                }
            } else {
                if($act['status'] == 1){
                    mysqli_query($call, "INSERT INTO tb_play VALUES(NULL, '$username','".$data_user['intUser']."','".$data_game['game_provider']."','$game_code','$tc','$gamestart','".$act['launch_url']."','".$data_game['game_name']."')");
                    $urls = "https://playgame.lvapi.asia/?tc=".$tc;
                    $res = array('status' => 'success', 'gameUrl' => $urls, 'msg' => 'SUCCESS');
                } else {
                    $res = array('status' => 'fail', 'msg' => $act['msg']);
                }
            }
        }
    }
} else {
    $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
}
print json_encode($res , JSON_PRETTY_PRINT);