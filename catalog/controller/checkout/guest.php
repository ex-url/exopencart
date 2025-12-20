<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCheckoutGuest extends Controller {
  public function index() {
    $this->load->language('checkout/checkout');

    $data['customer_groups'] = array();
    $data['checkout_guest'] = $this->config->get('config_checkout_guest');

    if (isset($this->session->data['guest'])) {
      if (isset($this->session->data['guest']['agree'])) {
        $data['agree'] = $this->session->data['guest']['agree'];
      } else {
        $data['agree'] = '';
      }
      if (isset($this->session->data['guest']['firstname'])) {
        $data['firstname'] = $this->session->data['guest']['firstname'];
      } else {
        $data['firstname'] = '';
      }
      if (isset($this->session->data['guest']['lastname'])) {
        $data['lastname'] = $this->session->data['guest']['lastname'];
      } else {
        $data['lastname'] = '';
      }
      if (isset($this->session->data['guest']['telephone'])) {
        $data['telephone'] = $this->session->data['guest']['telephone'];
      } else {
        $data['telephone'] = '';
      }
      if (isset($this->session->data['guest']['email'])) {
        $data['email'] = $this->session->data['guest']['email'];
      } else {
        $data['email'] = '';
      }
    }

    if (is_array($this->config->get('config_customer_group_display'))) {
      $this->load->model('account/customer_group');

      $customer_groups = $this->model_account_customer_group->getCustomerGroups();

      foreach ($customer_groups as $customer_group) {
        if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
          $data['customer_groups'][] = $customer_group;
        }
      }
    }

    if (isset($this->session->data['guest']['customer_group_id'])) {
      $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
    } else {
      $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'] = $this->config->get('config_customer_group_id');
    }

    // Custom Fields
    $this->load->model('account/custom_field');

    $data['custom_fields'] = [];

    $custom_fields = $this->model_account_custom_field->getCustomFields();

    foreach ($custom_fields as $custom_field) {
      if ($custom_field['location'] == 'account') {
        $data['custom_fields'][] = $custom_field;
      }
    }

    if (isset($this->session->data['guest']['custom_field'])) {
      if (isset($this->session->data['guest']['custom_field'])) {
        $guest_custom_field = $this->session->data['guest']['custom_field'];
      } else {
        $guest_custom_field = array();
      }

      //$data['guest_custom_field'] = $guest_custom_field + $address_custom_field;
      $data['guest_custom_field'] = $guest_custom_field;
    } else {
      $data['guest_custom_field'] = array();
    }

    // Captcha
    if ($this->config->get('captcha_' . $this->config->get('config_captcha') . '_status') && in_array('guest', (array)$this->config->get('config_captcha_page'))) {
      $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
    } else {
      $data['captcha'] = '';
    }

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

    return $this->load->view('checkout/guest', $data);
  }

  public function save() {
    $this->load->language('checkout/checkout');
    $this->load->model('account/customer');

    $json = array();

    //Validate if customer is logged in.
    if ($this->customer->isLogged()) {
      $json['redirect'] = $this->url->link('checkout/checkout', '', true);
    }

    // Validate cart has products and has stock.
    if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
      $json['redirect'] = $this->url->link('checkout/cart');
    }

    // Check if guest checkout is available.
    if (!$this->config->get('config_checkout_guest') || $this->config->get('config_customer_price') || $this->cart->hasDownload()) {
      $json['redirect'] = $this->url->link('checkout/checkout', '', true);
    }

    if (!$json) {

      if ($this->config->get('config_account_id') && isset($this->request->post['agree']) && $this->request->post['agree'] == 1) {
        $this->session->data['guest']['agree'] = 1;
      } else {
        unset($this->session->data['guest']['agree']);
        $json['error']['agree'] = $this->language->get('error_agree');
      }

      if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
        $json['error']['firstname'] = $this->language->get('error_firstname');
      } else {
        $this->session->data['guest']['firstname'] = trim($this->request->post['firstname']);
      }

      if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
        $json['error']['lastname'] = $this->language->get('error_lastname');
      } else {
        $this->session->data['guest']['lastname'] = trim($this->request->post['lastname']);
      }

      if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
        $json['error']['email'] = $this->language->get('error_email');
      } else {
        $this->session->data['guest']['email'] = trim($this->request->post['email']);
      }

      if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
        $json['error']['email'] = $this->language->get('error_exists');
      }

      if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
        $json['error']['telephone'] = $this->language->get('error_telephone');
      } else {
        $this->session->data['guest']['telephone'] = trim($this->request->post['telephone']);
      }
      // Customer Group
      if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
        $customer_group_id = $this->request->post['customer_group_id'];
      } else {
        $customer_group_id = $this->config->get('config_customer_group_id');
      }

      // Custom field validation
      $this->load->model('account/custom_field');

      $custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

      foreach ($custom_fields as $custom_field) {
        if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
          $json['error']['custom-field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
        } elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
          $json['error']['custom-field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
        }
      }

      // Captcha
      if ($this->config->get('captcha_' . $this->config->get('config_captcha') . '_status') && in_array('guest', (array)$this->config->get('config_captcha_page'))) {
        $captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

        if ($captcha) {
          $json['error']['captcha'] = $captcha;
        }
      }
    }

    if (!$json) {
      $this->session->data['account'] = 'guest';
      $this->session->data['guest']['customer_group_id'] = $customer_group_id;

      if (isset($this->request->post['custom_field']['account'])) {
        $this->session->data['guest']['custom_field'] = $this->request->post['custom_field']['account'];
      } else {
        $this->session->data['guest']['custom_field'] = array();
      }

      $json['done'] = true;
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }

  public function catch() {
    $this->load->language('checkout/checkout');
    $this->load->model('account/customer');

    $json = array();

    if ($this->config->get('config_account_id') && isset($this->request->post['agree']) && $this->request->post['agree'] == 1) {
      $this->session->data['guest']['agree'] = 1;
    } else {
      unset($this->session->data['guest']['agree']);
      $json['error']['agree'] = $this->language->get('error_agree');
    }

    if ((utf8_strlen(trim($this->request->post['firstname'])) > 0)) {
      $this->session->data['guest']['firstname'] = trim($this->request->post['firstname']);
    } else {
      $json['error']['firstname'] = $this->language->get('error_firstname');
    }

    if ((utf8_strlen(trim($this->request->post['lastname'])) > 0)) {
      $this->session->data['guest']['lastname'] = trim($this->request->post['lastname']);
    } else {
      $json['error']['lastname'] = $this->language->get('error_lastname');
    }

    if ((utf8_strlen($this->request->post['email']) > 96) || filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
      $this->session->data['guest']['email'] = trim($this->request->post['email']);
    } else {
      $json['error']['email'] = $this->language->get('error_email');
    }

    if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
      $json['error']['email'] = $this->language->get('error_exists');
    }

    if ((utf8_strlen($this->request->post['telephone']) > 5) && (utf8_strlen($this->request->post['telephone']) < 32)) {
      $this->session->data['guest']['telephone'] = trim($this->request->post['telephone']);
    } else {
      $json['error']['telephone'] = $this->language->get('error_telephone');
    }

    if (isset($this->request->post['register'])) {
      if ((utf8_strlen(html_entity_decode($this->request->post['password'], ENT_QUOTES, 'UTF-8')) < 4) || (utf8_strlen(html_entity_decode($this->request->post['password'], ENT_QUOTES, 'UTF-8')) > 40)) {
        $json['error']['password'] = $this->language->get('error_password');
      }

      if ($this->request->post['confirm_password'] != $this->request->post['password']) {
        $json['error']['confirm_password'] = $this->language->get('error_confirm');
      }
    }

    // Customer Group
    if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
      $customer_group_id = $this->request->post['customer_group_id'];
    } else {
      $customer_group_id = $this->config->get('config_customer_group_id');
    }

    // Custom field validation
    $this->load->model('account/custom_field');

    $custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

    foreach ($custom_fields as $custom_field) {
      if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
        $json['error']['custom_field_' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
      } elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
        $json['error']['custom_field_' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
      }
    }

    // Captcha
    if ($this->config->get('captcha_' . $this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
      $captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

      if ($captcha) {
        $json['error']['captcha'] = $captcha;
      }
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }
}
