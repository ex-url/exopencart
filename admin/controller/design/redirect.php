<?php
class ControllerDesignRedirect extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('design/redirect');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/redirect');

		$this->getList();
	}

	public function add() {
		$this->load->language('design/redirect');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/redirect');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$redirect_id = $this->model_design_redirect->addRedirect($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_old'])) {
				$url .= '&filter_old=' . urlencode(html_entity_decode($this->request->get['filter_old'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_new'])) {
				$url .= '&filter_new=' . urlencode(html_entity_decode($this->request->get['filter_new'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if(isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
				$url .= '&redirect_id=' . $redirect_id;
				$this->response->redirect($this->url->link('design/redirect/edit', 'user_token=' . $this->session->data['user_token'] . $url, true));
			} else {
				$this->response->redirect($this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('design/redirect');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/redirect');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_design_redirect->editRedirect($this->request->get['redirect_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_old'])) {
				$url .= '&filter_old=' . urlencode(html_entity_decode($this->request->get['filter_old'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_new'])) {
				$url .= '&filter_new=' . urlencode(html_entity_decode($this->request->get['filter_new'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if(isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
				$url .= '&redirect_id=' . $this->request->get['redirect_id'];
				$this->response->redirect($this->url->link('design/redirect/edit', 'user_token=' . $this->session->data['user_token'] . $url, true));
			} else {
				$this->response->redirect($this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true));
			}
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('design/redirect');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/redirect');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $redirect_id) {
				$this->model_design_redirect->deleteRedirect($redirect_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_old'])) {
				$url .= '&filter_old=' . urlencode(html_entity_decode($this->request->get['filter_old'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_new'])) {
				$url .= '&filter_new=' . urlencode(html_entity_decode($this->request->get['filter_new'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_old'])) {
			$filter_old = $this->request->get['filter_old'];
		} else {
			$filter_old = '';
		}

		if (isset($this->request->get['filter_new'])) {
			$filter_new = $this->request->get['filter_new'];
		} else {
			$filter_new = '';
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'old';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = (int)$this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_old'])) {
			$url .= '&filter_old=' . urlencode(html_entity_decode($this->request->get['filter_old'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_new'])) {
			$url .= '&filter_new=' . urlencode(html_entity_decode($this->request->get['filter_new'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

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
			'href' => $this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		$data['add'] = $this->url->link('design/redirect/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['download'] = $this->url->link('design/redirect/download', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['upload'] = $this->url->link('design/redirect/upload', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['delete'] = $this->url->link('design/redirect/delete', 'user_token=' . $this->session->data['user_token'] . $url, true);

		$data['redirects'] = array();

		$filter_data = array(
			'filter_old'	    => $filter_old,
			'filter_new'	    => $filter_new,
			'filter_status'    => $filter_status,
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'              => $this->config->get('config_limit_admin')
		);

		$redirect_total = $this->model_design_redirect->getTotalRedirects($filter_data);

		$results = $this->model_design_redirect->getRedirects($filter_data);

		foreach ($results as $result) {
			$data['redirects'][] = array(
				'redirect_id' => $result['redirect_id'],
				'old'        => $result['old'],
				'new'        => $result['new'],
				'status'     => $result['status'],
				'edit'       => $this->url->link('design/redirect/edit', 'user_token=' . $this->session->data['user_token'] . '&redirect_id=' . $result['redirect_id'] . $url, true)
			);
		}

		$data['user_token'] = $this->session->data['user_token'];

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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_old'])) {
			$url .= '&filter_old=' . urlencode(html_entity_decode($this->request->get['filter_old'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_new'])) {
			$url .= '&filter_new=' . urlencode(html_entity_decode($this->request->get['filter_new'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_old'] = $this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . '&sort=old' . $url, true);
		$data['sort_new'] = $this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . '&sort=new' . $url, true);
		$data['sort_status'] = $this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . '&sort=status' . $url, true);

		$url = '';

		if (isset($this->request->get['filter_old'])) {
			$url .= '&filter_old=' . urlencode(html_entity_decode($this->request->get['filter_old'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_new'])) {
			$url .= '&filter_new=' . urlencode(html_entity_decode($this->request->get['filter_new'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $redirect_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($redirect_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($redirect_total - $this->config->get('config_limit_admin'))) ? $redirect_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $redirect_total, ceil($redirect_total / $this->config->get('config_limit_admin')));

		$data['filter_old'] = $filter_old;
		$data['filter_new'] = $filter_new;
		$data['filter_status'] = $filter_status;

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('design/redirect_list', $data));
	}

	public function download() {
		$this->load->language('design/redirect');
		$this->load->model('design/redirect');

		if (!$this->user->hasPermission('access', 'design/redirect')) {
			$this->session->data['error_warning'] = $this->language->get('error_permission');
			$this->response->redirect($this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'], true));
		}

		$filter_old = isset($this->request->get['filter_old']) ? $this->request->get['filter_old'] : '';
		$filter_new = isset($this->request->get['filter_new']) ? $this->request->get['filter_new'] : '';
		$filter_status = isset($this->request->get['filter_status']) ? $this->request->get['filter_status'] : '';

		$filter_data = array(
			'filter_old' => $filter_old,
			'filter_new' => $filter_new,
			'filter_status' => $filter_status
		);

		if (isset($this->request->get['sort'])) {
			$filter_data['sort'] = $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$filter_data['order'] = $this->request->get['order'];
		}

		$redirects = $this->model_design_redirect->getRedirects($filter_data);

		$filename = 'redirects_' . date('Y-m-d_H-i-s') . '.csv';

		$handle = fopen('php://temp', 'w+');

		// UTF-8 BOM for proper opening in spreadsheet tools.
		fwrite($handle, "\xEF\xBB\xBF");
		fputcsv($handle, array('redirect_id', 'old', 'new', 'status'));

		foreach ($redirects as $redirect) {
			fputcsv($handle, array(
				$redirect['redirect_id'],
				$redirect['old'],
				$redirect['new'],
				$redirect['status']
			));
		}

		rewind($handle);
		$output = stream_get_contents($handle);
		fclose($handle);

		$this->response->addHeader('Content-Type: text/csv; charset=UTF-8');
		$this->response->addHeader('Content-Disposition: attachment; filename="' . $filename . '"');
		$this->response->addHeader('Pragma: no-cache');
		$this->response->addHeader('Expires: 0');
		$this->response->setOutput($output);
	}

	public function upload() {
		$this->load->language('design/redirect');
		$this->load->model('design/redirect');

		$url = '';

		if (isset($this->request->get['filter_old'])) {
			$url .= '&filter_old=' . urlencode(html_entity_decode($this->request->get['filter_old'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_new'])) {
			$url .= '&filter_new=' . urlencode(html_entity_decode($this->request->get['filter_new'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (!$this->user->hasPermission('modify', 'design/redirect')) {
			$this->session->data['error_warning'] = $this->language->get('error_permission');
			$this->response->redirect($this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		if (isset($this->request->files['file']['tmp_name']) && is_uploaded_file($this->request->files['file']['tmp_name'])) {
			$handle = fopen($this->request->files['file']['tmp_name'], 'r');
			$total = 0;
			$added = 0;
			$updated = 0;
			$line = 0;
			$seen_old = array();

			while (($data = fgetcsv($handle, 0, ',')) !== false) {
				$line++;
				$first_column = isset($data[0]) ? preg_replace('/^\xEF\xBB\xBF/', '', $data[0]) : '';

				if ($line === 1 && isset($data[1], $data[2], $data[3]) && $first_column === 'redirect_id' && $data[1] === 'old' && $data[2] === 'new' && $data[3] === 'status') {
					continue;
				}

				if (!isset($data[1], $data[2], $data[3])) {
					$this->log->write('Redirect CSV import: skipped line ' . $line . ' because required columns are missing');
					continue;
				}

				$old = trim($data[1]);
				$new = trim($data[2]);
				$status = (int)$data[3];
				$redirect_id = isset($data[0]) ? (int)$data[0] : 0;

				if ($redirect_id === 0 && $old === '' && $new === '' && $status === 0) {
					continue;
				}

				$total++;

				if (isset($seen_old[$old])) {
					$this->log->write('Redirect CSV import: skipped line ' . $line . ' because old value is duplicated in file (first seen at line ' . $seen_old[$old] . ')');
					continue;
				}

				$seen_old[$old] = $line;

				if (utf8_strlen($old) < 1 || utf8_strlen($old) > 255) {
					$this->log->write('Redirect CSV import: skipped line ' . $line . ' because old value is invalid');
					continue;
				}

				if ($status !== 301 && $status !== 302 && $status !== 410) {
					$this->log->write('Redirect CSV import: skipped line ' . $line . ' because status ' . $status . ' is invalid');
					continue;
				}

				if ($status !== 410 && (utf8_strlen($new) < 1 || utf8_strlen($new) > 255)) {
					$this->log->write('Redirect CSV import: skipped line ' . $line . ' because new value is invalid for status ' . $status);
					continue;
				}

				if ($status === 410) {
					$new = '';
				}

				$redirect_data = array(
					'old' => $old,
					'new' => $new,
					'status' => $status
				);

				$existing_old_id = $this->model_design_redirect->checkOldUniqueness($old);

				if ($redirect_id > 0) {
					$redirect_info = $this->model_design_redirect->getRedirect($redirect_id);

					if (!$redirect_info) {
						$this->log->write('Redirect CSV import: skipped line ' . $line . ' because redirect_id ' . $redirect_id . ' was not found');
						continue;
					}

					if ($existing_old_id && $existing_old_id !== $redirect_id) {
						$this->log->write('Redirect CSV import: skipped line ' . $line . ' because old value is already used by redirect_id ' . $existing_old_id);
						continue;
					}

					$this->model_design_redirect->editRedirect($redirect_id, $redirect_data);
					$updated++;
				} else {
					if ($existing_old_id) {
						$this->model_design_redirect->editRedirect($existing_old_id, $redirect_data);
						$updated++;
					} else {
						$this->model_design_redirect->addRedirect($redirect_data);
						$added++;
					}
				}
			}

			fclose($handle);

			$this->session->data['success'] = sprintf($this->language->get('text_upload_success'), $total, $added, $updated);
			$this->response->redirect($this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true));
		} else {
			$this->session->data['error_warning'] = $this->language->get('error_upload');
			$this->response->redirect($this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}
	}

	protected function getForm() {
		$data['text_form'] = !isset($this->request->get['redirect_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['old'])) {
			$data['error_old'] = $this->error['old'];
		} else {
			$data['error_old'] = '';
		}

		if (isset($this->error['new'])) {
			$data['error_new'] = $this->error['new'];
		} else {
			$data['error_new'] = '';
		}

		if (isset($this->error['status'])) {
			$data['error_status'] = $this->error['status'];
		} else {
			$data['error_status'] = '';
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
			'href' => $this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		if (!isset($this->request->get['redirect_id'])) {
			$data['action'] = $this->url->link('design/redirect/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('design/redirect/edit', 'user_token=' . $this->session->data['user_token'] . '&redirect_id=' . $this->request->get['redirect_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('design/redirect', 'user_token=' . $this->session->data['user_token'] . $url, true);

		if (isset($this->request->get['redirect_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$redirect_info = $this->model_design_redirect->getRedirect($this->request->get['redirect_id']);
		}

		if (isset($this->request->post['old'])) {
			$data['old'] = $this->request->post['old'];
		} elseif (!empty($redirect_info)) {
			$data['old'] = $redirect_info['old'];
		} else {
			$data['old'] = '';
		}

		if (isset($this->request->post['new'])) {
			$data['new'] = $this->request->post['new'];
		} elseif (!empty($redirect_info)) {
			$data['new'] = $redirect_info['new'];
		} else {
			$data['new'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = (int)$this->request->post['status'];
		} elseif (!empty($redirect_info)) {
			$data['status'] = (int)$redirect_info['status'];
		} else {
			$data['status'] = 301;
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('design/redirect_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'design/redirect')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$old = isset($this->request->post['old']) ? trim($this->request->post['old']) : '';
		$new = isset($this->request->post['new']) ? trim($this->request->post['new']) : '';
		$status = isset($this->request->post['status']) ? (int)$this->request->post['status'] : 0;

		if (utf8_strlen($old) < 1 || utf8_strlen($old) > 255) {
			$this->error['old'] = $this->language->get('error_old');
		}

		if ($status !== 301 && $status !== 302 && $status !== 410) {
			$this->error['status'] = $this->language->get('error_status');
		}

		if ($status !== 410 && (utf8_strlen($new) < 1 || utf8_strlen($new) > 255)) {
			$this->error['new'] = $this->language->get('error_new');
		}

		$sql = "SELECT redirect_id FROM `" . DB_PREFIX . "redirect` WHERE `old` = '" . $this->db->escape($old) . "'";

		if (isset($this->request->get['redirect_id'])) {
			$sql .= " AND redirect_id <> '" . (int)$this->request->get['redirect_id'] . "'";
		}

		$query = $this->db->query($sql);

		if ($query->num_rows) {
			$this->error['old'] = $this->language->get('error_exists');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'design/redirect')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
