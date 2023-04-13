<?php
class Controller3rdPartyExtension extends Controller
{
    public function index()
    {
        $curl = curl_init();

        curl_setopt($curl, CURLOPT_URL, 'https://ocstore.com/index.php?route=extension/json/extensions&version=' . urlencode(VERSION));
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);

        $output = curl_exec($curl);

        if (curl_getinfo($curl, CURLINFO_HTTP_CODE) == 200) {
            $response = $output;
        } else {
            $response = '';
        }

        curl_close($curl);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput($response);
    }
}