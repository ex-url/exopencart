<?php
class ModelExtensionPaymentExcrypto extends Model {
	public function getMethod($address, $total) {
		$this->load->language('extension/payment/excrypto');
		$method_data = array(
			'code'       => 'excrypto',
			'title'      => $this->language->get('text_title'),
			'terms'      => $this->language->get('text_pay_with'),
			'sort_order' => $this->config->get('payment_excrypto_sort_order')
		);
		
		return $method_data;
	}
}
