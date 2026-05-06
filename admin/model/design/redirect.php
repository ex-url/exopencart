<?php
class ModelDesignRedirect extends Model {
	public function addRedirect($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "redirect` SET old = '" . $this->db->escape($data['old']) . "', new = '" . $this->db->escape($data['new']) . "', status = '" . (int)$data['status'] . "'");

		return $this->db->getLastId();
	}

	public function editRedirect($redirect_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "redirect` SET old = '" . $this->db->escape($data['old']) . "', new = '" . $this->db->escape($data['new']) . "', status = '" . (int)$data['status'] . "' WHERE redirect_id = '" . (int)$redirect_id . "'");
	}

	public function deleteRedirect($redirect_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "redirect` WHERE redirect_id = '" . (int)$redirect_id . "'");
	}
	
	public function getRedirect($redirect_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "redirect` WHERE redirect_id = '" . (int)$redirect_id . "'");

		return $query->row;
	}

	public function getRedirects($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "redirect`";

		$implode = array();

		if (!empty($data['filter_old'])) {
			$implode[] = "`old` LIKE '%" . $this->db->escape($data['filter_old']) . "%'";
		}
		
		if (!empty($data['filter_new'])) {
			$implode[] = "`new` LIKE '%" . $this->db->escape($data['filter_new']) . "%'";
		}
		
		if (!empty($data['filter_status']) && $data['filter_status'] !== '') {
			$implode[] = "`status` = '" . (int)$data['filter_status'] . "'";
		}
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}	
		
		$sort_data = array(
			'old',
			'new',
			'status',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY redirect_id";
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
	}

	public function getTotalRedirects($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "redirect`";
		
		$implode = array();

		if (!empty($data['filter_old'])) {
			$implode[] = "`old` LIKE '%" . $this->db->escape($data['filter_old']) . "%'";
		}
		
		if (!empty($data['filter_new'])) {
			$implode[] = "`new` LIKE '%" . $this->db->escape($data['filter_new']) . "%'";
		}
		
		if (!empty($data['filter_status']) && $data['filter_status'] !== '') {
			$implode[] = "`status` = '" . (int)$data['filter_status'] . "'";
		}
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}		
		
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	
	public function checkOldUniqueness($old) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "redirect` WHERE `old` = '" . $this->db->escape(trim($old)) . "' LIMIT 1");

		return $query->num_rows ? (int)$query->row['redirect_id'] : 0;
	}	
}