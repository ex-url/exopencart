<?php

class Excrypto {
  private $registry;
  private $settings;
  private $api = 'https://api.nowpayments.io/v1/';

  public function __construct($registry) {
    $this->registry = $registry;
    $this->settings = $this->config->get('payment_excrypto_settings') ?: [];
  }

  public function __get($key) {
    return $this->registry->get($key);
  }

  public function getAPIStatus() {
    $curl = curl_init();

    curl_setopt_array($curl, [
      CURLOPT_URL => $this->api . 'status',
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 10,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'GET',
      CURLOPT_HTTPHEADER => [
        'Accept: application/json'
      ]
    ]);

    $response = curl_exec($curl);
    $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    $error = curl_error($curl);

    curl_close($curl);

    if ($error) {
      $this->log->write('NOWPayments get status error: ' . $error);
      throw new Exception('NOWPayments get status error: ' . $error);
    }

    if ($httpCode !== 200) {
      $this->log->write('NOWPayments HTTP status error: ' . $error);
      throw new Exception('NOWPayments API returned HTTP code: ' . $httpCode);
    }

    $decoded = json_decode($response, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
      $this->log->write('Invalid JSON response: ' . json_last_error_msg());
      throw new Exception('Invalid JSON response: ' . json_last_error_msg());
    }

    return $decoded;
  }

  /**
   * Get list of cryptocurrencies available in the merchant account
   * 
   * @return array List of cryptocurrency symbols (e.g. ['btc', 'eth', 'ltc'])
   * @throws Exception On request error or API unavailability
   */
  public function getMerchantCoins() {
    $curl = curl_init();

    curl_setopt_array($curl, [
      CURLOPT_URL => $this->api . 'merchant/coins',
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 10,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'GET',
      CURLOPT_HTTPHEADER => [
        'Accept: application/json',
        'x-api-key: ' . ($this->settings['api_key'] ?? '')
      ]
    ]);

    $response = curl_exec($curl);
    $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    $error = curl_error($curl);

    curl_close($curl);

    if ($error) {
      $this->log->write('NOWPayments get merchant coins error: ' . $error);
      throw new Exception('NOWPayments get merchant coins error: ' . $error);
    }

    if ($httpCode !== 200) {
      $this->log->write('NOWPayments HTTP status error: ' . $httpCode);
      throw new Exception('NOWPayments API returned HTTP code: ' . $httpCode);
    }

    $decoded = json_decode($response, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
      $this->log->write('Invalid JSON response: ' . json_last_error_msg());
      throw new Exception('Invalid JSON response: ' . json_last_error_msg());
    }

    return $decoded['selectedCurrencies'] ?? [];
  }

  /**
   * Create an invoice for payment
   * 
   * @param array $data Invoice data
   * @return array Response with 'invoice_url', 'payment_id' and other data
   * @throws Exception On API error
   */
  public function createInvoice($data) {
    // Prepare required parameters
    $payload = [
      'price_amount' => (float) $data['price_amount'],
      'price_currency' => $data['price_currency'],
      'order_id' => (string) $data['order_id'],      
      'order_description' => $data['order_description'] ?? '',
      'ipn_callback_url' => $data['ipn_callback_url'],
      'success_url' => $data['success_url'],
      'cancel_url' => $data['cancel_url'] ?? '',
    ];

    // Add optional parameters if set
    if (!empty($data['pay_currency'])) {
      $payload['pay_currency'] = $data['pay_currency'];
    }

    if ($data['is_fee_paid_by_user']) {
      $payload['is_fee_paid_by_user'] = true;
      $payload['is_fixed_rate'] = true;
    }

    $jsonPayload = json_encode($payload);

    $curl = curl_init();

    curl_setopt_array($curl, [
      CURLOPT_URL => $this->api . 'invoice',
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 10,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'POST',
      CURLOPT_POSTFIELDS => $jsonPayload,
      CURLOPT_HTTPHEADER => [
        'Content-Type: application/json',
        'Accept: application/json',
        'x-api-key: ' . ($this->settings['api_key'] ?? '')
      ]
    ]);

    $response = curl_exec($curl);
    $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    $error = curl_error($curl);

    curl_close($curl);

    if ($error) {
      $this->log->write('NOWPayments create invoice error: ' . $error);
      throw new Exception('NOWPayments API request error: ' . $error);
    }

    $decoded = json_decode($response, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
      $this->log->write('Invalid JSON response: ' . json_last_error_msg());
      throw new Exception('Invalid JSON response: ' . json_last_error_msg());
    }

    // Check for API error response
    if ($httpCode !== 200 && $httpCode !== 201) {
      $errorMessage = isset($decoded['message']) ? $decoded['message'] : 'Unknown error';
      $this->log->write('NOWPayments API error: ' . $httpCode . ' - ' . $errorMessage);
      throw new Exception($errorMessage);
    }

    return $decoded;
  }
}
