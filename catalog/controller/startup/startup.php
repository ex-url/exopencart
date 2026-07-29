<?php
class ControllerStartupStartup extends Controller {
	public function index() {
		// Store
		if ($this->request->server['HTTPS']) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store WHERE REPLACE(`ssl`, 'www.', '') = '" . $this->db->escape('https://' . str_replace('www.', '', $_SERVER['HTTP_HOST']) . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/') . "'");
		} else {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store WHERE REPLACE(`url`, 'www.', '') = '" . $this->db->escape('http://' . str_replace('www.', '', $_SERVER['HTTP_HOST']) . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/') . "'");
		}

		if (isset($this->request->get['store_id'])) {
			$this->config->set('config_store_id', (int)$this->request->get['store_id']);
		} else if ($query->num_rows) {
			$this->config->set('config_store_id', $query->row['store_id']);
		} else {
			$this->config->set('config_store_id', 0);
		}

		if (!$query->num_rows) {
			$this->config->set('config_url', HTTP_SERVER);
			$this->config->set('config_ssl', HTTPS_SERVER);
		}

		// Settings
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE store_id = '0' OR store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY store_id ASC");

		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$this->config->set($result['key'], $result['value']);
			} else {
				$this->config->set($result['key'], json_decode($result['value'], true));
			}
		}

		// Set time zone
		if ($this->config->get('config_timezone')) {
			date_default_timezone_set($this->config->get('config_timezone'));

			// Sync PHP and DB time zones.
			$this->db->query("SET time_zone = '" . $this->db->escape(date('P')) . "'");
		}

		// Theme
		$this->config->set('template_cache', $this->config->get('developer_theme'));

		// Url
		$this->registry->set('url', new Url($this->config->get('config_url'), $this->config->get('config_ssl')));

		// Language
		$code = '';

		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();

		if (isset($this->session->data['language'])) {
			$code = $this->session->data['language'];
		}

		if (isset($this->request->cookie['language']) && !array_key_exists($code, $languages)) {
			$code = $this->request->cookie['language'];
		}

		// Language Detection
		if (!empty($this->request->server['HTTP_ACCEPT_LANGUAGE']) && !array_key_exists($code, $languages)) {
			$detect = '';

			$browser_languages = explode(',', $this->request->server['HTTP_ACCEPT_LANGUAGE']);

			// Try using local to detect the language
			foreach ($browser_languages as $browser_language) {
				foreach ($languages as $key => $value) {
					if ($value['status']) {
						$locale = explode(',', $value['locale']);

						if (in_array($browser_language, $locale)) {
							$detect = $key;
							break 2;
						}
					}
				}
			}

			if (!$detect) {
				// Try using language folder to detect the language
				foreach ($browser_languages as $browser_language) {
					if (array_key_exists(strtolower($browser_language), $languages)) {
						$detect = strtolower($browser_language);

						break;
					}
				}
			}

			$code = $detect ? $detect : '';
		}

		if (!array_key_exists($code, $languages)) {
			$code = $this->config->get('config_language');
		}

		if (!isset($this->session->data['language']) || $this->session->data['language'] != $code) {
			$this->session->data['language'] = $code;
		}

		if (!isset($this->request->cookie['language']) || $this->request->cookie['language'] != $code) {
			setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
		}

		// Overwrite the default language object
		$language = new Language($code);
		$language->load($code);

		$this->registry->set('language', $language);

		// Set the config language_id
		$this->config->set('config_language_id', $languages[$code]['language_id']);

		// Rate limit
		if ($this->config->get('config_rl_status')) {
			$route = isset($this->request->get['route']) ? $this->request->get['route'] : '';

			// Skip rate limit for captcha, API routes and whitelisted IPs
			$skip_route = (
				strpos($route, 'common/guard') === 0 ||
				strpos($route, 'extension/captcha') === 0 ||
				(isset($this->session->data['api_id']))
			);

			$ip = $this->request->server['REMOTE_ADDR'];
			$whitelist = array_map('trim', explode(',', $this->config->get('config_rl_whitelist')));
			$skip_ip = in_array($ip, $whitelist);

			if (!$skip_route && !$skip_ip) {
				$soft_limit = (int)$this->config->get('config_rl_soft_limit') ?: 50;
				$hard_limit = (int)$this->config->get('config_rl_hard_limit') ?: 80;
				$ban_ttl    = 3600;
				$window_ttl = 60;

				$ua = isset($this->request->server['HTTP_USER_AGENT']) ? $this->request->server['HTTP_USER_AGENT'] : '';
				$identifier = md5($ip . $ua);

				if ($this->cache->get('rl_ban.' . $identifier)) {
					http_response_code(429);
					exit('Cool down bro, you are too fast. Try again in an hour.');
				}

				$window = $this->cache->get('rl_count.' . $identifier) ?: ['count' => 0, 'time' => time()];

				if ((time() - $window['time']) > $window_ttl) {
					$window = ['count' => 1, 'time' => time()];
				} else {
					$window['count']++;
				}

				$this->cache->set('rl_count.' . $identifier, $window, $window_ttl + 10);
				$count = $window['count'];

				if ($count > $hard_limit) {
					$this->cache->set('rl_ban.' . $identifier, 1, $ban_ttl);
					$this->log->write('Rate limit HARD ban: ' . $identifier);
					http_response_code(429);
					exit('Cool down bro, you are too fast. Try again in an hour.');
				}

				$trusted = $this->cache->get('rl_trusted.' . $identifier);

				if (!$trusted && $count > $soft_limit) {
					$this->log->write('Rate limit SOFT redirect: ' . $identifier . ' Count: ' . $count);
					$redirect = $this->request->server['REQUEST_URI'] ?? '/';

					if (
						strpos($redirect, '//') === 0 || 
						strpos($redirect, 'http') === 0 || 
						strlen($redirect) > 500
					) {
						$redirect = '/';
					}
					
					$this->session->data['rl_redirect'] = $redirect;
					$this->response->redirect($this->url->link('common/guard', '', true));
				}
			}
		}

		// Forced captcha on the first visit
		if ($this->config->get('config_forced_captcha') && !isset($this->session->data['captcha_passed'])) {
			// check if it's an API call
			if (isset($this->session->data['api_id'])) {
				// api is trusted
				$this->session->data['captcha_passed'] = true;
			} else {
				$route = isset($this->request->get['route']) ? $this->request->get['route'] : '';
				if (
					strpos($route, 'common/guard')        !== 0 &&
					strpos($route, 'extension/captcha')   !== 0
				) {
					$this->response->redirect($this->url->link('common/guard', '', true));
				}
			}
		}

		// Customer
		$customer = new Cart\Customer($this->registry);
		$this->registry->set('customer', $customer);

		// Customer Group
		if (isset($this->session->data['customer']) && isset($this->session->data['customer']['customer_group_id'])) {
			// For API calls
			$this->config->set('config_customer_group_id', $this->session->data['customer']['customer_group_id']);
		} elseif ($this->customer->isLogged()) {
			// Logged in customers
			$this->config->set('config_customer_group_id', $this->customer->getGroupId());
		} elseif (isset($this->session->data['guest']) && isset($this->session->data['guest']['customer_group_id'])) {
			$this->config->set('config_customer_group_id', $this->session->data['guest']['customer_group_id']);
		} else {
			$this->config->set('config_customer_group_id', $this->config->get('config_customer_group_id'));
		}

		// Tracking Code
		if (isset($this->request->get['tracking'])) {
			setcookie('tracking', $this->request->get['tracking'], time() + 3600 * 24 * 1000, '/');

			if (empty($this->session->data['marketing_code'])) {
				$this->db->query("UPDATE `" . DB_PREFIX . "marketing` SET clicks = (clicks + 1) WHERE code = '" . $this->db->escape($this->request->get['tracking']) . "'");
				$this->session->data['marketing_code'] = $this->request->get['tracking'];
			}

			$this->load->model('account/customer');
			$affiliate = $this->model_account_customer->getAffiliateByTracking($this->request->get['tracking']);

			if ($affiliate && empty($this->session->data['affiliate_id'])) {
				$this->model_account_customer->updateAffiliateClicks($affiliate['customer_id']);
				$this->session->data['affiliate_id'] = $affiliate['customer_id'];
			}
		}

		// Currency
		$code = '';

		$this->load->model('localisation/currency');

		$currencies = $this->model_localisation_currency->getCurrencies();

		if (isset($this->session->data['currency'])) {
			$code = $this->session->data['currency'];
		}

		if (isset($this->request->cookie['currency']) && !array_key_exists($code, $currencies)) {
			$code = $this->request->cookie['currency'];
		}

		if (!array_key_exists($code, $currencies)) {
			$code = $this->config->get('config_currency');
		}

		if (!isset($this->session->data['currency']) || $this->session->data['currency'] != $code) {
			$this->session->data['currency'] = $code;
		}

		if (!isset($this->request->cookie['currency']) || $this->request->cookie['currency'] != $code) {
			setcookie('currency', $code, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
		}

		$this->registry->set('currency', new Cart\Currency($this->registry));

		// Tax
		$this->registry->set('tax', new Cart\Tax($this->registry));

		// PHP v7.4+ validation compatibility.
		if (isset($this->session->data['shipping_address']['country_id']) && isset($this->session->data['shipping_address']['zone_id'])) {
			$this->tax->setShippingAddress($this->session->data['shipping_address']['country_id'], $this->session->data['shipping_address']['zone_id']);
		} elseif ($this->config->get('config_tax_default') == 'shipping') {
			$this->tax->setShippingAddress($this->config->get('config_country_id'), $this->config->get('config_zone_id'));
		}

		if (isset($this->session->data['payment_address']['country_id']) && isset($this->session->data['payment_address']['zone_id'])) {
			$this->tax->setPaymentAddress($this->session->data['payment_address']['country_id'], $this->session->data['payment_address']['zone_id']);
		} elseif ($this->config->get('config_tax_default') == 'payment') {
			$this->tax->setPaymentAddress($this->config->get('config_country_id'), $this->config->get('config_zone_id'));
		}

		$this->tax->setStoreAddress($this->config->get('config_country_id'), $this->config->get('config_zone_id'));

		// Weight
		$this->registry->set('weight', new Cart\Weight($this->registry));

		// Length
		$this->registry->set('length', new Cart\Length($this->registry));

		// Cart
		$this->registry->set('cart', new Cart\Cart($this->registry));

		// Encryption
		$this->registry->set('encryption', new Encryption($this->config->get('config_encryption')));
	}
}
