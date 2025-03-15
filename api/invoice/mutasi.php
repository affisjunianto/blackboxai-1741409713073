<?php
date_default_timezone_set("Asia/Jakarta");

$call = mysqli_connect('localhost','root','','reg');
if(!$call){
    die("Error: ".mysqli_connect_error());
}

$POST = file_get_contents("php://input");
$data = json_decode($POST, true);

$file = fopen("PGdata.json","w");
fwrite($file, $POST);
fclose($file);

$trxid = $data['trxid'];
$status = $data['status'];

if($status == 'Success'){
    $cek_trx = mysqli_query($call, "SELECT * FROM tb_balance WHERE trxid = '$trxid'");
    if(mysqli_num_rows($cek_trx) == 1){
        $data_trx = mysqli_fetch_array($cek_trx);
        $agent = $data_trx['agent_code'];
        $jumlah = $data_trx['balance'];
        
        mysqli_query($call, "UPDATE tb_balance SET status = 'Success' WHERE trxid = '$trxid'");
        mysqli_query($call, "UPDATE tb_agent SET balance = balance+'$jumlah' WHERE agent_code = '$agent'");
        $result = array('success' => true);
    }
} else if($status == 'Canceled'){
    $cek_trx = mysqli_query($call, "SELECT * FROM tb_balance WHERE trxid = '$trxid'");
    if(mysqli_num_rows($cek_trx) == 1){
        mysqli_query($call, "UPDATE tb_balance SET status = 'Cancel' WHERE trxid = '$trxid'");
        $result = array('success' => true);
    }
} else {
    $result = array('success' => false);
}

header('Content-type: application/json');
echo json_encode($result);