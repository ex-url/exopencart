<?php
class ControllerExtensionPaymentExcrypto extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/excrypto');
		$this->load->model('setting/setting');
		$this->load->library('excrypto');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payment_excrypto', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['api_key'])) {
			$data['error_api_key'] = $this->error['api_key'];
		} else {
			$data['error_api_key'] = '';
		}
		
		if (isset($this->error['ipn_secret'])) {
			$data['error_ipn_secret'] = $this->error['ipn_secret'];
		} else {
			$data['error_ipn_secret'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/excrypto', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/excrypto', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true);

		if (isset($this->request->post['payment_excrypto_status'])) {
			$data['payment_excrypto_status'] = $this->request->post['payment_excrypto_status'];
		} else {
			$data['payment_excrypto_status'] = $this->config->get('payment_excrypto_status');
		}

		if (isset($this->request->post['payment_excrypto_sort_order'])) {
			$data['payment_excrypto_sort_order'] = $this->request->post['payment_excrypto_sort_order'];
		} else {
			$data['payment_excrypto_sort_order'] = $this->config->get('payment_excrypto_sort_order');
		}

		if (isset($this->request->post['payment_excrypto_settings'])) {
			$data['payment_excrypto_settings'] = $this->request->post['payment_excrypto_settings'];
		} else {
			$data['payment_excrypto_settings'] = $this->config->get('payment_excrypto_settings');
		}

		try {
			$data['coins'] = $this->excrypto->getMerchantCoins();
		} catch (\Throwable $th) {
			$data['coins'] = [];
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/excrypto', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/excrypto')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['payment_excrypto_settings']['api_key']) {
			$this->error['api_key'] = $this->language->get('error_apy_key');
		}
		
		if (!$this->request->post['payment_excrypto_settings']['ipn_secret']) {
			$this->error['ipn_secret'] = $this->language->get('error_ipn_secret');
		}

		return !$this->error;
	}
}