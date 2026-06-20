<?php
class ControllerInformationContact extends Controller {
  private $error = array();

  public function index() {
    $this->load->language('information/contact');

    $this->document->setTitle($this->language->get('heading_title'));
    $this->document->setDescription($this->language->get('text_meta_description'));
    $this->document->setOgUrl($this->url->link('information/contact', '', true));

    $data['breadcrumbs'] = array();

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link('common/home')
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('heading_title'),
      'href' => $this->url->link('information/contact')
    );

    $this->load->model('tool/image');

    if ($this->config->get('config_image')) {
      $data['image'] = $this->model_tool_image->resize($this->config->get('config_image'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_location_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_location_height'));
    } else {
      $data['image'] = false;
    }

    $data['store'] = $this->config->get('config_owner');
    $data['address'] = nl2br($this->config->get('config_address'));
    $data['geocode'] = $this->config->get('config_geocode');
    $data['geocode_hl'] = $this->config->get('config_language');
    $data['telephone'] = $this->config->get('config_show_telephone_contacts') ? $this->config->get('config_telephone') : '';
    $data['telephone_link'] = $this->config->get('config_show_telephone_contacts') ? normalizePhone($this->config->get('config_telephone')) : '';
    $data['email_address'] = $this->config->get('config_show_email_contacts') ? $this->config->get('config_email') : '';
    $data['social_media'] = $this->config->get('config_social_media');
    $data['fax'] = $this->config->get('config_fax');
    $data['fax_link'] = normalizePhone($this->config->get('config_fax'));
    $data['open'] = nl2br($this->config->get('config_open'));
    $data['comment'] = $this->config->get('config_comment');

    if($this->config->get('config_show_contact_form')) {
      $data['show_form'] = $this->config->get('config_show_contact_form');

      if ($this->config->get('config_account_id')) {
        $this->load->model('catalog/information');

        $information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

        if ($information_info) {
          $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), true), $information_info['title']);
        } else {
          $data['text_agree'] = '';
        }
      } else {
        $data['text_agree'] = '';
      }

      // Captcha
      if ($this->config->get('captcha_' . $this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
        $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
      } else {
        $data['captcha'] = '';
      }
    }    

    $data['locations'] = array();

    $this->load->model('localisation/location');

    foreach ((array)$this->config->get('config_location') as $location_id) {
      $location_info = $this->model_localisation_location->getLocation($location_id);

      if ($location_info) {
        if ($location_info['image']) {
          $image = $this->model_tool_image->resize($location_info['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_location_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_location_height'), 'crop');
        } else {
          $image = false;
        }

        $data['locations'][] = array(
          'location_id' => $location_info['location_id'],
          'name'        => $location_info['name'],
          'address'     => nl2br($location_info['address']),
          'geocode'     => $location_info['geocode'],
          'telephone'   => $location_info['telephone'],
          'telephone_link'   => normalizePhone($location_info['telephone']),
          'fax'         => $location_info['fax'],
          'fax_link'         => normalizePhone($location_info['fax']),
          'image'       => $image,
          'open'        => nl2br($location_info['open']),
          'comment'     => $location_info['comment']
        );
      }
    }

    if (isset($this->request->post['name'])) {
      $data['name'] = $this->request->post['name'];
    } else {
      $data['name'] = $this->customer->getFirstName();
    }

    if (isset($this->request->post['email'])) {
      $data['email'] = $this->request->post['email'];
    } else {
      $data['email'] = $this->customer->getEmail();
    }

    // Captcha
    if ($this->config->get('captcha_' . $this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
      $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
    } else {
      $data['captcha'] = '';
    }

    $data['column_left'] = $this->load->controller('common/column_left');
    $data['column_right'] = $this->load->controller('common/column_right');
    $data['content_top'] = $this->load->controller('common/content_top');
    $data['content_bottom'] = $this->load->controller('common/content_bottom');
    $data['footer'] = $this->load->controller('common/footer');
    $data['header'] = $this->load->controller('common/header');

    $this->response->setOutput($this->load->view('information/contact', $data));
  }

  public function sender() {
    $this->load->language('information/contact');
    $json = [];

    if ($this->config->get('config_show_contact_form') && $this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {

      $mail = new Mail($this->config->get('config_mail_engine'));
      $mail->parameter = $this->config->get('config_mail_parameter');
      $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
      $mail->smtp_username = $this->config->get('config_mail_smtp_username');
      $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
      $mail->smtp_port = $this->config->get('config_mail_smtp_port');
      $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

      $message['message'] = $this->request->post['message'];

      $mail->setTo($this->config->get('config_email'));
      $mail->setFrom(isset($this->request->post['email']) ? $this->request->post['email'] : $this->config->get('config_email'));
      $mail->setReplyTo(isset($this->request->post['email']) ? $this->request->post['email'] : $this->config->get('config_email'));
      $mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
      $mail->setSubject(html_entity_decode($this->config->get('config_name') . ' - ' . $this->language->get('text_subject'), ENT_QUOTES, 'UTF-8'));
      $mail->setHtml($this->load->view('mail/contacts', $message));

      if (!$json) {
        $this->load->model('tool/incoming');

        $incoming = array(
          'customer_id' => $this->customer->isLogged() ? $this->customer->getId() : 0,
          'type' => 'contacts',
          'name' => $this->request->post['name'],
          'email' => isset($this->request->post['email']) ? $this->request->post['email'] : '',
          'telephone' => isset($this->request->post['telephone']) ? $this->request->post['telephone'] : '',
          'message' => $this->request->post['message'],
          'ip' => $this->request->server['REMOTE_ADDR'],
          'page_url' => isset($this->request->server['HTTP_REFERER']) ? $this->request->server['HTTP_REFERER'] : ''
        );

        $this->model_tool_incoming->add($incoming);

        try {
          $mail->send();
          $json['success'] = $this->language->get('text_success');
        } catch (Exception $e) {
          $this->log->write('Mail send error in contacts form: ' . $e->getMessage());
          $json['error']['mail'] = $this->language->get('error_mail_send');
        }
      }

    } else {
      $json['error'] = $this->error;
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }

  protected function validate() {

    if (strlen($this->request->post['name']) <= 1) {
      $this->error['name'] = $this->language->get('error_name');
    }

    if (isset($this->request->post['email']) && (utf8_strlen($this->request->post['email']) > 96 || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL))) {
      $this->error['email'] = $this->language->get('error_email');
    }

    if (isset($this->request->post['phone']) && (utf8_strlen($this->request->post['phone']) < 10)) {
      $this->error['phone'] = $this->language->get('error_phone');
    }

    if (!isset($this->request->post['agree'])) {
      $this->error['agree'] = $this->language->get('error_agree');
    }

    if ($this->config->get('captcha_' . $this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
      $captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

      if ($captcha) {
        $this->error['captcha'] = $captcha;
      }
    }

    return !$this->error;
  }
}
