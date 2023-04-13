<?php
class ControllerExtensionModuleAnycategories extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/anycategories');

		$this->load->model('catalog/category');

		$this->load->model('tool/image');

		$data['heading_title'] = isset($setting['text'][$this->config->get('config_language_id')]['heading']) && $setting['text'][$this->config->get('config_language_id')]['heading'] != '' ? $setting['text'][$this->config->get('config_language_id')]['heading'] : $this->language->get('heading_title');

		$data['categories'] = array();

		$data['image_width'] = $setting['width'];
		$data['image_height'] = $setting['height'];

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['category'])) {
			$categories = array_slice($setting['category'], 0, (int)$setting['limit']);

			foreach ($categories as $category_id) {
				$category_info = $this->model_catalog_category->getCategory($category_id);

				if ($category_info) {
					if ($category_info['image']) {
						$image = $this->model_tool_image->resize($category_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}


					$data['categories'][] = array(
						'product_id'  => $category_info['category_id'],
						'thumb'       => $image,
						'name'        => $category_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_category_description_length')) . '..',
						'href'        => $this->url->link('product/category', 'path=' . $category_info['category_id'])
					);
				}
			}
		}

		if ($data['categories']) {
			return $this->load->view('extension/module/anycategories', $data);
		}
	}
}
