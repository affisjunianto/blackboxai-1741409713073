<?php
require 'koneksi.php';

if(isset($_SESSION['admin'])){
    
class whitelabel
{
    public $agen = "";
    public $token = "";
    public $url = "https://api.nexusggr.com";
    //public $agen = "MEMEQU";
    //public $token = "c4a1c51c3fcfdfcde98f8bd2a4cd3b6d";

    public function createUser($username)
    {
        $action = array(
            'method' => 'user_create',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'user_code' => $username
        );
        return $this->wl_connect($this->url, $action);
    }

    public function getBalanceUser($username)
    {
        $action = array(
            'method' => 'money_info',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'user_code' => $username
        );
        return $this->wl_connect($this->url, $action);
    }

    public function getBalanceAllUser()
    {
        $action = array(
            'method' => 'money_info',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'all_users' => true
        );
        return $this->wl_connect($this->url, $action);
    }

    public function getBalanceAgent()
    {
        $action = array(
            'method' => 'money_info',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
        );
        return $this->wl_connect($this->url, $action);
    }

    public function transaksi($username, $type, $amount)
    {
        $action = array(
            'method' => $type,
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'user_code' => $username,
            'amount' => $amount + 0
        );
        return $this->wl_connect($this->url, $action);
    }

    public function gameList($provider)
    {
        $action = array(
            'method' => 'game_list',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'provider_code' => $provider
        );
        return $this->wl_connect($this->url, $action);
    }

    public function providerList()
    {
        $action = array(
            'method' => 'provider_list',
            'agent_code' => $this->agen,
            'agent_token' => $this->token
        );
        return $this->wl_connect($this->url, $action);
    }

    public function getHistory($username, $game_type, $start_date, $end_date)
    {
        $action = array(
            'method' => 'get_game_log',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'user_code' => $username,
            'game_type' => $game_type,
            "start" => $start_date,
            "end" => $end_date,
            "page" => 0,
            "perPage" => 1000
        );
        return $this->wl_connect($this->url, $action);
    }

    public function openGame($username, $provider, $game_code)
    {
        $action = array(
            'method' => 'game_launch',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'user_code' => $username,
            'provider_code' => $provider,
            'game_code' => $game_code,
            "lang" => "id"
        );
        return $this->wl_connect($this->url, $action);
    }

    public function resetBalance($username)
    {
        $action = array(
            'method' => 'user_withdraw_reset',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'user_code' => $username
        );
        return $this->wl_connect($this->url, $action);
    }

    public function callPlayers()
    {
        $action = array(
            'method' => 'call_players',
            'agent_code' => $this->agen,
            'agent_token' => $this->token
        );
        return $this->wl_connect($this->url, $action);
    }

    public function callList($provider, $gamecode, $usercode)
    {
        $action = array(
            'method' => 'call_list',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            "provider_code" => $provider,
            "game_code" => $gamecode,
            "user_code" => $usercode
        );
        return $this->wl_connect($this->url, $action);
    }

    public function callApply($username, $game_code, $provider, $call_rtp, $call_type)
    {
        $action = array(
            'method' => 'call_apply',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'provider_code' => $provider,
            'game_code' => $game_code,
            'user_code' => $username,
            'call_rtp' => intval($call_rtp),
            'call_type' => $call_type
        );
        return $this->wl_connect($this->url, $action);
    }

    public function getCallHistory()
    {
        $action = array(
            'method' => 'call_history',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'offset' => 0,
            'limit' => 100
        );
        return $this->wl_connect($this->url, $action);
    }

    public function callCancel($call_id)
    {
        $action = array(
            'method' => 'call_cancel',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'call_id' => $call_id
        );
        return $this->wl_connect($this->url, $action);
    }

    public function controlUserRtp($username, $provider, $rtp)
    {
        $action = array(
            'method' => 'control_rtp',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'provider_code' => $provider,
            'user_code' => $username,
            'rtp' => $rtp
        );
        return $this->wl_connect($this->url, $action);
    }

    private function wl_connect($url, $data)
    {
        $ch = curl_init($url);
        $jsonData = json_encode($data);

        curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_ENCODING, "");
        curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
        curl_setopt($ch, CURLOPT_TIMEOUT, 0);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json', "Cache-Control: no-cache"));

        $res = curl_exec($ch);
        curl_close($ch);

        return json_decode($res, true);
    }
}

$GS = new whitelabel();
    
$cek_admin = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_code = '".$_SESSION['admin']['agent_code']."'");
$data_admin = mysqli_fetch_array($cek_admin);
$operator = $data_admin['agent_code'];

// DATA MEMBER //
if($data_admin['agent_level'] == "admin"){
    $cek_member = mysqli_query($call, "SELECT * FROM tb_user ORDER BY id DESC");
} else {
    $cek_member = mysqli_query($call, "SELECT * FROM tb_user WHERE agent_code = '$operator' ORDER BY id DESC");
}
$jumlah_member = mysqli_num_rows($cek_member);

$jumlah_balance = mysqli_query($call, "SELECT SUM(balance) AS total_balance FROM tb_user WHERE agent_code = '$operator'");
$jumlah_saldo = mysqli_fetch_array($jumlah_balance)['total_balance'];

// DATA DEPOSIT WD //
if($data_admin['agent_level'] == "admin"){
    $cek_betting = mysqli_query($call, "SELECT * FROM tb_history ORDER BY id DESC");
} else {
    $cek_betting = mysqli_query($call, "SELECT * FROM tb_history WHERE agent_code = '$operator' ORDER BY id DESC");
}
$jumlah_betting = mysqli_num_rows($cek_betting);

// HASIL TRANSAKSI
$c_hasil = mysqli_query($call, "SELECT SUM(amount) AS hasil FROM tb_transfer WHERE from_agent = 'parent_admin' AND action = 'deposit'");
$hasil = mysqli_fetch_array($c_hasil)['hasil'];

// JUMLAH AGENT
$cek_j_agent = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_upline = '$operator'");
$jumlah_agent = mysqli_num_rows($cek_j_agent);

// DATA GAME //
$cek_game = mysqli_query($call, "SELECT * FROM tb_game");
$jumlah_game = mysqli_num_rows($cek_game);

$gscc = $GS->getBalanceAgent();
if($gscc['status'] == 1){
    $gsc = number_format($gscc['agent']['balance']);
} else {
    $gsc = $gscc['msg'];
}
} else {
	header('location: login');
}