<?php

/**
 * @package		OpenCart
 * @author		Daniel Kerr
 * @copyright	Copyright (c) 2005 - 2017, OpenCart, Ltd. (https://www.opencart.com/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://www.opencart.com
 */

/**
 * Pagination class
 */
class Pagination {
  public $total = 0;
  public $page = 1;
  public $limit = 20;
  public $num_links = 8;
  public $url = '';
  public $text_first = '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-0.5 -0.5 16 16" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" height="16" width="16"><path d="M2.8125 1.875v11.25m2.95375 -5.1375 5.40625 4.325a0.625 0.625 0 0 0 1.0150000000000001 -0.48750000000000004V3.175a0.625 0.625 0 0 0 -1.015625 -0.48750000000000004l-5.405625 4.325a0.625 0.625 0 0 0 0 0.9750000000000001" stroke-width="1"></path></svg>';
  public $text_last = '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-0.5 -0.5 16 16" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" height="16" width="16"><path d="M12.1875 1.875v11.25m-2.95375 -5.1375 -5.40625 4.325a0.625 0.625 0 0 1 -1.0150000000000001 -0.48750000000000004V3.175a0.625 0.625 0 0 1 1.015625 -0.48750000000000004l5.405625 4.325a0.625 0.625 0 0 1 0 0.9750000000000001" stroke-width="1"></path></svg>';
  public $text_next = '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-0.5 -0.5 16 16" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" height="16" width="16"><path d="m5.625 11.25 3.75 -3.75 -3.75 -3.75" stroke-width="1"></path></svg>';
  public $text_prev = '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-0.5 -0.5 16 16" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" height="16" width="16"><path d="m9.375 3.75 -3.75 3.75 3.75 3.75" stroke-width="1"></path></svg>';

  /**
   *
   *
   * @return	text
   */
  public function render() {
    $total = $this->total;

    if ($this->page < 1) {
      $page = 1;
    } else {
      $page = $this->page;
    }

    if (!(int)$this->limit) {
      $limit = 10;
    } else {
      $limit = $this->limit;
    }

    $num_links = $this->num_links;
    $num_pages = ceil($total / $limit);

    $this->url = str_replace('%7Bpage%7D', '{page}', $this->url);

    $output = '<nav class="pagination is-small"><ul class="pagination-list">';

    if ($page > 1) {
      $output .= '<li><a class="pagination-link" href="' . str_replace(array('&amp;page={page}', '?page={page}', '&page={page}'), '', $this->url) . '">' . $this->text_first . '</a></li>';

      if ($page - 1 === 1) {
        $output .= '<li><a class="pagination-link" href="' . str_replace(array('&amp;page={page}', '?page={page}', '&page={page}'), '', $this->url) . '">' . $this->text_prev . '</a></li>';
      } else {
        $output .= '<li><a class="pagination-link" href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a></li>';
      }
    }

    if ($num_pages > 1) {
      if ($num_pages <= $num_links) {
        $start = 1;
        $end = $num_pages;
      } else {
        $start = $page - floor($num_links / 2);
        $end = $page + floor($num_links / 2);

        if ($start < 1) {
          $end += abs($start) + 1;
          $start = 1;
        }

        if ($end > $num_pages) {
          $start -= ($end - $num_pages);
          $end = $num_pages;
        }
      }

      for ($i = $start; $i <= $end; $i++) {
        if ($page == $i) {
          $output .= '<li><span  class="pagination-link is-current">' . $i . '</span></li>';
        } else {
          if ($i === 1) {
            $output .= '<li><a  class="pagination-link" href="' . str_replace(array('&amp;page={page}', '?page={page}', '&page={page}'), '', $this->url) . '">' . $i . '</a></li>';
          } else {
            $output .= '<li><a  class="pagination-link" href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a></li>';
          }
        }
      }
    }

    if ($page < $num_pages) {
      $output .= '<li><a  class="pagination-link" href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a></li>';
      $output .= '<li><a  class="pagination-link" href="' . str_replace('{page}', $num_pages, $this->url) . '">' . $this->text_last . '</a></li>';
    }

    $output .= '</ul></nav>';

    if ($num_pages > 1) {
      return $output;
    } else {
      return '';
    }
  }
}
