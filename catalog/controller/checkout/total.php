<?php
class ControllerCheckoutTotal extends Controller {
  public function index() {
    // Totals
    $this->load->language('checkout/checkout');
    $this->load->model('setting/extension');

    $totals = array();
    $taxes = $this->cart->getTaxes();
    $total = 0;

    // Because __call can not keep var references so we put them into an array.
    $total_data = array(
      'totals' => &$totals,
      'taxes'  => &$taxes,
      'total'  => &$total
    );

    // Display prices
    if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
      $sort_order = array();

      $results = $this->model_setting_extension->getExtensions('total');

      foreach ($results as $key => $value) {
        $sort_order[$key] = $this->config->get('total_' . $value['code'] . '_sort_order');
      }

      array_multisort($sort_order, SORT_ASC, $results);

      foreach ($results as $result) {
        if ($this->config->get('total_' . $result['code'] . '_status')) {
          $this->load->model('extension/total/' . $result['code']);

          // We have to put the totals in an array so that they pass by reference.
          $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
        }
      }

      $sort_order = array();

      foreach ($totals as $key => $value) {
        $sort_order[$key] = $value['sort_order'];
      }

      array_multisort($sort_order, SORT_ASC, $totals);
    }

    if ($this->config->get('config_cart_weight')) {
      $data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
    } else {
      $data['weight'] = '';
    }

    $data['cart'] = $this->url->link('checkout/cart', '', true);

    $data['totals'] = array();

    foreach ($totals as $total) {
      $data['totals'][] = array(
        'title' => $total['title'],
        'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
      );
    }

    if(!isset($this->request->get['ajax']))  {
      return $this->load->view('checkout/total', $data);
    } else {
      $this->response->setOutput($this->load->view('checkout/total', $data));
    }


  }
}

?>
