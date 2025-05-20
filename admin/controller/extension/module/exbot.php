<?php

class ControllerExtensionModuleExbot extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/exbot');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('module_exbot', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if(isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
				$this->response->redirect($this->url->link('extension/module/exbot', 'user_token=' . $this->session->data['user_token'], true));
			} else {
				$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
			}
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/exbot', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/module/exbot', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);

		if (isset($this->request->post['module_exbot_status'])) {
			$data['module_exbot_status'] = $this->request->post['module_exbot_status'];
		} else {
			$data['module_exbot_status'] = $this->config->get('module_exbot_status');
		}

		if (isset($this->request->post['module_exbot_settings'])) {
			$data['module_exbot_settings'] = $this->request->post['module_exbot_settings'];
		} else {
			$data['module_exbot_settings'] = $this->config->get('module_exbot_settings');
		}

		$this->load->library('exbot');

		$webhook = $this->exbot->getWebhookInfo();

		$data['webhook'] = $webhook ? $webhook->getUrl() : '';

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/exbot', $data));
	}

	public function setWebhook() {
		$json = [];

		if (!$this->user->hasPermission('modify', 'extension/module/exbot')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if(!$json) {
			$this->load->library('exbot');
			$this->load->language('extension/module/exbot');

			$settings = $this->config->get('module_exbot_settings');
	
			if(isset($this->request->post['host']) && $this->request->post['host'] !== '') {
				$host = $this->request->post['host'];
			} else {
				$host = 'https://' . $this->request->server['HTTP_HOST'] . '/';
			}

			$token = token(32);
	
			$webhook_url =  $host . 'index.php?route=extension/module/exbot/webhook&token=' . $token;

			$result = $this->exbot->setWebhook($webhook_url);

			if($result) {
				$settings = $this->config->get('module_exbot_settings');
				$settings['token'] = $token;
				$this->updateSettings($settings);
				$this->session->data['success'] = $this->language->get('text_webhook_installed');	
				$json['result'] = $result;
			}
			
		}		

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function deleteWebhook() {
		$json = [];

		if (!$this->user->hasPermission('modify', 'extension/module/exbot')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if(!$json) {
			$this->load->library('exbot');
			$this->load->language('extension/module/exbot');

			$result = $this->exbot->deleteWebhook();

			if($result) {
				$settings = $this->config->get('module_exbot_settings');
				unset($settings['token']);
				$this->updateSettings($settings);
				$this->session->data['success'] = $this->language->get('text_webhook_deleted');	
				$json['result'] = $result;
			}	
			
		}		

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/exbot')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function install() {
    $this->load->model('setting/event');
    $this->model_setting_event->addEvent(
        'onOrderAdd',
        'catalog/model/checkout/order/addOrder/after',
        'extension/module/exbot/onOrderAdd'
    );
	}

	public function uninstall() {
    $this->load->model('setting/event');
    $this->model_setting_event->deleteEventByCode('onOrderAdd');
	}

	private function updateSettings($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(json_encode($data, true)) . "' WHERE `key` = 'module_exbot_settings'");
	}
}
