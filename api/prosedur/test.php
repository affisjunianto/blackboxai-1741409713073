<?php
class zulhayker
{
    public $urlRequest = '';
    public $agentCode = '';
    public $secret_key = '';
    public function Create($username)
    {   $username = strtolower($username);
        $signature = md5($this->agentCode . $username . $this->secret_key);
        $signature_uppercase = strtoupper($signature);
        $action = $this->urlRequest . "CreateMember.aspx?operatorcode=" . $this->agentCode . "&username=" . $username . "&signature=" . $this->$signature_uppercase;
        return $this->connect($action);
    }

    public function GameList($provider)
    {
        $action = $this->urlRequest . "GetGameList.aspx?operatorcode=" . $this->agentCode . "&provider_code=" . $provider . "&signature=" . $this->signature;
        return $this->connect($action);
    }

    public function OpenGame($username, $game_code)
    {
        $action = $this->urlRequest . "OpenGame.aspx?operatorcode=" . $this->agentCode . "&username=" . urlencode($username) . "&gameid=" . $game_code . "&signature=" . $this->signature;
        return $this->connect($action);
    }

    public function Transaksi($username, $amount, $type)
    {
        $action = $this->urlRequest . "MakeTransaction.ashx?operatorcode=" . $this->agentCode . "&username=" . urlencode($username) . "&amount=" . $amount . "&type=" . $type . "&signature=" . $this->signature;
        return $this->connect($action);
    }

    public function GetBalance($username)
    {
        $action = $this->urlRequest . "GetBalance.aspx?operatorcode=" . $this->agentCode . "&username=" . urlencode($username) . "&signature=" . $this->signature;
        return $this->connect($action);
    }

    public function InfoAgent()
    {
        $action = $this->urlRequest . "AgentInfo.ashx?operatorcode=" . $this->agentCode . "&signature=" . $this->signature;
        return $this->connect($action);
    }

    public function HistoryBet()
    {
        $action = $this->urlRequest . "GetHistoryArchive.aspx?operatorcode=" . $this->agentCode . "&signature=" . $this->signature;
        return $this->connect($action);
    }

    private function connect($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
        curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.47 Safari/537.36');
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_TCP_KEEPALIVE, 1);
        curl_setopt($ch, CURLOPT_TCP_KEEPIDLE, 2);
        curl_setopt($ch, CURLOPT_TCP_KEEPINTVL, 3);
        $output = curl_exec($ch);
        curl_close($ch);

        return $output;
    }
}

$ZH = new zulhayker();
