<?php
$q = $_GET['q'];
if($q == "s"){
    echo 'Pembayaran Sukses';
} else if($q == "c"){
    echo "Pembayaran Gagal";
}