<?php
ini_set('display_errors', 1);//Atau
error_reporting(E_ALL && ~E_NOTICE);
require 'koneksi.php';
header('Content-Type: application/json');

$res = array('status' => 'success', 'msg' => 'API ON');
print json_encode($res , JSON_PRETTY_PRINT);