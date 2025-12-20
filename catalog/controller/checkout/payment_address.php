<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCheckoutPaymentAddress extends Controller {
  public function index() {
    $this->load->language('checkout/checkout');

    if (isset($this->session->data['payment_address']['address_id'])) {
      $data['address_id'] = $this->session->data['payment_address']['address_id'];
    } else {
      $data['address_id'] = $this->customer->getAddressId();
    }

    $this->load->model('account/address');

    $data['addresses'] = $this->model_account_address->getAddresses();

    if (isset($this->session->data['payment_address']['firstname']) || isset($this->session->data['guest']['firstname'])) {
      $data['firstname'] = isset($this->session->data['payment_address']['firstname']) ? $this->session->data['payment_address']['firstname'] : $this->session->data['guest']['firstname'];
    } elseif ($this->customer->isLogged()) {
      $data['firstname'] = $this->customer->getFirstName();
    } else {
      $data['firstname'] = '';
    }

    if (isset($this->session->data['payment_address']['lastname']) || isset($this->session->data['guest']['lastname'])) {
      $data['lastname'] = isset($this->session->data['payment_address']['lastname']) ? $this->session->data['payment_address']['lastname'] : $this->session->data['guest']['lastname'];
    } elseif ($this->customer->isLogged()) {
      $data['lastname'] = $this->customer->getLastName();
    } else {
      $data['lastname'] = '';
    }

    if (isset($this->session->data['payment_address']['country_id'])) {
      $data['country_id'] = $this->session->data['payment_address']['country_id'];
    } else {
      $data['country_id'] = $this->config->get('config_country_id');
    }

    if (isset($this->session->data['payment_address']['zone_id'])) {
      $data['zone_id'] = $this->session->data['payment_address']['zone_id'];
    } else {
      $data['zone_id'] = '';
    }

    if (isset($this->session->data['payment_address']['postcode'])) {
      $data['postcode'] = $this->session->data['payment_address']['postcode'];
    } else {
      $data['postcode'] = '';
    }

    if (isset($this->session->data['payment_address']['city'])) {
      $data['city'] = $this->session->data['payment_address']['city'];
    } else {
      $data['city'] = $this->config->get('config_city');
    }

    if (isset($this->session->data['payment_address']['address_1'])) {
      $data['address_1'] = $this->session->data['payment_address']['address_1'];
    } else {
      $data['address_1'] = '';
    }

    if (isset($this->session->data['payment_address']['address_2'])) {
      $data['address_2'] = $this->session->data['payment_address']['address_2'];
    } else {
      $data['address_2'] = '';
    }

    if (isset($this->session->data['payment_address']['company'])) {
      $data['company'] = $this->session->data['payment_address']['company'];
    } else {
      $data['company'] = '';
    }

    if (isset($this->session->data['billing_for_shipping']) && $this->session->data['billing_for_shipping']) {
      $data['billing_for_shipping'] = 1;
    } else {
      $data['billing_for_shipping'] = 0;
    }

    $this->load->model('localisation/country');

    $data['countries'] = $this->model_localisation_country->getCountries();

    // Custom Fields
    $data['custom_fields'] = array();

    $this->load->model('account/custom_field');

    $custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

    foreach ($custom_fields as $custom_field) {
      if ($custom_field['location'] == 'address') {
        $data['custom_fields'][] = $custom_field;
      }
    }

    if (isset($this->session->data['payment_address']['custom_field'])) {
      $data['payment_address_custom_field'] = $this->session->data['payment_address']['custom_field'];
    } else {
      $data['payment_address_custom_field'] = array();
    }

    $output = $this->load->view('checkout/payment_address', $data);

    if (isset($this->request->get['ajax'])) {
      $this->response->setOutput($output);
    } else {
      return $output;
    }
  }

  public function save() {
    $this->load->language('checkout/checkout');

    $json = array();

    // Validate cart has products and has stock.
    if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
      $json['redirect'] = $this->url->link('checkout/cart');
    }

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
        $json['redirect'] = $this->url->link('checkout/cart');

        break;
      }
    }

    if ($this->customer->isLogged()) {

      $this->load->model('account/address');

      if (isset($this->request->post['payment_address']) && $this->request->post['payment_address'] == 'existing') {
        if (empty($this->request->post['address_id'])) {
          $json['error']['warning'] = $this->language->get('error_address');
        } elseif (!in_array($this->request->post['address_id'], array_keys($this->model_account_address->getAddresses()))) {
          $json['error']['warning'] = $this->language->get('error_address');
        }

        if (!$json) {
          $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->request->post['address_id']);
          $json['done'] = true;
        }
      } else {

        $this->load->model('localisation/country');
        $this->load->model('localisation/zone');

        $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
        $zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

        if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 128)) {
          $json['error']['firstname'] = $this->language->get('error_firstname');
        } else {
          $this->session->data['payment_address']['firstname'] = trim($this->request->post['firstname']);
        }

        if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 128)) {
          $json['error']['lastname'] = $this->language->get('error_lastname');
        } else {
          $this->session->data['payment_address']['lastname'] = trim($this->request->post['lastname']);
        }

        if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
          $json['error']['address_1'] = $this->language->get('error_address_1');
        } else {
          $this->session->data['payment_address']['address_1'] = trim($this->request->post['address_1']);
        }

        if ((utf8_strlen(trim($this->request->post['address_2'])) < 1) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
          $json['error']['address_2'] = $this->language->get('error_address_2');
        } else {
          $this->session->data['payment_address']['address_2'] = trim($this->request->post['address_2']);
        }

        if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
          $json['error']['city'] = $this->language->get('error_city');
        } else {
          $this->session->data['payment_address']['city'] = trim($this->request->post['city']);
        }

        if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
          $json['error']['postcode'] = $this->language->get('error_postcode');
        } else {
          $this->session->data['payment_address']['postcode'] = trim($this->request->post['postcode']);
        }

        if ($this->request->post['country_id'] == '') {
          $json['error']['country'] = $this->language->get('error_country');
        } else {
          $this->session->data['payment_address']['country_id'] = trim($this->request->post['country_id']);
          $this->session->data['payment_address']['country'] = $country_info['name'];
          $this->session->data['payment_address']['address_format'] = $country_info['address_format'];
        }

        if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
          $json['error']['zone_id'] = $this->language->get('error_zone');
        } else {
          $this->session->data['payment_address']['zone_id'] = trim($this->request->post['zone_id']);
          $this->session->data['payment_address']['zone'] = $zone_info['name'];
        }

        if (isset($this->request->post['company']) && $this->request->post['company'] != '') {
          $this->session->data['payment_address']['company'] = trim($this->request->post['company']);
        } else {
          $this->session->data['payment_address']['company'] = '';
        }

        // Custom field validation
        $this->load->model('account/custom_field');

        $custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

        foreach ($custom_fields as $custom_field) {
          if ($custom_field['location'] == 'address') {
            if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
              $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
            } elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
              $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
            }
          }
        }

        if (!$json) {
          $existing_address = $this->model_account_address->getAddressByData(
            $this->customer->getId(),
            $this->request->post
          );

          if ($existing_address) {
            $this->session->data['payment_address'] = $existing_address;
            $json['existed'] = true;
          } else {
            $address_id = $this->model_account_address->addAddress(
              $this->customer->getId(),
              $this->request->post
            );

            $this->session->data['payment_address'] = $this->model_account_address->getAddress($address_id);
            $json['added'] = true;

            if (!$this->customer->getAddressId()) {
              $this->load->model('account/customer');
              $this->model_account_customer->editAddressId($this->customer->getId(), $address_id);
            }
          }

          $json['done'] = true;
        }
      }
    } else {

      // customer is not logged
      if (isset($this->request->post['company']) && $this->request->post['company'] != '') {
        $this->session->data['payment_address']['company'] = trim($this->request->post['company']);
      } else {
        $this->session->data['payment_address']['company'] = '';
      }

      if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 128)) {
        $json['error']['firstname'] = $this->language->get('error_firstname');
      } else {
        $this->session->data['payment_address']['firstname'] = trim($this->request->post['firstname']);
      }

      if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 128)) {
        $json['error']['lastname'] = $this->language->get('error_lastname');
      } else {
        $this->session->data['payment_address']['lastname'] = trim($this->request->post['lastname']);
      }

      if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
        $json['error']['address_1'] = $this->language->get('error_address_1');
      } else {
        $this->session->data['payment_address']['address_1'] = trim($this->request->post['address_1']);
      }

      if ((utf8_strlen(trim($this->request->post['address_2'])) < 1) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
        $json['error']['address_2'] = $this->language->get('error_address_2');
      } else {
        $this->session->data['payment_address']['address_2'] = trim($this->request->post['address_2']);
      }

      if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
        $json['error']['city'] = $this->language->get('error_city');
      } else {
        $this->session->data['payment_address']['city'] = trim($this->request->post['city']);
      }

      $this->load->model('localisation/country');
      $this->load->model('localisation/zone');

      $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
      $zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

      if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
        $json['error']['postcode'] = $this->language->get('error_postcode');
      } else {
        $this->session->data['payment_address']['postcode'] = trim($this->request->post['postcode']);
      }

      if ($this->request->post['country_id'] == '') {
        $json['error']['country'] = $this->language->get('error_country');
      } else {
        $this->session->data['payment_address']['country_id'] = trim($this->request->post['country_id']);
        $this->session->data['payment_address']['country'] = $country_info['name'];
        $this->session->data['payment_address']['address_format'] = $country_info['address_format'];
      }

      if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
        $json['error']['zone_id'] = $this->language->get('error_zone');
      } else {
        $this->session->data['payment_address']['zone_id'] = trim($this->request->post['zone_id']);
        $this->session->data['payment_address']['zone'] = $zone_info['name'];
      }

      // Custom field validation
      $this->load->model('account/custom_field');

      $custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

      foreach ($custom_fields as $custom_field) {
        if ($custom_field['location'] == 'address') {
          if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
            $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
          } elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
            $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
          }
        }
      }

      if (isset($this->request->post['billing_for_shipping']) && $this->request->post['billing_for_shipping']) {
        $this->session->data['billing_for_shipping'] = true;
        $this->session->data['payment_address']['address_id'] = 0;
        $this->session->data['shipping_address'] = $this->session->data['payment_address'];
      } else {
        $this->session->data['billing_for_shipping'] = false;
      }

      if (!$json) {
        $json['done'] = true;
      }
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }
}
