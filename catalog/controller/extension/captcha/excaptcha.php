<?php
class ControllerExtensionCaptchaExcaptcha extends Controller {
  private $challenge_ttl = 120;
  private $pass_ttl = 600;
  private $target_min = 30;
  private $target_max = 80;
  private $tolerance = 3.0;

  public function index($error = array()) {
    static $module = 0;

    $this->load->language('extension/captcha/excaptcha');

    $template_folder = $this->config->get('theme_default_directory');

    $this->document->addStyle('catalog/view/theme/' . $template_folder . '/css/excaptcha.css');
    $this->document->addScript('catalog/view/theme/' . $template_folder . '/js/excaptcha.js');

    if (isset($error['captcha'])) {
      $data['error_captcha'] = $error['captcha'];
    } else {
      $data['error_captcha'] = '';
    }

    $module++;

    $challenge = $this->createChallenge($module);

    $data['target'] = $challenge['target'];
    $data['challenge_id'] = $challenge['id'];
    $data['tolerance'] = $this->tolerance;

    $data['module'] = $module;

    $data['validate_url'] = $this->url->link('extension/captcha/excaptcha/ajaxValidate', '', true);
    $data['challenge_url'] = $this->url->link('extension/captcha/excaptcha/challenge', 'module=' . $module, true);
    $data['lang'] = json_encode(array(
      'drag'            => $this->language->get('text_drag'),
      'release'         => $this->language->get('text_release'),
      'checking'        => $this->language->get('text_checking'),
      'success'         => $this->language->get('text_success'),
      'fail'            => $this->language->get('text_fail_reload'),
      'challenge_new'   => $this->language->get('text_new_challenge'),
      'challenge_error' => $this->language->get('text_reload_error')
    ), JSON_UNESCAPED_UNICODE);

    return $this->load->view('extension/captcha/excaptcha', $data);
  }

  public function validate() {
    $this->load->language('extension/captcha/excaptcha');

    $token = '';

    if (isset($this->request->post['captcha'])) {
      $token = (string)$this->request->post['captcha'];
    }

    if (!$token) {
      return $this->language->get('error_captcha');
    }

    if (!preg_match('/^excaptcha:(\d+):([a-f0-9]{32})$/', $token, $matches)) {
      return $this->language->get('error_captcha');
    }

    $module = (int)$matches[1];
    $challenge_id = $matches[2];

    if (empty($this->session->data['excaptcha']['passed'][$module])) {
      return $this->language->get('error_captcha');
    }

    $passed = $this->session->data['excaptcha']['passed'][$module];

    if ($passed['id'] !== $challenge_id || $passed['expires_at'] < time()) {
      return $this->language->get('error_captcha');
    }

    //unset($this->session->data['excaptcha']['passed'][$module]);
  }

  public function ajaxValidate() {
    $this->load->language('extension/captcha/excaptcha');

    $json = array(
      'success' => false,
      'error'   => $this->language->get('error_captcha')
    );

    if ($this->request->server['REQUEST_METHOD'] !== 'POST') {
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode($json));
      return;
    }

    $module = isset($this->request->post['module']) ? (int)$this->request->post['module'] : 0;
    $challenge_id = isset($this->request->post['challenge_id']) ? (string)$this->request->post['challenge_id'] : '';
    $final_percent = isset($this->request->post['final_percent']) ? (float)$this->request->post['final_percent'] : -1;

    if (
      !$module ||
      !$challenge_id ||
      $final_percent < 0 ||
      empty($this->session->data['excaptcha']['challenges'][$module])
    ) {
      $json['reload'] = true;
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode($json));
      return;
    }

    $challenge =& $this->session->data['excaptcha']['challenges'][$module];

    if (!empty($challenge['used']) || $challenge['id'] !== $challenge_id || $challenge['expires_at'] < time()) {
      $challenge['used'] = true;
      $json['reload'] = true;
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode($json));
      return;
    }

    $challenge['used'] = true;

    $track_width = isset($this->request->post['track_width_px']) ? (float)$this->request->post['track_width_px'] : 0;
    $thumb_width = isset($this->request->post['thumb_width_px']) ? (float)$this->request->post['thumb_width_px'] : 0;
    $final_px = isset($this->request->post['final_px']) ? (float)$this->request->post['final_px'] : -1;

    if ($track_width > $thumb_width && $final_px >= 0) {
      $travel = $track_width - $thumb_width;
      $calculated_percent = ($final_px / $travel) * 100;

      if (abs($calculated_percent - $final_percent) > 2.0) {
        $json['reload'] = true;
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
        return;
      }
    }

    if (abs($final_percent - (float)$challenge['target']) <= (float)$challenge['tolerance']) {
      $this->session->data['excaptcha']['passed'][$module] = array(
        'id'         => $challenge_id,
        'expires_at' => time() + $this->pass_ttl
      );

      $json['success'] = true;
      $json['error'] = '';
      $json['token'] = 'excaptcha:' . $module . ':' . $challenge_id;
    } else {
      $json['reload'] = true;
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }

  public function challenge() {
    $this->load->language('extension/captcha/excaptcha');

    $module = 0;

    if (isset($this->request->get['module'])) {
      $module = (int)$this->request->get['module'];
    } elseif (isset($this->request->post['module'])) {
      $module = (int)$this->request->post['module'];
    }

    if (!$module) {
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode(array(
        'success' => false,
        'error'   => $this->language->get('text_reload_error')
      )));
      return;
    }

    $challenge = $this->createChallenge($module);

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode(array(
      'success'           => true,
      'challenge_id'      => $challenge['id'],
      'target_percent'    => $challenge['target'],
      'tolerance_percent' => $challenge['tolerance']
    )));
  }

  private function createChallenge($module) {
    if (!isset($this->session->data['excaptcha'])) {
      $this->session->data['excaptcha'] = array(
        'challenges' => array(),
        'passed'     => array()
      );
    }

    $challenge = array(
      'id'         => bin2hex(random_bytes(16)),
      'target'     => random_int($this->target_min, $this->target_max),
      'tolerance'  => $this->tolerance,
      'expires_at' => time() + $this->challenge_ttl,
      'used'       => false
    );

    $this->session->data['excaptcha']['challenges'][$module] = $challenge;

    if (isset($this->session->data['excaptcha']['passed'][$module])) {
      unset($this->session->data['excaptcha']['passed'][$module]);
    }

    return $challenge;
  }
}
