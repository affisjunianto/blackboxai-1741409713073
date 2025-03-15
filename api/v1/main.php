<?php
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

    public function callList($username,$provider,$game)
    {
        $action = array(
            'method' => 'call_list',
            'agent_code' => $this->agen,
            'agent_token' => $this->token,
            'provider_code' => $provider,
            'game_code' => $game,
            'user_code' => $username
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
            'call_rtp' => $call_rtp,
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
        $ch = curl_init();
        $jsonData = json_encode($data);

        //curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
        curl_setopt($ch, CURLOPT_URL, 'https://api.nexusggr.com');
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        //curl_setopt($ch, CURLOPT_ENCODING, "");
        //curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
        //curl_setopt($ch, CURLOPT_TIMEOUT, 0);
        //curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        //curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        //curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
        curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);

        $res = curl_exec($ch);
        curl_close($ch);

        return json_decode($res, true);
    }
}
