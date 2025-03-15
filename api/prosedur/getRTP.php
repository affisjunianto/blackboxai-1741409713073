<?php
require 'koneksi.php';
$cek_userONA = mysqli_query($call, "SELECT * FROM tb_userON");
while($dataA = mysqli_fetch_array($cek_userONA)){
    
                            $call_list = $GS->callList($dataA['user_code'],$dataA['provider_code'],$dataA['game_code']);
                                if($call_list['status'] == 1){
        						    for($i=0; $i < count($call_list['calls'])-1; $i++){
        						      $dataRTP = $call_list['calls'][$i];
        						      $rtp = $dataRTP['rtp'];
        						      $call_type = $dataRTP['call_type'];
        						      $balance = ($dataRTP['rtp']/100)*$dataA['bet'];
        						      $user_code = $dataA['user_code'];
        						                                    
        						      $cek_rtp = mysqli_query($call, "SELECT * FROM tb_rtp WHERE user_code = '$user_code' AND rtp = '$rtp'");
        						      if(mysqli_num_rows($cek_rtp) == 1){
        						         //mysqli_query($call, "UPDATE tb_rtp SET rtp = '$rtp', call_type = '$call_type', balance = '$balance' WHERE user_code = '$user_code'");
        						      } else {
        						         mysqli_query($call, "INSERT INTO tb_rtp VALUES(NULL,'$rtp','$call_type','$balance','$user_code')");
        				  	      }
        			            }
                            }
                            
}
                            print json_encode($call_list);