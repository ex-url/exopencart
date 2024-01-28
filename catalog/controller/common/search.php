<?php
class ControllerCommonSearch extends Controller {
  public function index() {
    $this->load->language('common/search');

    $data['text_search'] = $this->language->get('text_search');

    if (isset($this->request->get['search'])) {
      $data['search'] = $this->request->get['search'];
    } else {
      $data['search'] = '';
    }

    return $this->load->view('common/search', $data);
  }

  public function live() {
    $this->load->language('product/search');

    $this->load->model('catalog/category');

    $this->load->model('catalog/product');

    $this->load->model('tool/image');

    if (isset($this->request->get['search'])) {
      $search = $this->request->get['search'];
    } else {
      $search = '';
    }

    if (isset($this->request->get['tag'])) {
      $tag = $this->request->get['tag'];
    } elseif (isset($this->request->get['search'])) {
      $tag = $this->request->get['search'];
    } else {
      $tag = '';
    }

    if (isset($this->request->get['description'])) {
      $description = $this->request->get['description'];
    } else {
      $description = '';
    }

    if (isset($this->request->get['sort'])) {
      $sort = $this->request->get['sort'];
    } else {
      $sort = 'p.price';
    }

    if (isset($this->request->get['order'])) {
      $order = $this->request->get['order'];
    } else {
      $order = 'DESC';
    }

    if (isset($this->request->get['page'])) {
      $page = (int)$this->request->get['page'];
    } else {
      $page = 1;
    }

    if (isset($this->request->get['limit'])) {
      $limit = (int)$this->request->get['limit'];
    } else {
      $limit = 5;
    }

    $url = '';

    $data['products'] = array();

    if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
      $filter_data = array(
        'filter_name'         => $search,
        'filter_tag'          => $tag,
        'filter_description'  => $description,
        'sort'                => $sort,
        'order'               => $order,
        'start'               => ($page - 1) * $limit,
        'limit'               => $limit
      );

      $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

      $results = $this->model_catalog_product->getProducts($filter_data);

      foreach ($results as $result) {
        if ($result['image']) {
          $image = $this->model_tool_image->resize($result['image'], 80, 80);
        } else {
          $image = $this->model_tool_image->resize('placeholder.png', 80, 80);
        }

        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
          $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
        } else {
          $price = false;
        }

        if (!is_null($result['special']) && (float)$result['special'] >= 0) {
          $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
          $tax_price = (float)$result['special'];
        } else {
          $special = false;
          $tax_price = (float)$result['price'];
        }

        if ($this->config->get('config_tax')) {
          $tax = $this->currency->format($tax_price, $this->session->data['currency']);
        } else {
          $tax = false;
        }

        if ($this->config->get('config_review_status')) {
          $rating = (int)$result['rating'];
        } else {
          $rating = false;
        }

        $data['products'][] = array(
          'product_id'  => $result['product_id'],
          'thumb'       => $image,
          'name'        => $result['name'],
          'description' => utf8_substr(trim(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_product_description_length')) . '..',
          'price'       => $price,
          'special'     => $special,
          'stock_status' => $result['stock_status'],
          'stock'       => $result['quantity'] <= 0 ? $result['stock_status'] : $this->language->get('text_instock'),
          'quantity'    => $result['quantity'],
          'tax'         => $tax,
          'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
          'rating'      => $result['rating'],
          'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
        );
      }
    }

    $this->response->setOutput($this->load->view('common/livesearch', $data));
  }
}
