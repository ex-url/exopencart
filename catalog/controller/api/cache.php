<?php
class ControllerApiCache extends Controller {
  public function warmer() {
    $this->load->language('api/cache');

    $json = array();

    if (!$this->config->get('config_cache_warmer')) {
      $json['error'] = 'Cache warmer is disabled';
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode($json));
      return;
    }

    $config_key = $this->config->get('config_cache_warmer_key');
    $request_key = isset($this->request->get['key']) ? $this->request->get['key'] : '';

    if (empty($config_key) || $config_key !== $request_key) {
      $json['error'] = 'Invalid key';
      $this->response->addHeader('Content-Type: application/json');
      $this->response->setOutput(json_encode($json));
      return;
    }

    $this->load->model('catalog/product');

    $query = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "product WHERE status = '1'");

    $total_products = count($query->rows);
    $cached_count = 0;
    $start_time = microtime(true);

    foreach ($query->rows as $row) {
      $product_id = (int)$row['product_id'];

      if ($this->config->get('config_cache_product')) {
        $this->model_catalog_product->getProduct($product_id, true);
        $cached_count++;
      }

      if ($this->config->get('config_cache_product_attribute')) {
        $this->model_catalog_product->getProductAttributes($product_id, true);
      }

      if ($this->config->get('config_cache_product_option')) {
        $this->model_catalog_product->getProductOptions($product_id, true);
      }

      usleep(5000);
    }

    $end_time = microtime(true);
    $execution_time = round($end_time - $start_time, 2);

    $json['success'] = 'Cache warming completed';
    $json['total_products'] = $total_products;
    $json['cached_products'] = $cached_count;
    $json['execution_time'] = $execution_time . ' seconds';

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }
}
