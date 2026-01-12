<?php
class ControllerExtensionFeedSitemap extends Controller {
  private $error = array();

  public function index() {
    $this->load->language('extension/feed/sitemap');

    $this->document->setTitle($this->language->get('heading_title'));

    $this->load->model('setting/setting');

    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
      $this->model_setting_setting->editSetting('feed_sitemap', $this->request->post);

      $this->session->data['success'] = $this->language->get('text_success');

      if (isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
        $this->response->redirect($this->url->link('extension/feed/sitemap', 'user_token=' . $this->session->data['user_token'], true));
      } else {
        $this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=feed', true));
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
      'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=feed', true)
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('heading_title'),
      'href' => $this->url->link('extension/feed/sitemap', 'user_token=' . $this->session->data['user_token'], true)
    );

    $data['action'] = $this->url->link('extension/feed/sitemap', 'user_token=' . $this->session->data['user_token'], true);

    $data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=feed', true);

    if (isset($this->request->post['feed_sitemap_status'])) {
      $data['feed_sitemap_status'] = $this->request->post['feed_sitemap_status'];
    } else {
      $data['feed_sitemap_status'] = $this->config->get('feed_sitemap_status');
    }

    if (isset($this->request->post['feed_sitemap_cron_token'])) {
      $data['feed_sitemap_cron_token'] = $this->request->post['feed_sitemap_cron_token'];
    } elseif ($this->config->get('feed_sitemap_cron_token')) {
      $data['feed_sitemap_cron_token'] = $this->config->get('feed_sitemap_cron_token');
    } else {
      $data['feed_sitemap_cron_token'] = token(32);
    }

    $data['feed_url'] = HTTP_CATALOG . 'index.php?route=extension/feed/sitemap';
    $data['cron_url'] = HTTP_CATALOG . 'index.php?route=extension/feed/sitemap/generate&token=' . $data['feed_sitemap_cron_token'];
    $data['help_feed_url'] = sprintf($this->language->get('help_feed_url'), HTTP_CATALOG);

    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');

    $this->response->setOutput($this->load->view('extension/feed/sitemap', $data));
  }

  protected function validate() {
    if (!$this->user->hasPermission('modify', 'extension/feed/sitemap')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }

    return !$this->error;
  }
}
