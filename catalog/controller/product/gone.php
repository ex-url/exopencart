<?php
class ControllerProductGone extends Controller {
  public function index() {
    $this->load->language('product/gone');

    $this->document->setTitle($this->language->get('heading_title'));
    $this->document->setDescription($this->language->get('text_message'));

    $this->response->addHeader('HTTP/1.1 410 Gone');

    $data['heading_title'] = $this->language->get('heading_title');
    $data['text_message'] = $this->language->get('text_message');

    $data['column_left'] = $this->load->controller('common/column_left');
    $data['column_right'] = $this->load->controller('common/column_right');
    $data['content_top'] = $this->load->controller('common/content_top');
    $data['content_bottom'] = $this->load->controller('common/content_bottom');
    $data['footer'] = $this->load->controller('common/footer');
    $data['header'] = $this->load->controller('common/header');

    $this->response->setOutput($this->load->view('product/gone', $data));
  }
}
