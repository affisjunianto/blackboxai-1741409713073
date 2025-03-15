<?php
require 'koneksi.php';
if(isset($_SESSION['admin'])){
    header('location: index?halaman=Dashboard');
} else {

if(isset($_POST['masuk'])){
            $userid = htmlspecialchars(mysqli_real_escape_string($call, $_POST['userid']));
            $password = htmlspecialchars(mysqli_real_escape_string($call, $_POST['password']));
            $passwordr = htmlspecialchars(mysqli_real_escape_string($call, $_POST['passwordr']));
            
            $pw = md5($password);

            $cek_config_akun = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_name = '$userid'");
            
            if(strlen($userid) < 5){
                echo '<script>alert("Agent Name Min 5 Karaker!")</script>';
            } else if(strlen($userid) > 8){
                echo '<script>alert("Agent Name Max 8 Karaker!")</script>';
            } elseif(empty($userid) || empty($password) || empty($passwordr)){
                echo '<script>alert("Input harus di isi!")</script>';
            } else if($password <> $passwordr){
                echo '<script>alert("Confirm Password Salah!")</script>';
            } else if(mysqli_num_rows($cek_config_akun) == 0){
                $agent_code = str_acak(8);
                $agent_token = md5(str_acak(10));
                $agent_pw = $pw;
                $agent_upline = "sistem";
                $agent_cr = date("Y-m-d H:i:s");
                $agent_balance = 0;
                $agent_level = "agent";
                $aget_status = "active";
                
                if(mysqli_query($call, "INSERT INTO tb_agent VALUES(NULL, '$agent_code','$userid','$agent_token','$agent_pw','$agent_upline','$agent_cr','$agent_balance','$agent_level','$aget_status')") == true){
                    $cek_agents = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_code = '$agent_code'");
                    $data_config = mysqli_fetch_array($cek_agents);
                    $_SESSION['admin'] = $data_config;
                    header('location: index?halaman=Dashboard');
                    exit();
                } else {
                    echo '<script>alert("Kesalahan Server!")</script>';
                }
                
            } else {
                echo '<script>alert("Akun sudah ada!")</script>';
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
                        <label>Agent Name</label>
                        <input type="text" name="userid" class="form-control" placeholder="Agent Name"/>
                    </div>
                    <div class="form-group">
                        <label>Input Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Input Password"/>
                    </div>
                    <div class="form-group">
                        <label>Reinput Password</label>
                        <input type="password" name="passwordr" class="form-control" placeholder="Reinput Password"/>
                    </div>
                </div>
                <div class="footer">                                                               
                    <button type="submit" name="masuk" class="btn bg-olive btn-block">Daftar</button>
                    <a href="login" class="btn bg-olive btn-block">Login</a>
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