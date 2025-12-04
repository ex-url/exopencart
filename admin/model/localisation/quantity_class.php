<?php
class ModelLocalisationQuantityClass extends Model {
  public function addQuantityClass($data) {
    $this->db->query("INSERT INTO " . DB_PREFIX . "quantity_class (quantity_class_id) VALUES (NULL)");

    $quantity_class_id = $this->db->getLastId();

    foreach ($data['quantity_class_description'] as $language_id => $value) {
      $this->db->query("INSERT INTO " . DB_PREFIX . "quantity_class_description SET quantity_class_id = '" . (int)$quantity_class_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', unit = '" . $this->db->escape($value['unit']) . "'");
    }

    $this->cache->delete('quantity_class');

    return $quantity_class_id;
  }

  public function editQuantityClass($quantity_class_id, $data) {
    $this->db->query("DELETE FROM " . DB_PREFIX . "quantity_class_description WHERE quantity_class_id = '" . (int)$quantity_class_id . "'");

    foreach ($data['quantity_class_description'] as $language_id => $value) {
      $this->db->query("INSERT INTO " . DB_PREFIX . "quantity_class_description SET quantity_class_id = '" . (int)$quantity_class_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', unit = '" . $this->db->escape($value['unit']) . "'");
    }

    $this->cache->delete('quantity_class');
  }

  public function deleteQuantityClass($quantity_class_id) {
    $this->db->query("DELETE FROM " . DB_PREFIX . "quantity_class WHERE quantity_class_id = '" . (int)$quantity_class_id . "'");
    $this->db->query("DELETE FROM " . DB_PREFIX . "quantity_class_description WHERE quantity_class_id = '" . (int)$quantity_class_id . "'");

    $this->cache->delete('quantity_class');
  }

  public function getQuantityClasses($data = array()) {
    if ($data) {
      $sql = "SELECT * FROM " . DB_PREFIX . "quantity_class qc LEFT JOIN " . DB_PREFIX . "quantity_class_description qcd ON (qc.quantity_class_id = qcd.quantity_class_id) WHERE qcd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

      $sort_data = array(
        'title',
        'unit'
      );

      if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
        $sql .= " ORDER BY " . $data['sort'];
      } else {
        $sql .= " ORDER BY title";
      }

      if (isset($data['order']) && ($data['order'] == 'DESC')) {
        $sql .= " DESC";
      } else {
        $sql .= " ASC";
      }

      if (isset($data['start']) || isset($data['limit'])) {
        if ($data['start'] < 0) {
          $data['start'] = 0;
        }

        if ($data['limit'] < 1) {
          $data['limit'] = 20;
        }

        $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
      }

      $query = $this->db->query($sql);

      return $query->rows;
    } else {
      $quantity_class_data = $this->cache->get('quantity_class.' . (int)$this->config->get('config_language_id'));

      if (!$quantity_class_data) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quantity_class qc LEFT JOIN " . DB_PREFIX . "quantity_class_description qcd ON (qc.quantity_class_id = qcd.quantity_class_id) WHERE qcd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        $quantity_class_data = $query->rows;

        $this->cache->set('quantity_class.' . (int)$this->config->get('config_language_id'), $quantity_class_data);
      }

      return $quantity_class_data;
    }
  }

  public function getQuantityClass($quantity_class_id) {
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quantity_class qc LEFT JOIN " . DB_PREFIX . "quantity_class_description qcd ON (qc.quantity_class_id = qcd.quantity_class_id) WHERE qc.quantity_class_id = '" . (int)$quantity_class_id . "' AND qcd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

    return $query->row;
  }

  public function getQuantityClassDescriptionByUnit($unit) {
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quantity_class_description WHERE unit = '" . $this->db->escape($unit) . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");

    return $query->row;
  }

  public function getQuantityClassDescriptions($quantity_class_id) {
    $quantity_class_data = array();

    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quantity_class_description WHERE quantity_class_id = '" . (int)$quantity_class_id . "'");

    foreach ($query->rows as $result) {
      $quantity_class_data[$result['language_id']] = array(
        'title' => $result['title'],
        'unit'  => $result['unit']
      );
    }

    return $quantity_class_data;
  }

  public function getTotalQuantityClasses() {
    $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "quantity_class");

    return $query->row['total'];
  }
}
