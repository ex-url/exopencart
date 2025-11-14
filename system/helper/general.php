<?php
function token($length = 32) {
  // Create random token
  $string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  $max = strlen($string) - 1;

  $token = '';

  for ($i = 0; $i < $length; $i++) {
    $token .= $string[mt_rand(0, $max)];
  }

  return $token;
}

// Generate Bulma column classes based on number of items per row for different breakpoints
function getBulmaColumnClasses($fullhd, $widescreen, $desktop, $tablet, $mobile) {
  $process_value = function ($value) {
    $value = is_numeric($value) ? (float)$value : 1;
    $value = max(1, min(12, $value));
    $cols = round($value);

    if ($cols == 5) {
      return 'one-fifth';
    }

    $width = max(1, round(12 / $cols));

    return $width;
  };

  $build_class = function ($width, $breakpoint) {
    if ($width === 'one-fifth') {
      return "is-one-fifth-{$breakpoint}";
    }
    return "is-{$width}-{$breakpoint}";
  };

  $fullhd_width = $process_value($fullhd);
  $widescreen_width = $process_value($widescreen);
  $desktop_width = $process_value($desktop);
  $tablet_width = $process_value($tablet);
  $mobile_width = $process_value($mobile);

  $classes = [];

  if ($fullhd_width) $classes[] = $build_class($fullhd_width, 'fullhd');
  if ($widescreen_width) $classes[] = $build_class($widescreen_width, 'widescreen');
  if ($desktop_width) $classes[] = $build_class($desktop_width, 'desktop');
  if ($tablet_width) $classes[] = $build_class($tablet_width, 'tablet');
  if ($mobile_width) $classes[] = $build_class($mobile_width, 'mobile');

  return implode(' ', $classes);
}

/**
 * Backwards support for timing safe hash string comparisons
 * 
 * http://php.net/manual/en/function.hash-equals.php
 */

if (!function_exists('hash_equals')) {
  function hash_equals($known_string, $user_string) {
    $known_string = (string)$known_string;
    $user_string = (string)$user_string;

    if (strlen($known_string) != strlen($user_string)) {
      return false;
    } else {
      $res = $known_string ^ $user_string;
      $ret = 0;

      for ($i = strlen($res) - 1; $i >= 0; $i--) $ret |= ord($res[$i]);

      return !$ret;
    }
  }
}
