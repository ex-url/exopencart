<?php

/**
 * @package		OpenCart
 * @author		Daniel Kerr
 * @copyright	Copyright (c) 2005 - 2017, OpenCart, Ltd. (https://www.opencart.com/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://www.opencart.com
 */

class Document {
  private $title;
  private $robots;
  private $description;
  private $keywords;

  private $links = array();
  private $styles = array();
  private $scripts = array();
  private $schema = array();
  private $og_url;
  private $og_type = 'website';
  private $og_image;
  private $og_image_alt;
  private $og_product_price;
  private $og_product_currency;
  private $og_product_brand;
  private $og_product_availability;
  private $og_product_sku;
  private $og_product_condition;
  private $og_published;
  private $og_modified;
  private $og_author;
  private $og_publisher;
  private $og_prefix;

  /**
   *
   *
   * @param	string	$title
   */
  public function setTitle($title) {
    $this->title = $title;
  }

  /**
   *
   *
   * @return	string
   */
  public function getTitle() {
    return $this->title;
  }

  public function setRobots($robots) {
    $this->robots = $robots;
  }

  public function getRobots() {
    return $this->robots;
  }

  /**
   *
   *
   * @param	string	$description
   */
  public function setDescription($description) {
    $this->description = $description;
  }

  /**
   *
   *
   * @param	string	$description
   *
   * @return	string
   */
  public function getDescription() {
    return $this->description;
  }

  /**
   *
   *
   * @param	string	$keywords
   */
  public function setKeywords($keywords) {
    $this->keywords = $keywords;
  }

  /**
   *
   *
   * @return	string
   */
  public function getKeywords() {
    return $this->keywords;
  }

  /**
   *
   *
   * @param	string	$href
   * @param	string	$rel
   */
  public function addLink($href, $rel, $as = null, $type = null, $crossorigin = null) {
    $link = array(
      'href' => $href,
      'rel'  => $rel
    );

    if ($as) {
      $link['as'] = $as;
    }
    if ($type) {
      $link['type'] = $type;
    }
    if ($crossorigin) {
      $link['crossorigin'] = $crossorigin;
    }

    $this->links[$href] = $link;
  }

  /**
   *
   *
   * @return	array
   */
  public function getLinks() {
    return $this->links;
  }

  /**
   *
   *
   * @param	string	$href
   * @param	string	$rel
   * @param	string	$media
   */
  public function addStyle($href, $rel = 'stylesheet', $media = 'screen', $position = 'header') {
    $this->styles[$position][$href] = array(
      'href'  => $href,
      'rel'   => $rel,
      'media' => $media
    );
  }

  /**
   *
   *
   * @return	array
   */
  public function getStyles($position = 'header') {
    if (isset($this->styles[$position])) {
      return $this->styles[$position];
    } else {
      return array();
    }
  }

  /**
   *
   *
   * @param	string	$href
   * @param	string	$position
   */
  public function addScript($href, $position = 'header') {
    $this->scripts[$position][$href] = $href;
  }

  /**
   *
   *
   * @param	string	$position
   *
   * @return	array
   */
  public function getScripts($position = 'header') {
    if (isset($this->scripts[$position])) {
      return $this->scripts[$position];
    } else {
      return array();
    }
  }

  public function addSchema($json) {
    $this->schema[] = $json;
  }

  public function getSchema() {
    return $this->schema;
  }

  public function setOgType($type) {
    $this->og_type = $type;
  }

  public function getOgType() {
    return $this->og_type;
  }

  public function setOgImage($image) {
    $this->og_image = $image;
  }

  public function getOgImage() {
    return $this->og_image;
  }

  public function setOgImageAlt($alt) {
    $this->og_image_alt = $alt;
  }

  public function getOgImageAlt() {
    return $this->og_image_alt;
  }

  public function setOgUrl($url) {
    $this->og_url = $url;
  }

  public function getOgUrl() {
    return $this->og_url;
  }

  public function setOgProductPrice($price) {
    $this->og_product_price = $price;
  }

  public function getOgProductPrice() {
    return $this->og_product_price;
  }

  public function setOgProductCurrency($currency) {
    $this->og_product_currency = $currency;
  }

  public function getOgProductCurrency() {
    return $this->og_product_currency;
  }

  public function setOgProductBrand($brand) {
    $this->og_product_brand = $brand;
  }

  public function getOgProductBrand() {
    return $this->og_product_brand;
  }

  public function setOgAvailability($availability) {
    $this->og_product_availability = $availability;
  }

  public function getOgAvailability() {
    return $this->og_product_availability;
  }

  public function setOgSku($sku) {
    $this->og_product_sku = $sku;
  }

  public function getOgSku() {
    return $this->og_product_sku;
  }

  public function setOgCondition($condition) {
    $this->og_product_condition = $condition;
  }

  public function getOgCondition() {
    return $this->og_product_condition;
  }

  public function setOgPublished($published) {
    $this->og_published = $published;
  }

  public function getOgPublished() {
    return $this->og_published;
  }

  public function setOgModified($modified) {
    $this->og_modified = $modified;
  }

  public function getOgModified() {
    return $this->og_modified;
  }
  public function setOgAuthor($author) {
    $this->og_author = $author;
  }

  public function getOgAuthor() {
    return $this->og_author;
  }

  public function setOgPublisher($publisher) {
    $this->og_publisher = $publisher;
  }

  public function getOgPublisher() {
    return $this->og_publisher;
  }

  public function setOgPrefix($prefix) {
    $this->og_prefix = $prefix;
  }

  public function getOgPrefix() {
    return $this->og_prefix;
  }
}
