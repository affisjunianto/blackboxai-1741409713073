<?php

date_default_timezone_set("Asia/Jakarta");

$date_cr = date("Y-m-d H:i:s");

$mt = 0;
if($mt == "1"){
    header('location: https://isoftgame.asia/mt.php');
}

$call = mysqli_connect('localhost','root','','reg');
if(!$call){
	die("Error : ".mysqli_connect_error());
}

function getName($n) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
 
    for ($i = 0; $i < $n; $i++) {
        $index = rand(0, strlen($characters) - 1);
        $randomString .= $characters[$index];
    }
 
    return $randomString;
}