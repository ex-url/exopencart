<?php
class ControllerExtensionMenuDefault extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/menu/default');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_setting_setting->editSetting('menu_default', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if(isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
				$this->response->redirect($this->url->link('extension/menu/default', 'user_token=' . $this->session->data['user_token'], true));
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
			'href' => $this->url->link('extension/menu/default', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/menu/default', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=menu', true);

		if (isset($this->request->post['menu_default_status'])) {
			$data['menu_default_status'] = $this->request->post['menu_default_status'];
		} else {
			$data['menu_default_status'] = $this->config->get('menu_default_status');
		}

		if (isset($this->request->post['menu_default_settings'])) {
			$data['menu_default_settings'] = $this->request->post['menu_default_settings'];
		} else {
			$data['menu_default_settings'] = $this->config->get('menu_default_settings');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/menu/default', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/menu/default')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
