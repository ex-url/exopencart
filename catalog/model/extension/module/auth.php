<?php

class ModelExtensionModuleAuth extends Model {

  /**
   * Get customer_id by provider
   * 
   * @param string $provider - provider name (yandex, google, vk, telegram)
   * @param string $provider_user_id - unique user ID from provider
   * @return int customer_id or 0 if not found
   */
  public function getCustomerIdByProvider($provider, $provider_user_id) {
    $query = $this->db->query(
      "SELECT customer_id FROM " . DB_PREFIX . "customer_auth 
      WHERE provider = '" . $this->db->escape($provider) . "' 
      AND provider_user_id = '" . $this->db->escape($provider_user_id) . "'"
    );

    if ($query->num_rows) {
      return (int)$query->row['customer_id'];
    }

    return 0;
  }

  /**
   * Get customer_id by email
   * 
   * @param string $email user Email from
   * @return int customer_id or 0 if not found
   */
  public function getCustomerIdByEmail($email) {
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
      return 0;
    }

    $query = $this->db->query(
      "SELECT customer_id 
      FROM " . DB_PREFIX . "customer 
      WHERE email = '" . $this->db->escape($email) . "' 
      LIMIT 1"
    );

    if ($query->num_rows) {
      return (int)$query->row['customer_id'];
    }

    return 0;
  }

  /**
   * Add provider->customer link
   * 
   * @param int $customer_id Opencart customer_id
   * @param string $provider Provider name (yandex, google, vk, telegram)
   * @param string $provider_user_id Provider user ID
   * @return void
   */
  public function addCustomerAuth($customer_id, $provider, $provider_user_id) {
    $this->db->query(
      "INSERT INTO " . DB_PREFIX . "customer_auth 
      SET customer_id = '" . (int)$customer_id . "', 
          provider = '" . $this->db->escape($provider) . "', 
          provider_user_id = '" . $this->db->escape($provider_user_id) . "', 
          created_at = NOW()"
    );
  }
}
