<?php
class ControllerCommonGuard extends Controller {
  public function index() {
    $data['error_captcha'] = '';

    if ($this->request->server['REQUEST_METHOD'] == 'POST') {
      $error = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

      if (!$error) {
        $this->session->data['captcha_passed'] = true;
        $this->response->redirect($this->url->link('common/home'));
      }

      $data['error_captcha'] = $error;
    }

    $this->load->language('common/guard');
    $this->load->model('tool/image');

    $template_folder = $this->config->get('theme_default_directory');

    $this->document->addScript('catalog/view/theme/' . $template_folder . '/js/excaptcha.js');    
    $this->document->addStyle('catalog/view/theme/' . $template_folder . '/css/ui.min.css');
    $this->document->addStyle('catalog/view/theme/' . $template_folder . '/css/excaptcha.css');

    $data['styles'] = $this->document->getStyles();
    $data['scripts'] = $this->document->getScripts('header');

    if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
      $data['favicon'] = $this->model_tool_image->resize($this->config->get('config_icon'), 256, 256);
    }

    $data['title'] = $this->language->get('heading_title');

    if ($this->config->get('captcha_' . $this->config->get('config_captcha') . '_status')) {
      $data['action']  = $this->url->link('common/guard', '', true);
      $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
    } else {
      $data['captcha'] = '';
    }

    $this->response->setOutput($this->load->view('common/guard', $data));
  }
}
