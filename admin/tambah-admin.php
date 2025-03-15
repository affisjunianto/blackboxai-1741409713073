<?php
require 'koneksi.php';
session_start();

if(!isset($_SESSION['admin'])){
    header('location: login');
} else {
    // Cek apakah user adalah admin
    $admin_code = $_SESSION['admin']['agent_code'];
    $cek_level = mysqli_query($call, "SELECT agent_level FROM tb_agent WHERE agent_code = '$admin_code'");
    $data_level = mysqli_fetch_array($cek_level);
    
    if($data_level['agent_level'] != 'admin') {
        echo "<script>alert('Hanya Admin yang dapat mengakses halaman ini!');window.location='index.php';</script>";
    }
}

if(isset($_POST['submit'])) {
    $agent_code = $_POST['agent_code'];
    $agent_name = $_POST['agent_name'];
    $agent_password = md5($_POST['password']);
    $created = date('Y-m-d H:i:s');
    
    // Cek apakah agent_code sudah ada
    $cek_code = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_code = '$agent_code'");
    if(mysqli_num_rows($cek_code) > 0) {
        echo "<script>alert('Agent Code sudah digunakan!');</script>";
    } else {
        $query = mysqli_query($call, "INSERT INTO tb_agent (agent_code, agent_name, agent_password, agent_level, agent_status, agent_created) 
                                     VALUES ('$agent_code', '$agent_name', '$agent_password', 'admin', 'active', '$created')");
        if($query) {
            echo "<script>alert('Admin berhasil ditambahkan!');window.location='index.php';</script>";
        } else {
            echo "<script>alert('Gagal menambahkan admin!');</script>";
        }
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Tambah Admin | Admin Panel</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <?php include 'components/header.php'; ?>
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <?php include 'components/sidebar.php'; ?>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Tambah Admin
                    </h1>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Form Tambah Admin</h3>
                                </div>
                                <form role="form" method="POST">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Agent Code</label>
                                            <input type="text" name="agent_code" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Nama</label>
                                            <input type="text" name="agent_name" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="password" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" name="submit" class="btn btn-primary">Tambah Admin</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </aside>
        </div>

        <!-- jQuery 2.0.2 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
    </body>
</html>
<?php } ?>