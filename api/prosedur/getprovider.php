<?php
require 'koneksi.php';
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);
$ac1 = $GS->providerList();

for($i=0; $i < count($ac1['providers']); $i++){
    $v = $ac1['providers'][$i];
    
    $game_code = $v['code'];
    $game_name = $v['name'];
    $game_type = $v['type'];
    $game_status = $v['status'];
    $game_image = "";
    
    $cek_game = mysqli_query($call, "SELECT * FROM tb_provider WHERE provider_code = '$game_code'");
    if(mysqli_num_rows($cek_game) == 1){
        if(mysqli_query($call, "UPDATE tb_provider SET provider_status = '$game_status', provider_image = '$game_image' WHERE provider_code = '$game_code'") == true){
            echo 'Sukses Update Status Provider Game : '.$game_name.'<br>';
        }
    } else {
        $isert = mysqli_query($call, "INSERT INTO tb_provider VALUES(NULL, '$game_code','$game_name','$game_type','$game_image','$game_status')");
        if($isert == true){
            echo 'Sukses Add Provider : '.$game_name.'<br>';
        } else {
            echo 'Gagal Insert '.$game_code.' | '.$call->error.'<br>';
        }
    }
}