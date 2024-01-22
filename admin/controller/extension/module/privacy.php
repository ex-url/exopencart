<?php
class ControllerExtensionModulePrivacy extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/privacy');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('module_privacy', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if(isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
				$this->response->redirect($this->url->link('extension/module/privacy', 'user_token=' . $this->session->data['user_token'], true));
			} else {
				$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
			}
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
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
			'href' => $this->url->link('extension/module/privacy', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/module/privacy', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);

    $this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

    $this->load->model('catalog/information');

    $data['informations'] = $this->model_catalog_information->getInformations();

		if (isset($this->request->post['module_privacy_status'])) {
			$data['module_privacy_status'] = $this->request->post['module_privacy_status'];
		} else {
			$data['module_privacy_status'] = $this->config->get('module_privacy_status');
		}

		if (isset($this->request->post['module_privacy_content'])) {
			$data['module_privacy_content'] = $this->request->post['module_privacy_content'];
		} else {
			$data['module_privacy_content'] = $this->config->get('module_privacy_content');
		}

		if (isset($this->request->post['module_privacy_information'])) {
			$data['module_privacy_information'] = $this->request->post['module_privacy_information'];
		} else {
			$data['module_privacy_information'] = $this->config->get('module_privacy_information');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/privacy', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/privacy')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
