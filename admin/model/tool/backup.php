<?php
class ModelToolBackup extends Model {
	public function getTables() {
		$table_data = array();

		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");

		foreach ($query->rows as $result) {
			$table = reset($result);
			if ($table && utf8_substr($table, 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				$table_data[] = $table;
			}
		}

		return $table_data;
	}

	public function backup($tables) {
		$output = '';

		foreach ($tables as $table) {
			if (DB_PREFIX) {
				if (strpos($table, DB_PREFIX) === false) {
					$status = false;
				} else {
					$status = true;
				}
			} else {
				$status = true;
			}

			if ($status) {
				$output .= 'TRUNCATE TABLE `' . $table . '`;' . "\n\n";

				$query = $this->db->query("SELECT * FROM `" . $table . "`");

				foreach ($query->rows as $result) {
					$fields = '';

					foreach (array_keys($result) as $value) {
						$fields .= '`' . $value . '`, ';
					}

					$values = '';

					foreach (array_values($result) as $value) {
						$value = str_replace(array("\x00", "\x0a", "\x0d", "\x1a"), array('\0', '\n', '\r', '\Z'), $value);
						$value = str_replace(array("\n", "\r", "\t"), array('\n', '\r', '\t'), $value);
						$value = str_replace('\\', '\\\\',	$value);
						$value = str_replace('\'', '\\\'',	$value);
						$value = str_replace('\\\n', '\n',	$value);
						$value = str_replace('\\\r', '\r',	$value);
						$value = str_replace('\\\t', '\t',	$value);

						$values .= '\'' . $value . '\', ';
					}

					$output .= 'INSERT INTO `' . $table . '` (' . preg_replace('/, $/', '', $fields) . ') VALUES (' . preg_replace('/, $/', '', $values) . ');' . "\n";
				}

				$output .= "\n\n";
			}
		}

		return $output;
	}

	public function reset() {
		$tables = [
			'category',
			'category_description',
			'category_filter',
			'category_path',
			'category_to_layout',
			'category_to_store',
			'product_to_category',
			'seo_url',
			'cart',
			'blog_category',
			'blog_category_description',
			'blog_category_path',
			'blog_category_to_layout',
			'blog_category_to_store',
			'article',
			'article_description',
			'article_image',
			'article_related',
			'article_related_mn',
			'article_related_product',
			'article_related_wb',
			'article_to_blog_category',
			'article_to_download',
			'article_to_layout',
			'article_to_store',
			'product',
			'product_attribute',
			'product_description',
			'product_discount',
			'product_filter',
			'product_image',
			'product_option',
			'product_option_value',
			'product_recurring',
			'product_related',
			'product_reward',
			'product_special',
			'product_to_download',
			'product_to_layout',
			'product_to_store',
			'option',
			'option_description',
			'option_value',
			'option_value_description',
			'manufacturer',
			'manufacturer_description',
			'manufacturer_to_layout',
			'manufacturer_to_store',
			'attribute',
			'attribute_description',
			'attribute_group',
			'attribute_group_description',
			'review',
			'review_article',
			'order',
			'order_total',
			'order_history',
			'order_option',
			'order_product'
		];

		foreach ($tables as $table) {
			$this->db->query("TRUNCATE TABLE `" . DB_PREFIX . $table . "`");
		}

		return true;
	}
}
