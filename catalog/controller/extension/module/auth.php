<?php
class ControllerExtensionModuleAuth extends Controller {
	public function index() {

		if ($this->config->get('module_auth_status')) {
			$this->load->language('extension/module/auth');

			$settings = $this->config->get('module_auth_settings');

			$data = [];

			if ($settings['yandex_status'] == 1) {
				$data['yandex_status'] = $settings['yandex_status'];
				$data['yandex_client_id'] = $settings['yandex_client_id'];
				$data['yandex_redirect_uri'] = $this->url->link('extension/module/auth/yandex');
				$data['yandex_token_page_origin'] = $this->config->get('site_ssl');
			}

			if ($settings['vk_status'] == 1) {
				$data['vk_status'] = $settings['vk_status'];
				$data['vk_application_id'] = $settings['vk_application_id'];
				$data['vk_redirect_uri'] = $this->config->get('site_ssl');
			}

			if ($settings['google_status'] == 1) {
				$data['google_status'] = $settings['google_status'];
				$data['google_client_id'] = $settings['google_client_id'];
				$data['google_redirect_uri'] = $this->url->link('extension/module/auth/google');
			}

			return $this->load->view('extension/module/auth', $data);
		}
	}

	public function collect() {
		if (empty($this->session->data['auth_pending'])) {
			$this->response->redirect($this->url->link('account/login'));
			return;
		}

		$pending = $this->session->data['auth_pending'];

		if (isset($pending['timestamp']) && (time() - $pending['timestamp']) > 600) {
			unset($this->session->data['auth_pending']);
			$this->response->redirect($this->url->link('account/login'));
			return;
		}

		$this->load->language('extension/module/auth');
		$this->load->language('account/register');
		$this->load->model('account/customer');
		$this->load->model('extension/module/auth');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$json = [];

			if (isset($this->request->post['firstname'])) {
				$firstname = trim($this->request->post['firstname']);

				if (utf8_strlen($firstname) < 1 || utf8_strlen($firstname) > 32) {
					$json['error']['firstname'] = $this->language->get('error_firstname');
				}
			}

			if (isset($this->request->post['lastname'])) {
				$lastname = trim($this->request->post['lastname']);

				if (utf8_strlen($lastname) < 1 || utf8_strlen($lastname) > 32) {
					$json['error']['lastname'] = $this->language->get('error_lastname');
				}
			}

			if (isset($this->request->post['email'])) {
				$email = trim($this->request->post['email']);

				if ($email === '' || utf8_strlen($email) > 96 || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
					$json['error']['email'] = $this->language->get('error_email');
				}

				if (!isset($json['error']['email']) && $this->model_account_customer->getTotalCustomersByEmail($email)) {
					$json['error']['email'] = $this->language->get('error_exists');
				}
			}

			if (isset($this->request->post['telephone'])) {
				$telephone = trim($this->request->post['telephone']);

				if ($telephone === '' || utf8_strlen($telephone) < 3 || utf8_strlen($telephone) > 32) {
					$json['error']['telephone'] = $this->language->get('error_telephone');
				}
			}

			if ($this->config->get('config_account_id')) {
				$this->load->model('catalog/information');

				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

				if ($information_info && !isset($this->request->post['agree'])) {
					$json['error']['agree'] = $this->language->get('error_agree');
				}
			}

			if (!$json) {
				$customer_data = [
					'firstname' => trim($this->request->post['firstname'] ?? $pending['firstname'] ?? ''),
					'lastname' => trim($this->request->post['lastname'] ?? $pending['lastname'] ?? ''),
					'email' => trim($this->request->post['email'] ?? $pending['email'] ?? ''),
					'telephone' => trim($this->request->post['telephone'] ?? $pending['telephone'] ?? ''),
					'password' => token(8),
					'status' => 1,
					'customer_group_id' => $this->config->get('config_customer_group_id')
				];

				$customer_id = $this->model_account_customer->addCustomer($customer_data);
				$this->model_extension_module_auth->addCustomerAuth($customer_id, $pending['provider'], $pending['provider_user_id']);
				$this->session->data['customer_id'] = $customer_id;
				$json['redirect'] = $this->getRedirectUrl();
				unset($this->session->data['auth_pending']);
				unset($this->session->data['redirect']);
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
			return;
		}

		$data['firstname'] = isset($pending['firstname']) ? trim($pending['firstname']) : '';
		$data['lastname'] = isset($pending['lastname']) ? trim($pending['lastname']) : '';
		$data['email'] = isset($pending['email']) ? trim($pending['email']) : '';
		$data['telephone'] = isset($pending['telephone']) ? trim($pending['telephone']) : '';

		$data['breadcrumbs'] = [];
		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		];
		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_collect_page'),
			'href' => $this->url->link('extension/module/auth/collect')
		];

		$this->document->setTitle($this->language->get('text_collect_page'));

		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), true), $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}

		$data['login'] = $this->url->link('account/login');

		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');

		$this->response->setOutput($this->load->view('extension/module/auth_collect', $data));
	}

	public function yandex() {

		if ($this->request->server['REQUEST_METHOD'] == 'GET') {
			$data['yandex_token_page_origin'] = $this->config->get('site_ssl');

			$this->response->setOutput($this->load->view('extension/module/auth_yandex', $data));
		}

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->load->model('extension/module/auth');
			$this->load->model('account/customer');
			$this->load->language('extension/module/auth');

			$settings = $this->config->get('module_auth_settings');

			$input = json_decode(file_get_contents('php://input'), true);

			$token = $input['access_token'] ?? '';
			$json = [];

			if (!$token) {
				$this->log->write($this->language->get('error_yandex_token'));
				$json['error'] = $this->language->get('error_yandex_token');
			}

			if (!$json) {
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, 'https://login.yandex.ru/info');
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_HTTPHEADER, [
					'Authorization: Bearer ' . $token,
					'Content-Type: application/json'
				]);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
				curl_setopt($ch, CURLOPT_TIMEOUT, 5);

				$response = curl_exec($ch);
				$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
				$error = curl_error($ch);
				curl_close($ch);

				if ($error || $http_code !== 200) {
					$this->log->write($this->language->get('error_yandex_user'));
					$json['error'] = $this->language->get('error_yandex_user');
				}
			}

			$user = null;

			if (!$json) {
				$user = json_decode($response, true);

				if (json_last_error() !== JSON_ERROR_NONE) {
					$this->log->write($this->language->get('error_yandex_parsing'));
					$json['error'] = $this->language->get('error_yandex_parsing');
				}
			}

			if (!$json && $user) {
				$provider = 'yandex';
				$provider_user_id = $user['id'];
				$firstname = $user['first_name'] ?? '';
				$lastname = $user['last_name'] ?? '';
				$email = $this->extractYandexEmail($user);
				$telephone = $user['default_phone']['number'] ?? '';

				$json = $this->processUserData($provider, $provider_user_id, $firstname, $lastname, $email, $telephone);
			}

			if (isset($json['error'])) {
				http_response_code(400);
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function vk() {

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->load->language('extension/module/auth');

			$settings = $this->config->get('module_auth_settings');

			$input = json_decode(file_get_contents('php://input'), true);

			$access_token = $input['access_token'] ?? '';
			$json = [];

			if (!$access_token) {
				$this->log->write($this->language->get('error_vk_token'));
				$json['error'] = $this->language->get('error_vk_token');
			}

			if (!$json) {
				$client_id = $settings['vk_application_id'];

				$payload = http_build_query([
					'client_id' => $client_id,
					'access_token' => $access_token
				]);

				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, 'https://id.vk.ru/oauth2/user_info');
				curl_setopt($ch, CURLOPT_POST, true);
				curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_HTTPHEADER, [
					'Content-Type: application/x-www-form-urlencoded'
				]);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
				curl_setopt($ch, CURLOPT_TIMEOUT, 5);

				$response = curl_exec($ch);
				$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
				$error = curl_error($ch);
				curl_close($ch);

				if ($error || $http_code !== 200) {
					$this->log->write($this->language->get('error_vk_user'));
					$json['error'] = $this->language->get('error_vk_user');
				}
			}

			$user = null;

			if (!$json) {
				$user = json_decode($response, true);

				if (json_last_error() !== JSON_ERROR_NONE) {
					$this->log->write($this->language->get('error_vk_parsing'));
					$json['error'] = $this->language->get('error_vk_parsing');
				}
			}

			if (!$json && $user) {

				$provider = 'vk';
				$provider_user_id = $user['user']['user_id'];
				$firstname = $user['user']['first_name'] ?? '';
				$lastname = $user['user']['last_name'] ?? '';
				$email = $user['user']['email'] ?? '';
				$telephone = $user['user']['phone'] ?? '';

				$json = $this->processUserData($provider, $provider_user_id, $firstname, $lastname, $email, $telephone);
			}

			if (isset($json['error'])) {
				http_response_code(400);
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function google() {

		$this->load->language('extension/module/auth');

		$settings = $this->config->get('module_auth_settings');

		$input = json_decode(file_get_contents('php://input'), true);

		$id_token = $input['credential'] ?? '';

		if (!$id_token) {
			$this->log->write($this->language->get('error_google_token'));
			$json['error'] = $this->language->get('error_google_token');
		}

		$client_id = $settings['google_client_id'] ?? '';

		$user_data = $this->verifyGoogleToken($id_token, $client_id);

		if (!$user_data) {
			$this->log->write($this->language->get('error_google_user'));
			$json['error'] = $this->language->get('error_google_user');
		}

		$json = $this->processUserData('google', $user_data['sub'],	$user_data['first_name'],	$user_data['last_name'], $user_data['email'], '');

		if (isset($json['error'])) {
			http_response_code(400);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	private function processUserData($provider, $provider_user_id, $firstname, $lastname, $email, $telephone) {
		$this->load->model('extension/module/auth');
		$this->load->model('account/customer');

		$json = [];
		$settings = $this->config->get('module_auth_settings');

		$customer_id = $this->model_extension_module_auth->getCustomerIdByProvider($provider, $provider_user_id);

		if ($customer_id) {
			$this->session->data['customer_id'] = $customer_id;
			$json['redirect'] = $this->getRedirectUrl();
			return $json;
		}

		if ($email) {
			$customer_id = $this->model_extension_module_auth->getCustomerIdByEmail($email);

			if ($customer_id) {
				$this->model_extension_module_auth->addCustomerAuth($customer_id, $provider, $provider_user_id);
				$this->session->data['customer_id'] = $customer_id;
				$json['redirect'] = $this->getRedirectUrl();
				return $json;
			}
		}

		if ($settings['collect'] && (empty($firstname) || empty($lastname) || empty($email) || empty($telephone))) {
			$this->session->data['auth_pending'] = [
				'provider' => $provider,
				'provider_user_id' => $provider_user_id,
				'firstname' => $firstname,
				'lastname' => $lastname,
				'email' => $email,
				'telephone' => $telephone,
				'timestamp' => time()
			];

			$json['redirect'] = $this->url->link('extension/module/auth/collect');
			return $json;
		}

		$customer_data = [
			'firstname' => $firstname ?: 'User',
			'lastname' => $lastname ?: '',
			'email' => $email ?: '',
			'telephone' => $telephone ?: '',
			'password' => token(8),
			'status' => 1,
			'customer_group_id' => $this->config->get('config_customer_group_id')
		];

		$customer_id = $this->model_account_customer->addCustomer($customer_data);
		$this->model_extension_module_auth->addCustomerAuth($customer_id, $provider, $provider_user_id);
		$this->session->data['customer_id'] = $customer_id;
		$json['redirect'] = $this->getRedirectUrl();

		return $json;
	}

	private function extractYandexEmail($data) {
		$email = '';

		if (!empty($data['default_email']) && filter_var($data['default_email'], FILTER_VALIDATE_EMAIL)) {
			$email = $data['default_email'];
		} elseif (!empty($data['emails']) && is_array($data['emails'])) {
			foreach ($data['emails'] as $candidate) {
				if (filter_var($candidate, FILTER_VALIDATE_EMAIL)) {
					$email = $candidate;
					break;
				}
			}
		}

		return $email;
	}

	private function getRedirectUrl() {
		$redirect = !empty($this->session->data['redirect']) ? $this->session->data['redirect'] : $this->url->link('account/account');
		return $redirect;
	}

	private function verifyGoogleToken($id_token, $client_id) {
		$parts = explode('.', $id_token);
		if (count($parts) !== 3) {
			$this->log->write('Google JWT: Invalid token format');
			return false;
		}

		list($header_encoded, $payload_encoded, $signature_encoded) = $parts;

		$header = json_decode(base64_decode(strtr($header_encoded, '-_', '+/')), true);
		$payload = json_decode(base64_decode(strtr($payload_encoded, '-_', '+/')), true);

		if (!$header || !$payload) {
			$this->log->write('Google JWT: Failed to decode token');
			return false;
		}

		if (empty($header['alg']) || $header['alg'] !== 'RS256') {
			$this->log->write('Google JWT: Invalid algorithm: ' . ($header['alg'] ?? 'none'));
			return false;
		}

		if (empty($payload['aud']) || $payload['aud'] !== $client_id) {
			$this->log->write('Google JWT: Invalid audience: ' . ($payload['aud'] ?? 'none'));
			return false;
		}

		$current_time = time();
		if (empty($payload['iat']) || $payload['iat'] > $current_time) {
			$this->log->write('Google JWT: Token issued in the future');
			return false;
		}
		if (empty($payload['exp']) || $payload['exp'] < $current_time) {
			$this->log->write('Google JWT: Token expired');
			return false;
		}

		$signature = base64_decode(strtr($signature_encoded, '-_', '+/'));
		$data_to_verify = $header_encoded . '.' . $payload_encoded;

		$keys = $this->getGooglePublicKeys();
		if (!$keys) {
			$this->log->write('Google JWT: Failed to fetch public keys');
			return false;
		}

		$kid = $header['kid'] ?? '';
		if (empty($kid) || empty($keys[$kid])) {
			$this->log->write('Google JWT: Key ID not found: ' . $kid);
			return false;
		}

		$public_key = $keys[$kid];

		$verify_result = openssl_verify(
			$data_to_verify,
			$signature,
			$public_key,
			OPENSSL_ALGO_SHA256
		);

		if ($verify_result !== 1) {
			$this->log->write('Google JWT: Signature verification failed');
			return false;
		}

		if (empty($payload['iss']) || !in_array($payload['iss'], ['accounts.google.com', 'https://accounts.google.com'])) {
			$this->log->write('Google JWT: Invalid issuer: ' . ($payload['iss'] ?? 'none'));
			return false;
		}

		return [
			'sub' => $payload['sub'] ?? '',
			'email' => $payload['email'] ?? '',
			'email_verified' => $payload['email_verified'] ?? false,
			'first_name' => $payload['given_name'] ?? '',
			'last_name' => $payload['family_name'] ?? '',
			'name' => $payload['name'] ?? '',
			'picture' => $payload['picture'] ?? '',
			'locale' => $payload['locale'] ?? ''
		];
	}

	private function getGooglePublicKeys() {
		if (
			isset($this->session->data['google_public_keys']) &&
			isset($this->session->data['google_keys_expires']) &&
			$this->session->data['google_keys_expires'] > time()
		) {
			return $this->session->data['google_public_keys'];
		}

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, 'https://www.googleapis.com/oauth2/v3/certs');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT, 10);

		$response = curl_exec($ch);
		$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
		$error = curl_error($ch);
		curl_close($ch);

		if ($error || $http_code !== 200) {
			$this->log->write('Google JWT: Failed to fetch public keys - ' . ($error ?: 'HTTP ' . $http_code));
			return [];
		}

		$data = json_decode($response, true);
		if (empty($data['keys']) || !is_array($data['keys'])) {
			$this->log->write('Google JWT: Invalid public keys response');
			return [];
		}

		$keys = [];
		foreach ($data['keys'] as $key) {
			if (empty($key['kid']) || empty($key['n']) || empty($key['e'])) {
				continue;
			}

			$public_key = $this->convertRsaKeyToPem($key['n'], $key['e']);
			if ($public_key) {
				$keys[$key['kid']] = $public_key;
			}
		}

		if (empty($keys)) {
			$this->log->write('Google JWT: No valid public keys found');
			return [];
		}

		$this->session->data['google_public_keys'] = $keys;
		$this->session->data['google_keys_expires'] = time() + 3600;

		return $keys;
	}

	private function convertRsaKeyToPem($n, $e) {
		$n_decoded = base64_decode(strtr($n, '-_', '+/'));
		$e_decoded = base64_decode(strtr($e, '-_', '+/'));

		if (!$n_decoded || !$e_decoded) {
			return false;
		}

		$rsa_key = "\x30\x82\x01\x22\x30\x0d\x06\x09\x2a\x86\x48\x86\xf7\x0d\x01\x01\x01\x05\x00\x03\x82\x01\x0f\x00";

		$rsa_key .= "\x30\x82\x01\x0a\x02\x82\x01\x01\x00" . $n_decoded . "\x02\x03" . $e_decoded;

		$pem = "-----BEGIN PUBLIC KEY-----\n";
		$pem .= chunk_split(base64_encode($rsa_key), 64, "\n");
		$pem .= "-----END PUBLIC KEY-----\n";

		return $pem;
	}
}
