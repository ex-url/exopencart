<?php
class ModelToolRedirect extends Model {
	public function getRedirectByOldPath($path) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "redirect` WHERE `old` = '" . $this->db->escape(trim($path)) . "'");

		return $query->row;
	}
}