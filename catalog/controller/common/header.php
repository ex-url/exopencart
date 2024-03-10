<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonHeader extends Controller {
  public function index() {
    // Analytics
    $this->load->model('setting/extension');
    $this->load->model('tool/image');

    $data['analytics'] = array();

    $analytics = $this->model_setting_extension->getExtensions('analytics');

    foreach ($analytics as $analytic) {
      if ($this->config->get('analytics_' . $analytic['code'] . '_status')) {
        $data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get('analytics_' . $analytic['code'] . '_status'));
      }
    }

    if ($this->request->server['HTTPS']) {
      $server = $this->config->get('config_ssl');
    } else {
      $server = $this->config->get('config_url');
    }

    if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
      $this->model_tool_image->resize($this->config->get('config_icon'), 256, 256);
      $this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
    }

    $template_folder = $this->config->get('theme_default_directory');
    $this->document->addScript('catalog/view/theme/' . $template_folder . '/js/common.js');
    $this->document->addStyle('catalog/view/theme/' . $template_folder . '/css/ui.min.css');
    $this->document->addStyle('catalog/view/theme/' . $template_folder . '/css/main.css');

    $data['title'] = $this->document->getTitle();

    $data['base'] = $server;
    $data['description'] = $this->document->getDescription();
    $data['keywords'] = $this->document->getKeywords();
    $data['links'] = $this->document->getLinks();
    $data['robots'] = $this->document->getRobots();
    $data['styles'] = !$this->config->get('developer_css') ? $this->document->getStyles() : $this->getCompressedStyles();
    $data['scripts'] = !$this->config->get('developer_js') ? $this->document->getScripts('header') : $this->getCompressedScripts();
    $data['comporess_js'] = !$this->config->get('developer_js');
    $data['lang'] = $this->language->get('code');
    $data['direction'] = $this->language->get('direction');
    $data['name'] = $this->config->get('config_name');
    $data['city'] = $this->config->get('config_city');
    $data['show_stores'] = $this->config->get('module_store_status');

    $logo_width = $this->config->get('config_logo_width') ? (int)$this->config->get('config_logo_width') : 200;
    $logo_height = $this->config->get('config_logo_height') ? (int)$this->config->get('config_logo_height') : 40;

    if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
      $data['logo'] = $this->model_tool_image->resize($this->config->get('config_logo'), $logo_width * 2, $logo_height * 2);
    } else {
      $data['logo'] = '';
    }

    $data['logo_width'] = $logo_width;
    $data['logo_height'] = $logo_height;

    $this->load->language('common/header');

    $host = isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER;
    if ($this->request->server['REQUEST_URI'] == '/') {
      $data['og_url'] = $this->url->link('common/home');
    } else {
      $data['og_url'] = $host . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI']) - 1));
    }

    $data['og_image'] = $this->document->getOgImage();

    // Wishlist
    if ($this->customer->isLogged()) {
      $this->load->model('account/wishlist');

      $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
    } else {
      $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
    }

    $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

    $data['home'] = $this->url->link('common/home');
    $data['wishlist'] = $this->url->link('account/wishlist', '', true);
    $data['logged'] = $this->customer->isLogged();
    $data['account'] = $this->url->link('account/account', '', true);
    $data['register'] = $this->url->link('account/register', '', true);
    $data['login'] = $this->url->link('account/login', '', true);
    $data['order'] = $this->url->link('account/order', '', true);
    $data['transaction'] = $this->url->link('account/transaction', '', true);
    $data['download'] = $this->url->link('account/download', '', true);
    $data['logout'] = $this->url->link('account/logout', '', true);
    $data['shopping_cart'] = $this->url->link('checkout/cart');
    $data['checkout'] = $this->url->link('checkout/checkout', '', true);
    $data['contact'] = $this->url->link('information/contact');
    $data['telephone'] = $this->config->get('config_telephone');
    $data['email'] = $this->config->get('config_email');
    $data['social_media'] = $this->config->get('config_social_media');

    $data['language'] = $this->load->controller('common/language');
    $data['currency'] = $this->load->controller('common/currency');
    $data['currency'] = $this->load->controller('common/currency');
    if ($this->config->get('configblog_blog_menu')) {
      $data['blog_menu'] = $this->load->controller('blog/menu');
    } else {
      $data['blog_menu'] = '';
    }
    $data['search'] = $this->load->controller('common/search');
    $data['cart'] = $this->load->controller('common/cart');
    $data['menu'] = $this->load->controller('common/menu');

    return $this->load->view('common/header', $data);
  }

  private function getCompressedStyles() {
    $styles = $this->document->getStyles();
    $hash = md5(implode((array_keys($styles))));

    if(!is_dir(DIR_APPLICATION . 'compressed')) {
      mkdir(DIR_APPLICATION . 'compressed', 0755);
    }

    if(is_file(DIR_APPLICATION . 'compressed/styles.' . $hash . '.css')) {
      return array(
        'compressed' => array(
          'href'  => 'catalog/compressed/styles.' . $hash . '.css',
          'rel'   => 'stylesheet',
          'media' => 'screen'
        )
      );
    } else {
      $minifier = new MatthiasMullie\Minify\CSS();

      // bulma should be the first because of charset
      $ordered = [];
      $ordered[] = array(
        'href' => 'catalog/view/theme/default/css/ui.min.css',
        'rel' => 'stylesheet',
        'media' => 'screen'
      );

      foreach ($styles as $style) {
        if($style['href'] !== 'catalog/view/theme/default/css/ui.min.css') {
          $ordered[] = $style;
        }
      }

      foreach ($ordered as $style) {
        $minifier->add(DIR_ROOT . $style['href']);
      }

      $minifier->minify(DIR_APPLICATION . 'compressed/styles.' . $hash . '.css');

      return array(
        'compressed' => array(
          'href'  => 'catalog/compressed/styles.' . $hash . '.css',
          'rel'   => 'stylesheet',
          'media' => 'screen'
        )
      );
    }
  }

  private function getCompressedScripts() {
    $scripts = $this->document->getScripts();
    $hash = md5(implode((array_keys($scripts))));

    if(!is_dir(DIR_APPLICATION . 'compressed')) {
      mkdir(DIR_APPLICATION . 'compressed', 0755);
    }

    if(is_file(DIR_APPLICATION . 'compressed/scripts.' . $hash . '.css')) {
      return array(
        'compressed' => 'catalog/compressed/scripts.' . $hash . '.css'
      );
    } else {
      $minifier = new MatthiasMullie\Minify\JS();

      $ordered = [];
      $ordered[] = 'catalog/view/theme/default/js/jquery.min.js';

      foreach ($scripts as $script) {
        $ordered[] = $script;
      }

      foreach ($ordered as $script) {
        $minifier->add(DIR_ROOT . $script);
      }

      $minifier->minify(DIR_APPLICATION . 'compressed/scripts.' . $hash . '.js');

      return array(
        'compressed' => 'catalog/compressed/scripts.' . $hash . '.js'
      );
    }
  }
}
