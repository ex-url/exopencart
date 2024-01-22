<?php
class ControllerExtensionModulePrivacy extends Controller {
	public function index() {
		 $data['content'] = $this->config->get('module_privacy_content');

     $data['language_id'] = $this->config->get('config_language_id');

     $this->load->model('catalog/information');

     $information_info = $this->model_catalog_information->getInformation($this->config->get('module_privacy_information'));

     if ($information_info) {
       $data['title'] = $information_info['title'];
       $data['url'] = $this->url->link('information/information', 'information_id=' . $this->config->get('module_privacy_information'), true);
     }

		return $this->load->view('extension/module/privacy', $data);
	}
}
