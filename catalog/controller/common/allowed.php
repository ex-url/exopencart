<?php
class ControllerCommonAllowed extends Controller {
  public function index() {

    $json = array();

    $json['types'] = explode("\r\n", $this->config->get('config_file_ext_allowed'));
    $json['mimes'] = explode("\r\n", $this->config->get('config_file_mime_allowed'));

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }
}
