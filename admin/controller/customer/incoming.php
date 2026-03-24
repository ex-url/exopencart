<?php
class ControllerCustomerIncoming extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('customer/incoming');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/incoming');

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'i.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = (int)$this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('customer/incoming', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		$data['delete'] = $this->url->link('customer/incoming/deleteMany', 'user_token=' . $this->session->data['user_token'] . $url, true);

		$data['incomings'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$incoming_total = $this->model_customer_incoming->getTotalIncomings();

		$results = $this->model_customer_incoming->getIncomings($filter_data);

		foreach ($results as $result) {

			if($result['user_id'] != 0) {
				$this->load->model('user/user');
				$user = $this->model_user_user->getUser($result['user_id']);
			} else {
				$user = false;
			}

			if($result['customer_id'] != 0) {
				$this->load->model('customer/customer');
				$customer = $this->url->link('customer/customer/edit', 'user_token=' . $this->session->data['user_token'] . '&customer_id=' . $result['customer_id'], true);
			} else {
				$customer = false;
			}

			$data['incomings'][] = array(
				'incoming_id' => $result['incoming_id'],
				'name'              => $result['name'],
				'user'              => $user ? $user['username'] : '',
				'customer'          => $customer,
				'type'              => $result['type'],
				'telephone'         => $result['telephone'],
				'email'             => $result['email'],
				'message'           => $result['message'],
				'status'            => $result['status'],
				'comment'           => nl2br(htmlspecialchars($result['comment'], ENT_QUOTES, 'UTF-8')),
				'ip'                => $result['ip'],
				'page_url'          => $result['page_url'],
				'date_added'        => date($this->language->get('datetime_format'), strtotime($result['date_added'])),
				'date_modified'     => $result['date_added'] < $result['date_modified'] ? date($this->language->get('datetime_format'), strtotime($result['date_modified'])) : false,
				'edit'              => $this->url->link('customer/incoming/edit', 'user_token=' . $this->session->data['user_token'] . '&incoming_id=' . $result['incoming_id'] . $url, true)
			);
		}

		$data['user_token'] = $this->session->data['user_token'];

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('customer/incoming', 'user_token=' . $this->session->data['user_token'] . '&sort=cgd.name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('customer/incoming', 'user_token=' . $this->session->data['user_token'] . '&sort=cg.sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $incoming_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('customer/incoming', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($incoming_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($incoming_total - $this->config->get('config_limit_admin'))) ? $incoming_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $incoming_total, ceil($incoming_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customer/incoming_list', $data));
	}

	public function poll() {
		$json = array();

		$this->load->model('customer/incoming');

		$incoming_total = $this->model_customer_incoming->getTotalNewIncomings();

		if ($incoming_total) {
			$json['total'] = $incoming_total;
		} else {
			$json['total'] = 0;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function status() {
		$json = array();

		if (isset($this->request->post['incoming_id'])) {
			$this->load->model('customer/incoming');

			$incoming_id = $this->request->post['incoming_id'];

			$this->model_customer_incoming->done($incoming_id);
			$json['success'] = true;

		} else {
			$json['error'] = $this->language->get('error_not_found');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function comment() {
		$json = array();

		if (isset($this->request->post['incoming_id'])) {
			$this->load->model('customer/incoming');

			$this->model_customer_incoming->comment($this->request->post);
			$json['success'] = true;

		} else {
			$json['error'] = $this->language->get('error_not_found');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete() {
		$json = array();

		if (isset($this->request->post['incoming_id'])) {
			$this->load->model('customer/incoming');

			$incoming_id = $this->request->post['incoming_id'];

			$this->model_customer_incoming->delete($incoming_id);
			$this->log->write('Deleted incoming request ID: ' . $incoming_id . ' by user ID: ' . $this->user->getId());
			$json['success'] = true;

		} else {
			$json['error'] = $this->language->get('error_not_found');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function deleteMany() {
		$this->load->language('customer/incoming');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/incoming');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $incoming_id) {
				$this->model_customer_incoming->delete($incoming_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('customer/incoming', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'customer/incoming')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}
