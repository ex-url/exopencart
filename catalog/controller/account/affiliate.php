<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerAccountAffiliate extends Controller {
	private $error = array();

	public function add() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/affiliate', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/affiliate');

		$this->document->setTitle($this->language->get('text_create'));
		$this->document->setRobots('noindex,follow');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_account_customer->addAffiliate($this->customer->getId(), $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('account/account', '', true));
		}

		$this->getForm();
	}

	public function edit() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/affiliate', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/affiliate');

		$this->document->setTitle($this->language->get('text_edit'));
		$this->document->setRobots('noindex,follow');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_account_customer->editAffiliate($this->customer->getId(), $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('account/account', '', true));
		}

		$this->getForm();
	}

	public function getForm() {
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		if ($this->request->get['route'] == 'account/affiliate/add') {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_create'),
				'href' => $this->url->link('account/affiliate/add', '', true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('account/affiliate/edit', '', true)
			);
		}

		if (isset($this->error['agree'])) {
			$data['error_agree'] = $this->error['agree'];
		} else {
			$data['error_agree'] = '';
		}

		if (isset($this->error['tax'])) {
			$data['error_tax'] = $this->error['tax'];
		} else {
			$data['error_tax'] = '';
		}

		if (isset($this->error['custom_field'])) {
			$data['error_custom_field'] = $this->error['custom_field'];
		} else {
			$data['error_custom_field'] = array();
		}

		$data['action'] = $this->url->link($this->request->get['route'], '', true);

		if($this->request->get['route'] == 'account/affiliate/edit') {
			$data['heading_title'] = $this->language->get('text_edit');
		} else {
			$data['heading_title'] = $this->language->get('text_create');
		}

		if ($this->request->get['route'] == 'account/affiliate/edit' && $this->request->server['REQUEST_METHOD'] != 'POST') {
			$affiliate_info = $this->model_account_customer->getAffiliate($this->customer->getId());
		}

		if (isset($this->request->post['company'])) {
			$data['company'] = $this->request->post['company'];
		} elseif (!empty($affiliate_info)) {
			$data['company'] = $affiliate_info['company'];
		} else {
			$data['company'] = '';
		}

		if (isset($this->request->post['website'])) {
			$data['website'] = $this->request->post['website'];
		} elseif (!empty($affiliate_info)) {
			$data['website'] = $affiliate_info['website'];
		} else {
			$data['website'] = '';
		}

		if (isset($this->request->post['tax'])) {
			$data['tax'] = $this->request->post['tax'];
		} elseif (!empty($affiliate_info)) {
			$data['tax'] = $affiliate_info['tax'];
		} else {
			$data['tax'] = '';
		}

		if (isset($this->request->post['payment_details'])) {
			$data['payment_details'] = $this->request->post['payment_details'];
		} elseif (!empty($affiliate_info)) {
			$data['payment_details'] = $affiliate_info['payment_details'];
		} else {
			$data['payment_details'] = '';
		}

		// Custom Fields
		$this->load->model('account/custom_field');

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

		if (isset($this->request->post['custom_field'])) {
			$data['affiliate_custom_field'] = $this->request->post['custom_field'];
		} elseif (isset($affiliate_info)) {
			$data['affiliate_custom_field'] = json_decode($affiliate_info['custom_field'], true);
		} else {
			$data['affiliate_custom_field'] = array();
		}

		$affiliate_info = $this->model_account_customer->getAffiliate($this->customer->getId());

		if (!$affiliate_info && $this->config->get('config_affiliate_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_affiliate_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_affiliate_id'), true), $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}

		if (isset($this->request->post['agree'])) {
			$data['agree'] = $this->request->post['agree'];
		} else {
			$data['agree'] = false;
		}

		$data['back'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/affiliate', $data));
	}

	protected function validate() {

		if(empty($this->request->post['tax'])) {
			$this->error['tax'] = $this->language->get('error_tax');
		}
		
		// Custom field validation
		$this->load->model('account/custom_field');

		$custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

		foreach ($custom_fields as $custom_field) {
			if ($custom_field['location'] == 'affiliate') {
				if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
					$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
				} elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
					$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
				}
			}
		}

		// Validate agree only if customer not already an affiliate
		$affiliate_info = $this->model_account_customer->getAffiliate($this->customer->getId());

		if (!$affiliate_info && $this->config->get('config_affiliate_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_affiliate_id'));

			if ($information_info && !isset($this->request->post['agree'])) {
				$this->error['agree'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}

		return !$this->error;
	}
}
