<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCheckoutCheckout extends Controller {
  public function index() {

    $template_folder = $this->config->get('theme_default_directory');
    $this->document->addStyle('catalog/view/theme/' . $template_folder . '/css/checkout.css');

    // Validate cart has products and has stock.
    if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
      $this->response->redirect($this->url->link('checkout/cart'));
    }

    //unset($this->session->data['guest']);

    $this->load->model('tool/image');
    $this->load->model('tool/upload');

    // Validate minimum quantity requirements.
    $products = $this->cart->getProducts();

    foreach ($products as $product) {
      $product_total = 0;

      foreach ($products as $product_2) {
        if ($product_2['product_id'] == $product['product_id']) {
          $product_total += $product_2['quantity'];
        }
      }

      if ($product['minimum'] > $product_total) {
        $this->response->redirect($this->url->link('checkout/cart'));
      }
    }

    $this->load->language('checkout/checkout');

    $template_folder = $this->config->get('theme_default_directory');
    $this->document->addScript('catalog/view/theme/' . $template_folder . '/js/checkout.js');

    $this->document->setTitle($this->language->get('heading_title'));
    $this->document->setRobots('noindex,follow');

    // Required by klarna
    if ($this->config->get('payment_klarna_account') || $this->config->get('payment_klarna_invoice')) {
      $this->document->addScript('http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js');
    }

    $data['breadcrumbs'] = array();

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link('common/home')
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_cart'),
      'href' => $this->url->link('checkout/cart')
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('heading_title'),
      'href' => $this->url->link('checkout/checkout', '', true)
    );

    if (isset($this->session->data['error'])) {
      $data['error_warning'] = $this->session->data['error'];
      unset($this->session->data['error']);
    } else {
      $data['error_warning'] = '';
    }

    $data['logged'] = $this->customer->isLogged();
    $data['checkout_guest'] = $this->config->get('config_checkout_guest');
    $data['shipping_required'] = $this->cart->hasShipping();

    if ($data['logged']) {
      $data['customer'] = $this->customer->getFirstName() . ' ' . $this->customer->getLastName();
      $data['customer_email'] = $this->customer->getEmail();
      $data['customer_phone'] = $this->customer->getTelephone();
    }

    if (isset($this->session->data['account'])) {
      $data['account'] = $this->session->data['account'];
    } else {
      $data['account'] = '';
    }

    $this->load->model('localisation/country');
    $this->load->model('localisation/zone');

    $country_info = $this->model_localisation_country->getCountry($this->config->get('config_country_id'));
    $zone_info = $this->model_localisation_zone->getZone($this->config->get('config_zone_id'));

    // Set default payment and shipping address
    if (!isset($this->session->data['shipping_address'])) {
      if ($this->config->get('config_ask_payment_address')) {
        $data['billing_required'] = true;
        $data['payment_address'] = $this->load->controller('checkout/payment_address');

        $this->session->data['shipping_address'] = [
          'address_id' => 0,
          'country_id' => $this->config->get('config_country_id'),
          'zone_id'   => $this->config->get('config_zone_id'),
          'firstname' => isset($this->session->data['guest']['firstname']) ? $this->session->data['guest']['firstname'] : '',
          'lastname' => isset($this->session->data['guest']['lastname']) ? $this->session->data['guest']['lastname'] : '',
          'company' => '',
          'address_1' => '',
          'address_2' => '',
          'address_format' => $country_info['address_format'],
          'postcode' => '',
          'city' => '',
          'zone' => $zone_info['name'] ? $zone_info['name'] : '',
          'zone_code' => '',
          'country' => $country_info['name'] ? $country_info['name'] : '',
          'custom_field' => null,
        ];
      } else {
        $data['billing_required'] = false;

        $this->session->data['shipping_address'] = $this->session->data['payment_address'] = [
          'address_id' => 0,
          'country_id' => $this->config->get('config_country_id'),
          'zone_id'   => $this->config->get('config_zone_id'),
          'firstname' => isset($this->session->data['guest']['firstname']) ? $this->session->data['guest']['firstname'] : '',
          'lastname' => isset($this->session->data['guest']['lastname']) ? $this->session->data['guest']['lastname'] : '',
          'company' => '',
          'address_1' => '',
          'address_2' => '',
          'address_format' => $country_info['address_format'],
          'postcode' => '',
          'city' => '',
          'zone' => $zone_info['name'] ? $zone_info['name'] : '',
          'zone_code' => '',
          'country' => $country_info['name'] ? $country_info['name'] : '',
          'custom_field' => null,
        ];
      }
    } else {
      if ($this->config->get('config_ask_payment_address')) {
        $data['billing_required'] = true;
        $data['payment_address'] = $this->load->controller('checkout/payment_address');
      } else {
        $data['billing_required'] = false;
      }
    }

    if (isset($this->session->data['shipping_address']['zone_id'])) {
      $data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
    } else {
      $data['zone_id'] = $this->config->get('config_zone_id');
    }

    $data['guest'] = $this->load->controller('checkout/guest');
    $data['register'] = $this->load->controller('checkout/register');

    $data['payment_methods'] = $this->load->controller('checkout/payment_method');
    $data['shipping_address'] = $this->load->controller('checkout/shipping_address');
    $data['shipping_methods'] = $this->load->controller('checkout/shipping_method');

    $data['total'] = $this->load->controller('checkout/total');

    $data['continue'] = $this->url->link('common/home');

    $data['cart'] = $this->url->link('checkout/cart', '', true);
    $data['checkout'] = $this->url->link('checkout/checkout', '', true);

    $data['column_left'] = $this->load->controller('common/column_left');
    $data['column_right'] = $this->load->controller('common/column_right');
    $data['content_top'] = $this->load->controller('common/content_top');
    $data['content_bottom'] = $this->load->controller('common/content_bottom');
    $data['footer'] = $this->load->controller('common/footer');
    $data['header'] = $this->load->controller('common/header');

    $this->response->setOutput($this->load->view('checkout/checkout', $data));
  }

  public function country() {
    $json = array();

    $this->load->model('localisation/country');

    $country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

    if ($country_info) {
      $this->load->model('localisation/zone');

      $json = array(
        'country_id'        => $country_info['country_id'],
        'name'              => $country_info['name'],
        'iso_code_2'        => $country_info['iso_code_2'],
        'iso_code_3'        => $country_info['iso_code_3'],
        'address_format'    => $country_info['address_format'],
        'postcode_required' => $country_info['postcode_required'],
        'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
        'status'            => $country_info['status']
      );
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }

  public function customfield() {
    $json = array();

    $this->load->model('account/custom_field');

    // Customer Group
    if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
      $customer_group_id = $this->request->get['customer_group_id'];
    } else {
      $customer_group_id = $this->config->get('config_customer_group_id');
    }

    $custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

    foreach ($custom_fields as $custom_field) {
      $json[] = array(
        'custom_field_id' => $custom_field['custom_field_id'],
        'required'        => $custom_field['required']
      );
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }
}
