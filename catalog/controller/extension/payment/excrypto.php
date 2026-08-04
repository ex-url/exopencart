<?php
class ControllerExtensionPaymentExcrypto extends Controller {
	public function index() {
		$this->load->language('extension/payment/excrypto');
		$this->load->model('checkout/order');
		$this->load->library('excrypto');

		$data = [];
		$settings = $this->config->get('payment_excrypto_settings');

		try {
			$this->excrypto->getAPIStatus();

			$order_id = $this->session->data['order_id'];
			$order_info = $this->model_checkout_order->getOrder($order_id);

			if ($order_info) {
				$total = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
				$price_currency = strtolower($order_info['currency_code']);

				$payload = [
					'price_amount' => $total,
					'price_currency' => $price_currency,
					'order_id' => $order_id,
					'order_description' => 'Order #' . $order_id,
					'ipn_callback_url' => $this->url->link('extension/payment/excrypto/ipn', '', true),
					'success_url' => $this->url->link('extension/payment/excrypto/success', '', true),
					'cancel_url' => $this->url->link('extension/payment/excrypto/cancel', '', true),
					'pay_currency' => $settings['pay_currency'] ?: '',
					'is_fee_paid_by_user' => $settings['user_pay_fee'] ? true : false
				];

				$invoice = $this->excrypto->createInvoice($payload);

				if (isset($invoice['invoice_url'])) {
					$data['invoice_url'] = $invoice['invoice_url'];
				} else {
					$data['error'] = $this->language->get('error_unavailable');
				}
			}
		} catch (Exception $e) {
			$this->log->write('NOWPayments error: ' . $e->getMessage());
			$data['error'] = $this->language->get('error_unavailable');
		}

		return $this->load->view('extension/payment/excrypto', $data);
	}

	/**
	 * Handle IPN
	 * 
	 * This method receives POST requests from NOWPayments with payment status updates.
	 * It verifies the signature, validates the payload, and updates the order status
	 * based on the configured mapping.
	 */
	public function ipn() {

		$data = file_get_contents('php://input');
		$signature = isset($_SERVER['HTTP_X_NOWPAYMENTS_SIG']) ? $_SERVER['HTTP_X_NOWPAYMENTS_SIG'] : '';
		$settings = $this->config->get('payment_excrypto_settings');

		//$this->log->write('NOWPayments IPN received: ' . $data);

		try {
			$is_valid = $this->verifySignature($data, $signature, $settings['ipn_secret']);

			if (!$is_valid) {
				$this->log->write('NOWPayments IPN signature verification failed');
				http_response_code(401);
				echo 'Invalid signature';
				return;
			}
		} catch (Exception $e) {
			$this->log->write('NOWPayments IPN verification error: ' . $e->getMessage());
			http_response_code(500);
			echo 'Error verifying signature';
			return;
		}

		$payload = json_decode($data, true);

		if (json_last_error() !== JSON_ERROR_NONE) {
			$this->log->write('NOWPayments IPN invalid JSON: ' . json_last_error_msg());
			http_response_code(400);
			echo 'Invalid JSON';
			return;
		}

		if (!isset($payload['order_id']) || !isset($payload['payment_status'])) {
			$this->log->write('NOWPayments IPN missing required fields: ' . print_r($payload, true));
			http_response_code(400);
			echo 'Missing required fields';
			return;
		}

		$order_id = (int)$payload['order_id'];
		$payment_status = $payload['payment_status'];

		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($order_id);

		if (!$order_info) {
			$this->log->write('NOWPayments IPN order not found: ' . $order_id);
			http_response_code(404);
			echo 'Order not found';
			return;
		}

		$statuses = [			
			'waiting' => (int)$settings['waiting'],
			'sending' => (int)$settings['sending'], 
			'partially_paid' => (int)$settings['partially_paid'],
			'confirming' => (int)$settings['confirming'],
			'confirmed' => (int)$settings['confirmed'],
			'finished' => (int)$settings['finished'],
			'failed' => (int)$settings['failed'],
			'expired' => (int)$settings['expired'],
		];

		$order_status_id = isset($statuses[$payment_status]) ? $statuses[$payment_status] : 0;

		if ($order_status_id === 0) {
			$this->log->write('NOWPayments IPN unknown payment status: ' . $payment_status);
			http_response_code(200);
			echo 'OK - Status ignored';
			return;
		}

		if ($order_info['order_status_id'] == $order_status_id) {
			$this->log->write('NOWPayments IPN: Order ' . $order_id . ' already has status ' . $order_status_id);
			http_response_code(200);
			echo 'OK - Already processed';
			return;
		}

		try {
			$comment = 'NOWPayments payment status: ' . $payment_status;
			$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, $comment, true);
			$this->log->write('NOWPayments IPN: Order ' . $order_id . ' updated to status ' . $order_status_id);
			http_response_code(200);
			echo 'OK';
		} catch (Exception $e) {
			$this->log->write('NOWPayments IPN: Failed to update order status: ' . $e->getMessage());
			http_response_code(500);
			echo 'Error updating order';
		}
	}

	/**
	 * Verify IPN signature using HMAC-SHA512
	 * 
	 * @param string $payload Raw POST body
	 * @param string $signature Signature from x-nowpayments-sig header
	 * @param string $secret IPN secret key from settings
	 * @return bool True if signature is valid
	 */
	private function verifySignature($payload, $signature, $secret) {
		if (empty($signature) || empty($secret)) {
			$this->log->write('NOWPayments verifySignature: missing signature or secret');
			return false;
		}

		$computed = hash_hmac('sha512', $payload, $secret);

		return hash_equals($computed, $signature);
	}

	public function success() {
		$this->response->redirect($this->url->link('checkout/success'));
	}

	public function cancel() {
		$this->response->redirect('checkout/cart', '', true);
	}
}
