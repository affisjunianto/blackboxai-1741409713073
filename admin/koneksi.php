<?php
session_start();
date_default_timezone_set("Asia/Jakarta");

$call = mysqli_connect('localhost','root','','reg');
if(!$call){
    die("Error: ".mysqli_connect_error());
}

ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);

function str_acak($n) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    
    for ($i = 0; $i < $n; $i++) {
        $index = rand(0, strlen($characters) - 1);
        $randomString .= $characters[$index];
    }
    
    return $randomString;
}
function hide_token(string $string, string $chars = '*', int $length = 6, int $init = 3): string {
    $getString  = $string;  // String yang akan disensor.
    $getChars   = $chars;   // Karakter yang akan digunakan.
    $getLength  = $length;  // Panjang karakter sensor.
    $getInit    = $init;    // Jumlah default karakter sensor.
    return substr_replace($getString, str_repeat($getChars, (strlen($getString) - $getLength)), $getInit, (strlen($getString) - $getLength));
}

require 'class.whatsapp.php';