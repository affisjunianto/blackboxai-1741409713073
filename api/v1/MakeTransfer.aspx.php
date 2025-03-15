<?php
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);
require 'koneksi.php';
header('Content-Type: application/json');

if(isset($_GET['agent_token']) && isset($_GET['agent_code']) && isset($_GET['username']) && isset($_GET['amount']) && isset($_GET['type'])){
    $agent_token = mysqli_real_escape_string($call, $_GET['agent_token']);
    $agent_code = mysqli_real_escape_string($call, $_GET['agent_code']);
    $amount = mysqli_real_escape_string($call, $_GET['amount']);
    $username = mysqli_real_escape_string($call, $_GET['username']);
    $type = mysqli_real_escape_string($call, $_GET['type']);
    
    $cek_op = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_token = '$agent_token' AND agent_code = '$agent_code'");
    $cek_user = mysqli_query($call, "SELECT * FROM tb_user WHERE extUser = '$username' AND agent_code = '$agent_code'");
    
    if(empty($agent_token) || empty($agent_code) || empty($username) || empty($amount) || empty($type)){
        $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
    } else if(mysqli_num_rows($cek_op) == 0){
        $res = array('status' => 'fail', 'msg' => 'Agent Tidak Ada');
    } else if(mysqli_num_rows($cek_user) == 0){
        $res = array('status' => 'fail', 'msg' => 'Username Tidak Ada');
    } else {
        $data_user = mysqli_fetch_array($cek_user);
        $data_op = mysqli_fetch_array($cek_op);
        
        if($amount[0] == "-" || $amount[0] == "+"){
            $res = array('status' => 'fail', 'msg' => 'Amount Not Support');
        } else if($data_op['agent_status'] == "blocked"){
            $res = array('status' => 'fail', 'msg' => 'Agent Blocked');
        } else {
            if($type == "deposit"){
                if($data_op['agent_balance'] < $amount){
                    $res = array('status' => 'fail', 'msg' => 'Inffucients Agent Balance');
                } else {
                    //$mainWD = $GS->transaksi('softgaming','user_withdraw',$amount);
                    //if($mainWD['status'] == 1){
                        $userDP = $GS->transaksi($data_user['intUser'],'user_deposit',$amount);
                        if($userDP['status'] == 1){
                            $trxid = md5(date("Y-m-d H:i:s").$username.$amount);
                            $before_b_a = $data_op['agent_balance'];
                            $after_b_a = $before_b_a - $amount;
                            $date_crB = date("Y-m-d H:i:s");
                            if(mysqli_query($call, "INSERT INTO tb_transaction VALUES(NULL, '$trxid','".$data_user['intUser']."','$username','deposit','$amount','$before_b_a','$after_b_a','$agent_code','$date_crB')") == true){
                                mysqli_query($call, "UPDATE tb_agent SET agent_balance = '$after_b_a' WHERE agent_code = '$agent_code'");
                                mysqli_query($call, "UPDATE tb_user SET balance = balance+'$amount' WHERE extUser = '$username' AND agent_code = '$agent_code'");
                                $res = array('status' => 'success', 'data' => array('agent_code' => $agent_code,'action' => 'DEPOSIT','amount' => $amount,'before_nalance' => $before_b_a, 'after_balance' => $after_b_a), 'msg' => 'SUCCESS');
                            } else {
                                $res = array('status' => 'fail', 'msg' => 'Internal Error');
                            }
                        } else {
                            $res = array('status' => 'fail', 'msg' => $userDP['msg']);
                        }
                    //} else {
                    //    $res = array('status' => 'fail', 'msg' => 'Main Account'.' '.$mainWD['msg']);
                    //}
                }
            } else if($type == "withdraw"){
                $userWD = $GS->transaksi($data_user['intUser'],'user_withdraw',$amount);
                if($userWD['status'] == 1){
                    //$mainDP = $GS->transaksi('softgaming','user_deposit',$amount);
                    //if($mainDP['status'] == 1){
                        $trxid = md5(date("Y-m-d H:i:s").$username.$amount);
                        $before_b_a = $data_op['agent_balance'];
                        $after_b_a = $before_b_a + $amount;
                        $date_crB = date("Y-m-d H:i:s");
                        if(mysqli_query($call, "INSERT INTO tb_transaction VALUES(NULL, '$trxid','".$data_user['intUser']."','$username','withdraw','$amount','$before_b_a','$after_b_a','$agent_code','$date_crB')") == true){
                            mysqli_query($call, "UPDATE tb_agent SET agent_balance = '$after_b_a' WHERE agent_code = '$agent_code'");
                            mysqli_query($call, "UPDATE tb_user SET balance = balance-'$amount' WHERE extUser = '$username' AND agent_code = '$agent_code'");
                            $res = array('status' => 'success', 'data' => array('agent_code' => $agent_code,'action' => 'WITHDRAW','amount' => $amount,'before_nalance' => $before_b_a, 'after_balance' => $after_b_a), 'msg' => 'SUCCESS');
                        } else {
                            $res = array('status' => 'fail', 'msg' => 'Internal Error');
                        }
                    //} else {
                    //    $res = array('status' => 'fail', 'msg' => 'Main Account'.' '.$userWD['msg']);
                    //}
                } else {
                    $res = array('status' => 'fail', 'msg' => $userWD['msg']);
                }
            }
        }
    }
} else {
    $res = array('status' => 'fail', 'msg' => 'Invalid Parameter');
}
print json_encode($res , JSON_PRETTY_PRINT);