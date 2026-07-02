<?php
class ControllerCommonHome extends Controller {
  public function index() {
    $this->document->setTitle($this->config->get('config_meta_title'));
    $this->document->setDescription($this->config->get('config_meta_description'));
    $this->document->setKeywords($this->config->get('config_meta_keyword'));
    $this->document->setOgUrl($this->url->link('common/home'));

    if (isset($this->request->get['route'])) {
      $canonical = $this->url->link('common/home');
      if ($this->config->get('config_seo_pro') && !$this->config->get('config_seopro_addslash')) {
        $canonical = rtrim($canonical, '/');
      }
      $this->document->addLink($canonical, 'canonical');
    }

    $this->load->model('tool/image');
    $this->load->model('localisation/country');
    $this->load->model('localisation/zone');
    $this->load->model('localisation/language');

    $socialMedia = $this->config->get('config_social_media');
    $sameAs = [];

    foreach ($socialMedia as $item) {
      if (!empty($item['url'])) {
        $sameAs[] = $item['url'];
      }
    }

    $country = $this->model_localisation_country->getCountry($this->config->get('config_country_id'));
    $zone = $this->model_localisation_zone->getZone($this->config->get('config_zone_id'));
    $languages = $this->model_localisation_language->getLanguages();

    $this->log->write($this->session->data);

    $organization_schema = [
      "@context" => "https://schema.org",
      "@type" => "Organization",
      "@id" => $this->url->link('common/home') . "#organization",
      "name" => $this->config->get('config_meta_title'),
      "url" => $this->url->link('common/home'),
      "logo" => [
        "@type" => "ImageObject",
        "url" => $this->model_tool_image->resize($this->config->get('config_logo'), $this->config->get('config_logo_width'), $this->config->get('config_logo_height')),
        "width" => $this->config->get('config_logo_width'),
        "height" => $this->config->get('config_logo_height')
      ],
      "description" => $this->config->get('config_meta_description'),
      "telephone" => normalizePhone($this->config->get('config_telephone')),
      "email" => $this->config->get('config_email'),
      "address" => [
        "@type" => "PostalAddress",
        "streetAddress" => $this->config->get('config_address'),
        "addressLocality" => $this->config->get('config_city'),
        "addressRegion" => $zone['name'],
        "postalCode" => $this->config->get('config_postal'),
        "addressCountry" => $country['iso_code_2']
      ],
      "contactPoint" => [
        "@type" => "ContactPoint",
        "contactType" => "customer service",
        "telephone" => normalizePhone($this->config->get('config_telephone')),
        "availableLanguage" => $this->language->get('code'),
        "areaServed" => $country['iso_code_2']
      ],
      "sameAs" => $sameAs,
      
      // uncomment the following lines if you want to add return policy and shipping service schema

      // "hasMerchantReturnPolicy" => [
      //   "@type" => "MerchantReturnPolicy",
      //   "applicableCountry" => $country['iso_code_2'],
      //   "returnPolicyCategory" => "https://schema.org/MerchantReturnFiniteReturnWindow",
      //   "merchantReturnDays" => 14,
      //   "returnMethod" => "https://schema.org/ReturnByMail",
      //   "returnFees" => "https://schema.org/FreeReturn"
      // ],
      // "hasShippingService" => [
      //   "@type" => "ShippingService",
      //   "shippingConditions" => [
      //     "@type" => "ShippingConditions",
      //     "shippingDestination" => [
      //       "@type" => "DefinedRegion",
      //       "addressCountry" => $country['iso_code_2']
      //     ],
      //     "shippingRate" => [
      //       "@type" => "ShippingRateSettings",
      //       "freeShippingThreshold" => [
      //         "@type" => "MonetaryAmount",
      //         "value" => "10000",
      //         "currency" => $this->session->data['currency']
      //       ]
      //     ]
      //   ]
      // ]
    ];

    $this->document->addSchema($organization_schema);

    $webPageSchema = [
      "@context" => "https://schema.org",
      "@type" => "WebSite",
      "@id" => $this->config->get('site_ssl') . "#website",
      "url" => $this->config->get('site_ssl'),
      "name" => $this->config->get('config_name'),
      "description" => $this->config->get('config_meta_description'),
      "inLanguage" => $this->language->get('code'),
    ];

    $this->document->addSchema($webPageSchema);

    $data['column_left'] = $this->load->controller('common/column_left');
    $data['column_right'] = $this->load->controller('common/column_right');
    $data['content_top'] = $this->load->controller('common/content_top');
    $data['content_bottom'] = $this->load->controller('common/content_bottom');
    $data['footer'] = $this->load->controller('common/footer');
    $data['header'] = $this->load->controller('common/header');

    $this->response->setOutput($this->load->view('common/home', $data));
  }
}
