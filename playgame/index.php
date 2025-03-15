<?php

require 'koneksi.php';

if(isset($_GET['tc'])){
    $tc = mysqli_real_escape_string($call, $_GET['tc']);
    
    $cek_game = mysqli_query($call, "SELECT * FROM tb_play WHERE tc = '$tc'");
    if(mysqli_num_rows($cek_game) == 1){
        $data_game = mysqli_fetch_assoc($cek_game);
        $title = $data_game['title'];
        $url = '<iframe id="frame" src="'. $data_game['url'] .'" allowfullscreen></iframe>';
        mysqli_query($call, "DELETE FROM tb_play WHERE tc = '$tc'");
    } else {
        $title = 'NOT SESSION';
        $url = '<script>alert("NOT SESSION LOGGED")</script>';
    }
} else {
    $title = 'NOT SESSION';
    $url = '<script>alert("NOT SESSION LOGGED")</script>';
}
?>

<html>
<head>
    <title><?= $title ?></title>
<style type="text/css">
html,body, iframe{
      left: 0px;
      top: 0px;
      position: relative;
      display: flex;
      align-items: center;
	  background-color: black;
      margin: 0px;
      padding: 0px;
      width: 100%;
      height: 100%;
      border: 0px;
}
</style>
<script>function closeGame(){
window.location.href='<?php echo 'https://pp303.xyz/'; ?>'; }
window.gclose=closeGame;
window.close=closeGame;
window.onmessage=function(event){
if (event.data=='closeGame' || event.data=='close' || event.data.indexOf("GAME_MODE:LOBBY")>=0) {
closeGame(); } }</script>
</head>
<body>
<?= $url ?>
</body>
</html>