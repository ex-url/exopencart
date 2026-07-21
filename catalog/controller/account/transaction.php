<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerAccountTransaction extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/transaction', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/transaction');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->setRobots('noindex,follow');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_transaction'),
			'href' => $this->url->link('account/transaction', '', true)
		);

		$this->load->model('account/transaction');
		
		$data['column_amount'] = sprintf($this->language->get('column_amount'), $this->session->data['currency']);

		if (isset($this->request->get['page'])) {
			$page = (int)$this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['transactions'] = array();

		$filter_data = array(
			'sort'  => 'date_added',
			'order' => 'DESC',
			'start' => ($page - 1) * 10,
			'limit' => 10
		);

		$transaction_total = $this->model_account_transaction->getTotalTransactions();

		$results = $this->model_account_transaction->getTransactions($filter_data);

		$statuses = [
			$this->language->get('text_status_pending'),
			$this->language->get('text_status_success'),
			$this->language->get('text_status_reject')
		];

		foreach ($results as $result) {
			$data['transactions'][] = array(
				'amount'      => $this->currency->format($result['amount'], $this->session->data['currency']),
				'description' => $result['description'],
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'status'      => $result['status'],
				'status_text' => $statuses[$result['status']]
			);
		}

		$data['allow_payout'] = $this->config->get('config_affiliate_allow_payout');
		$data['payout_minimum'] = $this->currency->format($this->config->get('config_affiliate_payout_minimum'), $this->session->data['currency'], '', false);
		$data['balance'] = $this->currency->format($this->customer->getBalance(), $this->session->data['currency'], '', false);

		$data['text_payout_minimum'] = sprintf($this->language->get('text_payout_minimum'), $this->currency->format($this->config->get('config_affiliate_payout_minimum'), $this->session->data['currency'], ''));

		$pagination = new Pagination();
		$pagination->total = $transaction_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('account/transaction', 'page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($transaction_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($transaction_total - 10)) ? $transaction_total : ((($page - 1) * 10) + 10), $transaction_total, ceil($transaction_total / 10));

		$data['total'] = $this->currency->format($this->customer->getBalance(), $this->session->data['currency']);

		$data['continue'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/transaction', $data));
	}

	public function payout() {
		$this->load->language('account/transaction');

		$json = array();

		if (!$this->customer->isLogged() || !$this->config->get('config_affiliate_allow_payout')) {
			$json['redirect'] = $this->url->link('account/login', '', true);
		}

		if (!$json) {
			if ($this->request->server['REQUEST_METHOD'] == 'POST') {
				if (isset($this->request->post['amount'])) {
					$amount = (float)$this->request->post['amount'];
					$minimum = $this->currency->format($this->config->get('config_affiliate_payout_minimum'), $this->session->data['currency'], '', false);
					$balance = $this->currency->format($this->customer->getBalance(), $this->session->data['currency'], '', false);
				} else {
					$amount = 0;
				}

				if ($amount < $minimum) {
					$json['error']['amount'] = sprintf($this->language->get('error_payout_minimum'), $this->currency->format($this->config->get('config_affiliate_payout_minimum'), $this->session->data['currency'], ''));
				}

				if ($amount > $balance) {
					$json['error']['amount'] = $this->language->get('error_payout_balance');
				}

				if (!$json) {
					$this->load->model('account/transaction');

					$amount = -($this->currency->convert((int)$amount, $this->session->data['currency'], $this->config->get('config_currency')));

					$this->load->model('tool/incoming');

					$incoming = array(
						'customer_id' => $this->customer->getId(),
						'type' => $this->language->get('text_payout_request'),
						'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
						'email' => $this->customer->getEmail(),
						'telephone' => $this->customer->getTelephone(),
						'message' => sprintf($this->language->get('text_new_payout_request'), $this->customer->getFirstName() . ' ' . $this->customer->getLastName(), $this->currency->format(abs($amount), $this->session->data['currency'])),
						'ip' => $this->request->server['REMOTE_ADDR'],
						'page_url' => isset($this->request->server['HTTP_REFERER']) ? $this->request->server['HTTP_REFERER'] : ''
					);

					$this->model_tool_incoming->add($incoming);
					
					$this->model_account_transaction->addTransaction($this->customer->getId(), $this->language->get('text_payout_request'), $amount, 0, 0);

					$json['success'] = $this->language->get('text_success');
				}
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}