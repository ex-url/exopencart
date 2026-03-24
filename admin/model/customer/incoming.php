<?php
class ModelCustomerIncoming extends Model {
	public function getIncomings($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "incoming i";

		$sort_data = array(
			'i.date_added',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY i.date_added";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			$start = isset($data['start']) ? (int)$data['start'] : 0;
			$limit = isset($data['limit']) ? (int)$data['limit'] : 20;

			if ($start < 0) {
				$start = 0;
			}

			if ($limit < 1) {
				$limit = 20;
			}

			$sql .= " LIMIT " . $start . "," . $limit;
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalIncomings() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "incoming");

		return $query->row['total'];
	}

	public function getTotalNewIncomings() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "incoming WHERE status = 0");

		return $query->row['total'];
	}

	public function done($incoming_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "incoming SET user_id = '" . (int)$this->user->getId() . "', status = '1', date_modified = NOW() WHERE incoming_id = '" . (int)$incoming_id . "'");
	}

	public function comment($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "incoming SET user_id = '" . (int)$this->user->getId() . "', comment = '" . $this->db->escape($data['comment']) . "', status = 1, date_modified = NOW() WHERE incoming_id = '" . (int)$data['incoming_id'] . "'");
	}

	public function delete($incoming_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "incoming WHERE incoming_id = '" . (int)$incoming_id . "'");
	}
}
