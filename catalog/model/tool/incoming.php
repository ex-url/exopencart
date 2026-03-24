<?php
class ModelToolIncoming extends Model {
	public function add($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "incoming SET 
		name = '" . $this->db->escape($data['name']) . "', 
		customer_id = '" . $this->db->escape($data['customer_id']) . "', 
		type = '" . $this->db->escape($data['type']) . "', 
		email = '" . $this->db->escape($data['email']) . "', 
		telephone = '" . $this->db->escape($data['telephone']) . "', 
		message = '" . $this->db->escape($data['message']) . "', 
		ip = '" . $this->db->escape($data['ip']) . "', 
		page_url = '" . $this->db->escape($data['page_url']) . "', 
		date_added = NOW(), 
		date_modified = NOW()");
	}
}
