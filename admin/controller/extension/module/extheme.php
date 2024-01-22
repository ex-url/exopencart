<?php
class ControllerExtensionModuleExtheme extends Controller {
  private $error = array();

  public function index() {
    $this->load->language('extension/module/extheme');

    $this->document->setTitle($this->language->get('title'));

    $this->load->model('setting/setting');

    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

      $this->model_setting_setting->editSetting('module_extheme', $this->request->post);

      $this->session->data['success'] = $this->language->get('text_success');

      if (isset($this->request->post['apply']) && $this->request->post['apply'] == 1) {
        $this->response->redirect($this->url->link('extension/module/extheme', 'user_token=' . $this->session->data['user_token'], true));
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
      'href' => $this->url->link('extension/module/extheme', 'user_token=' . $this->session->data['user_token'], true)
    );

    $data['action'] = $this->url->link('extension/module/extheme', 'user_token=' . $this->session->data['user_token'], true);

    $data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);

    $data['directories'] = array();

		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);

		foreach ($directories as $directory) {
			$data['directories'][] = basename($directory);
		}

    if (isset($this->request->post['module_extheme_scss'])) {
      $data['module_extheme_scss'] = $this->request->post['module_extheme_scss'];
    } else {
      if ($this->config->get('module_extheme_changed')) {
        $data['module_extheme_scss'] = file_get_contents(HTTP_CATALOG . 'catalog/view/theme/' . $this->config->get('theme_default_directory') . '/bulma/dynamic.scss') ;
      } else {
        $data['module_extheme_scss'] = file_get_contents(HTTP_CATALOG . 'catalog/view/theme/' . $this->config->get('theme_default_directory') . '/bulma/default.scss') ;
      }
    }

    $data['user_token'] = $this->session->data['user_token'];

    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');

    $this->response->setOutput($this->load->view('extension/module/extheme', $data));
  }

  protected function validate() {
    if (!$this->user->hasPermission('modify', 'extension/module/extheme')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }

    return !$this->error;
  }

  public function generate() {

    $json = array();
    $template_folder = $this->request->post['module_extheme_directory'];
    $reset = (int)$this->request->post['reset'] == 1 ? true : false;

    if(!$reset && $this->request->post['module_extheme_scss']) {
      file_put_contents(DIR_CATALOG . 'view/theme/default/bulma/dynamic.scss', html_entity_decode($this->request->post['module_extheme_scss']));
    }

    unset($this->request->post['module_extheme_scss']);

    $file = !$reset ? DIR_CATALOG . 'view/theme/default/bulma/dynamic.scss' : DIR_CATALOG . 'view/theme/default/bulma/default.scss';

    $scss = new \ScssPhp\ScssPhp\Compiler();

    $filename = basename($file, '.scss');
    $ui = DIR_CATALOG . 'view/theme/' . $template_folder . '/css/ui.min.css';

    $scss->setImportPaths(DIR_CATALOG . 'view/theme/default/bulma');
    $scss->setFormatter('ScssPhp\ScssPhp\Formatter\Compressed');

    $output = $scss->compile('@import "' . $filename . '.scss"');

    $handle = fopen($ui, 'w');

    flock($handle, LOCK_EX);

    fwrite($handle, $output);

    fflush($handle);

    flock($handle, LOCK_UN);

    fclose($handle);

    $this->load->model('setting/setting');

    if($reset) {
      $this->request->post['module_extheme_changed'] = 0;
    } else {
      $this->request->post['module_extheme_changed'] = 1;
    }

    $this->model_setting_setting->editSetting('module_extheme', $this->request->post);

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }
}
