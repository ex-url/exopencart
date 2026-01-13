<?php
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonManifest extends Controller {
  public function index() {

    $this->load->model('tool/image');

    $data = [];

    $data['name'] = $this->config->get('config_name');
    $data['short_name'] = $this->config->get('config_name');
    $data['start_url'] = '/';
    $data['display'] = 'standalone';
    $data['orientation'] = 'portrait-primary';
    $data['scope'] = '/';
    $data['background_color'] = $this->config->get('config_default_theme') == 'light' ? '#ffffff' : '#000000';
    $data['theme_color'] = $this->config->get('config_default_theme') == 'light' ? '#ffffff' : '#000000';
    $data['icons'] = [];

    $icon_sizes = [144, 180, 192, 384, 512];

    foreach ($icon_sizes as $size) {
      if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
        $data['icons'][] = [
          'src' => $this->model_tool_image->resize($this->config->get('config_icon'), $size, $size),
          'type' => $this->config->get('developer_webp') ? 'image/webp' : 'image/png',
          'sizes' => $size . 'x' . $size,
          'purpose' => 'any'
        ];
      }
    }

    $this->response->addHeader('Content-Type: application/manifest+json');
    $this->response->setOutput(json_encode($data));
  }
}
