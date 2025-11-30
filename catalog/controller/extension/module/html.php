<?php
class ControllerExtensionModuleHTML extends Controller {
  public function index($setting) {

    $template_folder = $this->config->get('theme_default_directory');

    if ($setting['include_swiper']) {
      $this->document->addStyle('catalog/view/theme/' . $template_folder . '/css/swiper.min.css');
      $this->document->addScript('catalog/view/theme/' . $template_folder . '/js/swiper.min.js');
    }

    if ($setting['include_fancybox']) {
      $this->document->addStyle('catalog/view/theme/' . $template_folder . '/css/fancybox.min.css');
      $this->document->addScript('catalog/view/theme/' . $template_folder . '/js/fancybox.min.js');
    }

    if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
      $data['html'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

      return $this->load->view('extension/module/html', $data);
    }
  }
}
