<?php
class ModelExtensionShippingFlat extends Model {
  function getQuote($address) {
    $this->load->language('extension/shipping/flat');

    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('shipping_flat_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

    if (!$this->config->get('shipping_flat_geo_zone_id')) {
      $status = true;
    } elseif ($query->num_rows) {
      $status = true;
    } else {
      $status = false;
    }

    $method_data = array();

    if ($status) {
      $quote_data = array();

      $quote_data['flat'] = array(
        'code'         => 'flat.flat',
        'title'        => $this->language->get('text_title'),
        'description'  => sprintf($this->language->get('text_description'), $this->currency->format($this->tax->calculate($this->config->get('shipping_flat_free'), $this->config->get('shipping_flat_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])),
        'cost'         => $this->cart->getSubTotal() < $this->config->get('shipping_flat_free') ? $this->config->get('shipping_flat_cost') : 0,
        'tax_class_id' => $this->config->get('shipping_flat_tax_class_id'),
        'text'         => $this->cart->getSubTotal() < $this->config->get('shipping_flat_free') ? $this->currency->format($this->tax->calculate($this->config->get('shipping_flat_cost'), $this->config->get('shipping_flat_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency']) : $this->currency->format($this->tax->calculate(0, $this->config->get('shipping_flat_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])
      );

      $method_data = array(
        'code'       => 'flat',
        'title'      => $this->language->get('text_title'),
        'quote'      => $quote_data,
        'sort_order' => $this->config->get('shipping_flat_sort_order'),
        'error'      => false
      );
    }

    return $method_data;
  }
}
