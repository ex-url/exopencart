<?php
class ModelAccountWishlist extends Model {
  public function addWishlist($product_id) {
    $this->db->query("DELETE FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "'");

    $this->db->query("INSERT INTO " . DB_PREFIX . "customer_wishlist SET customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', date_added = NOW()");
  }

  public function deleteWishlist($product_id) {
    if ($this->customer->isLogged()) {
      $this->db->query("DELETE FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "'");
    } else {
      if (isset($this->session->data['wishlist'])) {
        $key = array_search($product_id, $this->session->data['wishlist']);
        if ($key !== false) {
          unset($this->session->data['wishlist'][$key]);
        }
      }
    }
  }

  public function getWishlist() {
    if ($this->customer->isLogged()) {
      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = '" . (int)$this->customer->getId() . "'");
      return $query->rows;
    } else {
      $wishlist = array();
      if (isset($this->session->data['wishlist']) && is_array($this->session->data['wishlist'])) {
        foreach ($this->session->data['wishlist'] as $product_id) {
          $wishlist[] = array('product_id' => $product_id);
        }
      }
      return $wishlist;
    }
  }

  public function getTotalWishlist() {
    if ($this->customer->isLogged()) {
      $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = '" . (int)$this->customer->getId() . "'");
      return $query->row['total'];
    } else {
      return isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0;
    }
  }
}
