<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCheckoutShippingAddress extends Controller {
	public function index() {
		$this->load->language('checkout/checkout');

		// get default pickup points from localisation/location
		$data['locations'] = array();

		if(isset($this->session->data['shipping_method']['code']) && strpos($this->session->data['shipping_method']['code'], '.pickup')) {

			$this->load->model('localisation/location');

			foreach((array)$this->config->get('config_location') as $location_id) {
				$location_info = $this->model_localisation_location->getLocation($location_id);

				if ($location_info) {
					if ($location_info['image']) {
						$image = $this->model_tool_image->resize($location_info['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_location_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_location_height'));
					} else {
						$image = false;
					}

					$data['locations'][] = array(
						'location_id' => $location_info['location_id'],
						'name'        => $location_info['name'],
						'address'     => nl2br($location_info['address']),
						'geocode'     => $location_info['geocode'],
						'telephone'   => $location_info['telephone'],
						'fax'         => $location_info['fax'],
						'image'       => $image,
						'open'        => nl2br($location_info['open']),
						'comment'     => $location_info['comment']
					);

				}
			}
		}

		if (isset($this->session->data['shipping_address']) && !$this->customer->isLogged()) {
			$data['address_id'] = $this->session->data['shipping_address']['address_id'];
		} else {
			$data['address_id'] = $this->customer->getAddressId();
		}

		$this->load->model('account/address');

		$data['addresses'] = $this->model_account_address->getAddresses();

		if (isset($this->session->data['shipping_address']['postcode'])) {
			$data['postcode'] = $this->session->data['shipping_address']['postcode'];
		} else {
			$data['postcode'] = '';
		}

		if (isset($this->session->data['shipping_address']['city'])) {
			$data['city'] = $this->session->data['shipping_address']['city'];
		} else {
			$data['city'] = '';
		}
		if (isset($this->session->data['shipping_address']['address_1'])) {
			$data['address_1'] = ''; //$this->session->data['shipping_address']['address_1'];
		} else {
			$data['address_1'] = '';
		}
		if (isset($this->session->data['shipping_address']['address_2'])) {
			$data['address_2'] = ''; //$this->session->data['shipping_address']['address_2'];
		} else {
			$data['address_2'] = '';
		}
		if (isset($this->session->data['shipping_address']['company'])) {
			$data['company'] = $this->session->data['shipping_address']['company'];
		} else {
			$data['company'] = '';
		}

		if (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($data['country_id']);

		$data['postcode_required'] = $country_info['postcode_required'];

		if (isset($this->session->data['shipping_address']['zone_id'])) {
			$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
		} else {
			$data['zone_id'] = $this->config->get('config_zone_id');
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		// Custom Fields
		$data['custom_fields'] = array();

		$this->load->model('account/custom_field');

		$custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

		foreach ($custom_fields as $custom_field) {
			if ($custom_field['location'] == 'address') {
				$data['custom_fields'][] = $custom_field;
			}
		}

		if (isset($this->session->data['shipping_address']['custom_field'])) {
			$data['shipping_address_custom_field'] = $this->session->data['shipping_address']['custom_field'];
		} else {
			$data['shipping_address_custom_field'] = array();
		}

		$this->response->setOutput($this->load->view('checkout/shipping_address', $data));
	}

	public function save() {
		$this->load->language('checkout/checkout');

		$json = array();

		// user choose pickup method
		if(isset($this->request->post['pickup_point'])) {
			$this->load->model('localisation/location');

			if((int)$this->request->post['pickup_point'] > 0) {
				$location = $this->model_localisation_location->getLocation((int)$this->request->post['pickup_point']);

				$this->session->data['shipping_address']['zone'] = '';
				$this->session->data['shipping_address']['address_1'] = $location['name'];
				$this->session->data['shipping_address']['address_2'] = $location['address'];

				$this->session->data['payment_address'] = $this->session->data['shipping_address'];

				$json['done'] = true;
			} else {
				$json['error']['pickup_point'] = $this->language->get('error_pickup_point');
			}

		} else {
			// user choose delivery method

			// Validate cart has products and has stock.
			if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
				$json['redirect'] = $this->url->link('checkout/cart');
			}

			// Validate minimum quantity requirements.
			$products = $this->cart->getProducts();

			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$json['redirect3'] = $this->url->link('checkout/cart');

					break;
				}
			}

			if($this->customer->isLogged()) {

				$this->load->model('account/address');

				if (isset($this->request->post['shipping_address']) && $this->request->post['shipping_address'] == 'existing') {
					if (empty($this->request->post['address_id'])) {
						$json['error']['warning'] = $this->language->get('error_address');
					} elseif (!in_array($this->request->post['address_id'], array_keys($this->model_account_address->getAddresses()))) {
						$json['error']['warning'] = $this->language->get('error_address');
					}

					if (!$json) {
						$this->session->data['shipping_address'] = $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->request->post['address_id']);
						$json['done'] = true;
					}

				} else {

					if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
						$json['error']['address_1'] = $this->language->get('error_address_1');
					} else {
						$this->session->data['shipping_address']['address_1'] = trim($this->request->post['address_1']);
					}

					if ((utf8_strlen(trim($this->request->post['address_2'])) < 1) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
						$json['error']['address_2'] = $this->language->get('error_address_2');
					} else {
						$this->session->data['shipping_address']['address_2'] = trim($this->request->post['address_2']);
					}

					if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
						$json['error']['city'] = $this->language->get('error_city');
					} else {
						$this->session->data['shipping_address']['city'] = trim($this->request->post['city']);
					}

					$this->load->model('localisation/country');
					$this->load->model('localisation/zone');

					$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

					if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
						$json['error']['postcode'] = $this->language->get('error_postcode');
					} else {
						$this->session->data['shipping_address']['postcode'] = trim($this->request->post['postcode']);
					}

					if ($this->request->post['country_id'] == '') {
						$json['error']['country'] = $this->language->get('error_country');
					} else {
						$this->session->data['shipping_address']['country_id'] = trim($this->request->post['country_id']);
					}

					if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
						$json['error']['zone_id'] = $this->language->get('error_zone');
					} else {
						$this->session->data['shipping_address']['zone_id'] = trim($this->request->post['zone_id']);
						$zone = $this->model_localisation_zone->getZone($this->request->post['zone_id']);
						$this->session->data['shipping_address']['zone'] = $zone['name'];
					}

					if (isset($this->request->post['company']) && $this->request->post['company'] != '') {
						$this->session->data['shipping_address']['company'] = trim($this->request->post['company']);
					}
					if (isset($this->request->post['company']) && $this->request->post['company'] != '') {
						$this->session->data['shipping_address']['company'] = trim($this->request->post['company']);
					}

					// Custom field validation
					$this->load->model('account/custom_field');

					$custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

					foreach ($custom_fields as $custom_field) {
						if ($custom_field['location'] == 'address') {
							if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
								$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
							} elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
								$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
							}
						}
					}

					// Custom field validation
					$this->load->model('account/custom_field');

					$custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

					foreach ($custom_fields as $custom_field) {
						if ($custom_field['location'] == 'address') {
							if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
								$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
							} elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
								$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
							}
						}
					}

					if (!$json) {
						$this->request->post['firstname'] = $this->customer->getFirstName();
						$this->request->post['lastname'] = $this->customer->getLastName();

						$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
						$zone = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

						$addresses = $this->model_account_address->getAddresses();

						if($addresses) {
							$existed = [];

							foreach ($addresses as $address) {
								$existed[] = $address['country'] . $address['zone'] . $address['city'] . $address['address_1'] . $address['address_2'];
								$new = $country_info['name'] . $zone['name'] . $this->request->post['city'] . $this->request->post['address_1'] . $this->request->post['address_2'];

								if(!in_array($new, $existed)) {
									$address_id = $this->model_account_address->addAddress($this->customer->getId(), $this->request->post);

									$json['added'] = true;

									$this->session->data['shipping_address'] = $this->session->data['payment_address'] = $this->model_account_address->getAddress($address_id);

									// If no default address ID set we use the last address
									if (!$this->customer->getAddressId()) {
										$this->load->model('account/customer');

										$this->model_account_customer->editAddressId($this->customer->getId(), $address_id);
									}
								}
	 						}
						} else {
							$address_id = $this->model_account_address->addAddress($this->customer->getId(), $this->request->post);

							$json['added'] = true;

							$this->session->data['shipping_address'] = $this->session->data['payment_address'] = $this->model_account_address->getAddress($address_id);

							// If no default address ID set we use the last address
							if (!$this->customer->getAddressId()) {
								$this->load->model('account/customer');

								$this->model_account_customer->editAddressId($this->customer->getId(), $address_id);
							}
						}

						$json['done'] = true;
					}
				}

			} else {
				// customer is not logged
				if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
					$json['error']['address_1'] = $this->language->get('error_address_1');
				} else {
					$this->session->data['shipping_address']['address_1'] = trim($this->request->post['address_1']);
				}

				if ((utf8_strlen(trim($this->request->post['address_2'])) < 1) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
					$json['error']['address_2'] = $this->language->get('error_address_2');
				} else {
					$this->session->data['shipping_address']['address_2'] = trim($this->request->post['address_2']);
				}

				if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
					$json['error']['city'] = $this->language->get('error_city');
				} else {
					$this->session->data['shipping_address']['city'] = trim($this->request->post['city']);
				}

				$this->load->model('localisation/country');
				$this->load->model('localisation/zone');

				$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

				if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
					$json['error']['postcode'] = $this->language->get('error_postcode');
				} else {
					$this->session->data['shipping_address']['postcode'] = trim($this->request->post['postcode']);
				}

				if ($this->request->post['country_id'] == '') {
					$json['error']['country'] = $this->language->get('error_country');
				} else {
					$this->session->data['shipping_address']['country_id'] = trim($this->request->post['country_id']);
				}

				if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
					$json['error']['zone_id'] = $this->language->get('error_zone');
				} else {
					$this->session->data['shipping_address']['zone_id'] = trim($this->request->post['zone_id']);
					$zone = $this->model_localisation_zone->getZone($this->request->post['zone_id']);
					$this->session->data['shipping_address']['zone'] = $zone['name'];
				}

				if (isset($this->request->post['company']) && $this->request->post['company'] != '') {
					$this->session->data['shipping_address']['company'] = trim($this->request->post['company']);
				}

				// Custom field validation
				$this->load->model('account/custom_field');

				$custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

				foreach ($custom_fields as $custom_field) {
					if ($custom_field['location'] == 'address') {
						if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
							$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
						} elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
							$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
						}
					}
				}

				$this->session->data['payment_address'] = $this->session->data['shipping_address'];

				if(!$json) {
					$json['done'] = true;
				}
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
