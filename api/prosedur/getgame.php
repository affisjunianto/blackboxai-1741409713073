<?php
require 'koneksi.php';
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);

$cek = mysqli_query($call, "SELECT * FROM tb_provider");
while($data_p = mysqli_fetch_array($cek)){
    $provider = $data_p['provider_code'];
    $type = $data_p['provider_type'];
    
    
    $ac1 = $GS->gameList($provider);
    for($i=0; $i < count($ac1['games'])-1; $i++){
        $v = $ac1['games'][$i];
        
        $game_code = $v['game_code'];
        $game_name = str_replace("'","",$v['game_name']);
        $game_provider = $provider;
        $game_type = $type;
        $game_status = $v['status'];
        $game_image = $v['banner'];
        
        $cek_game = mysqli_query($call, "SELECT * FROM tb_game WHERE game_code = '$game_code'");
        if(mysqli_num_rows($cek_game) == 1){
            if(mysqli_query($call, "UPDATE tb_game SET game_provider = '$game_provider', game_type = '$game_type', game_status = '$game_status', game_image = '$game_image' WHERE game_code = '$game_code'") == true){
                echo 'Sukses Update Status Game : '.$game_name.'<br>';
            }
        } else {
            if(mysqli_query($call, "INSERT INTO tb_game VALUES(NULL, '$game_code','$game_name','$game_provider','$game_type','$game_image','$game_status')") == true){
                echo 'Sukses Add : '.$game_name.'<br>';
            } else {
                echo 'Gagal <br>';
            }
        }
    }
}