<?php
require 'koneksi.php';
session_start();
if(isset($_SESSION['admin'])){
    header('location: index?halaman=Dashboard');
} else {

if(isset($_POST['masuk'])){
            $userid = $_POST['userid'];
            $password = md5($_POST['password']);

            $cek_config_akun = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_code = '$userid'");
            $data_config_akun = mysqli_fetch_array($cek_config_akun);
            
            if($data_config_akun['agent_status'] == "blocked"){
                echo '<script>alert("Agent Blocked!")</script>';
            } else if(empty($userid) || empty($password)){
                echo '<script>alert("Input harus di isi!")</script>';
            } else if($password <> $data_config_akun['agent_password']){
                echo '<script>alert("Password salah!")</script>';
            } else if(mysqli_num_rows($cek_config_akun) == 0){
                echo '<script>alert("Akun tidak ada!")</script>';
            } else {
                $_SESSION['admin'] = $data_config_akun;
                header('location: index?halaman=Dashboard');
                exit();
            }
        }
?>
<!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>Softgaming PoweredBy SOFTGAMING</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">
        <?php
        
        ?>
        <div class="form-box" id="login-box">
            <div class="header">Sign In</div>
            <form method="post">
                <div class="body bg-gray">
                    <div class="form-group">
                        <label>Agent Code</label>
                        <input type="text" name="userid" class="form-control" placeholder="Agent Code"/>
                    </div>
                    <div class="form-group">
                        <label>Input Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Agent Password"/>
                    </div>          
                </div>
                <div class="footer">                                                               
                    <button type="submit" name="masuk" class="btn bg-olive btn-block">Login</button>
                    <a href="register" class="btn bg-olive btn-block">Daftar</a>
                </div>
            </form>
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>
<?php } ?>