<?php
class ControllerCommonMenu extends Controller {
  public function index() {
    $this->load->language('common/menu');

    $this->load->model('catalog/category');
    $this->load->model('catalog/product');
    $this->load->model('catalog/information');
    $this->load->model('catalog/manufacturer');

    $settings = $this->config->get('menu_default_settings');

    $cache_key = 'main_menu_' . $this->config->get('config_language_id') . '_' . $this->config->get('config_store_id');

    $data = $this->cache->get($cache_key) ?: [];

    if (!(bool)$settings['cache'] || !$data) {

      if ($settings['show_catalog']) {

        $data['text_category'] = $settings['button'][$this->config->get('config_language_id')] ? $settings['button'][$this->config->get('config_language_id')] : $this->language->get('text_category');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

        foreach ($categories as $category) {
          if ($category['top']) {
            // Level 2
            $children_data = array();

            $children = $this->model_catalog_category->getCategories($category['category_id']);

            foreach ($children as $child) {
              $filter_data = array(
                'filter_category_id'  => $child['category_id'],
                'filter_sub_category' => true
              );

              $children_data[] = array(
                'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
              );
            }

            // Level 1
            $data['categories'][] = array(
              'image'     => (bool)$settings['show_images'] ? $this->model_tool_image->resize($category['image'], $settings['width'], $settings['height']) : '',
              'name'     => $category['name'],
              'children' => $children_data,
              'column'   => $category['column'] ? $category['column'] : 1,
              'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
            );
          }
        }
      }

      if ($settings['show_brands']) {
        $data['brands_modal'] = $settings['brands_modal'];

        if ($settings['brands_modal']) {
          $brands = $this->model_catalog_manufacturer->getManufacturers();

          $data['brands'] = array();

          foreach ($brands as $brand) {
            $data['brands'][] = array(
              'name' => $brand['name'],
              'thumb' => $this->model_tool_image->resize($brand['image'], $settings['width'], $settings['height']),
              'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $brand['manufacturer_id'])
            );
          }
        } else {
          $data['brands'] = array(
            'name' => $this->language->get('text_brands'),
            'href' => $this->url->link('product/manufacturer')
          );
        }
      }

      $this->log->write($data['brands']);

      if ($settings['show_special']) {
        $data['special'] = array(
          'name' => $this->language->get('text_special'),
          'href' => $this->url->link('product/special')
        );
      }

      if ($settings['show_blog']) {
        $data['blog'] = $this->load->controller('blog/menu');
      }

      $data['informations'] = array();

      foreach ($this->model_catalog_information->getInformations() as $result) {
        if ($result['top']) {
          $data['informations'][] = array(
            'title' => $result['title'],
            'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
          );
        }
      }

      if ($settings['show_contacts']) {
        $data['contact'] = array(
          'name' => $this->language->get('text_contact_us'),
          'href' => $this->url->link('information/contact')
        );
      }

      $data['compare'] = $this->url->link('product/compare');
      $data['wishlist'] = $this->url->link('account/wishlist');
      $data['account'] = $this->url->link('account/account', '', true);
      $data['cart'] = $this->url->link('checkout/cart');

      $this->cache->set($cache_key, $data);
    }

    $data['logged'] = $this->customer->isLogged();
    $data['cart_badge_products'] = $this->cart->countProducts();
    $data['compare_badge_products'] = isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0;

    if ($data['logged']) {
      $this->load->model('account/wishlist');

      $data['wishlist_badge_products'] = $this->model_account_wishlist->getTotalWishlist();
    } else {
      $data['wishlist_badge_products'] = isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0;
    }

    return $this->load->view('common/menu', $data);
  }
}
