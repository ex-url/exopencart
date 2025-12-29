$(document).ready(function () {

  $('body').on('blur', '#checkout-customer-form input', updateCheckoutCustomer);
  $('body').on('blur', '#payment-address-form input, #payment-address-form select', updatePaymentAddress);
  $('body').on('change', '#shipping-pickup-form', updatePickupPoint);
  $('body').on('blur', '#shipping-address-form input, #shipping-address-form select', updateShippingAddress);
  $('body').on('change', '#checkout-shipping-method form', updateShippingMethod);
  $('body').on('change', '#checkout-payment form', updatePaymentMethod);
  $('body').on('click', '#confirm-checkout', confirmCheckout);
  $('body').on('change', 'select[name="country_id"]', getZoneList);

  $('body').on('change', 'input[name="register"]', function () {
    if ($(this).is(':checked')) {
      $('.create-account').removeClass('is-hidden');
    } else {
      $('.create-account').addClass('is-hidden');
      $('.create-account input[type="password"]').val('');
    }
  });

});

async function updateCheckoutCustomer(e) {

  let $form = $('#checkout-customer-form');
  let action;

  if ($('#checkout-customer-form input[name="register"]').length && !$('#checkout-customer-form input[name="register"]').is(':checked')) {
    action = 'guest/save';
  } else {
    action = 'register/save';
  }

  let $input = e && $(e.target).is('input') ? $(e.target) : false;

  let result = await $.ajax({
    type: 'post',
    url: '/index.php?route=checkout/' + action,
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () { },
    success: function (json) {

      if (json['redirect']) {
        location = json['redirect'];
      }

      $form.find('.help.is-danger').remove();
      $form.find('.input.is-danger').removeClass('is-danger');

      if ($form.find('.captcha').length) {
        $form.find('.captcha').find('.help.is-danger').remove();
      }

      if (json['error']) {
        if ($input) {
          if (json['error'][$input.attr('name')]) {
            $form.find('input[name="' + $input.attr('name') + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][$input.attr('name')] + '</p>');
            $form.find('input[name="' + $input.attr('name') + '"]').addClass('is-danger');
          }
        } else {
          for (let key in json['error']) {
            $form.find('input[name="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[id="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[name="' + key + '"]').addClass('is-danger');
            $form.find('input[id="' + key + '"]').addClass('is-danger');

            if ($form.find('.captcha').length && key == 'captcha') {
              $form.find('.captcha').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            }
          }
        }
      }

      if (json['registered']) {
        location.reload();
      }

      if (json['approval']) {
        notification({
          type: 'warning',
          text: json['approval']
        })
      }

    },
    error: function (err) {
      console.error('AJAX Error:', err);
      notification({
        type: 'danger',
        text: 'Something went wrong while processing your request. Please try again.'
      });
    }
  });

  return result;

}

async function updatePaymentAddress(e) {

  const $form = $('#payment-address-form');
  const $input = e && $(e.target).is('input') ? $(e.target) : false;

  const result = await $.ajax({
    type: 'post',
    url: '/index.php?route=checkout/payment_address/save',
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () { },
    success: function (json) {

      if (json['redirect']) {
        location = json['redirect'];
      }

      $form.find('.help.is-danger').remove();
      $form.find('.input.is-danger').removeClass('is-danger');

      if (json['error']) {

        if ($input) {
          if (json['error'][$input.attr('name')]) {
            $form.find('input[name="' + $input.attr('name') + '"], select[name="' + $input.attr('name') + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][$input.attr('name')] + '</p>');
            $form.find('input[name="' + $input.attr('name') + '"], select[name="' + $input.attr('name') + '"]').addClass('is-danger');
          }
        } else {
          for (let key in json['error']) {
            $form.find('input[name="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[id="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[name="' + key + '"]').addClass('is-danger');
            $form.find('input[id="' + key + '"]').addClass('is-danger');
          }
        }
      }

      if (json['added'] || json['existed']) {
        $('#checkout-payment-address .box').load('index.php?route=checkout/payment_address&ajax=1');
      }

    },
    error: function (err) {
      console.error('AJAX Error:', err);
      notification({
        type: 'danger',
        text: 'Something went wrong while processing your request. Please try again.'
      });
    }
  });

  return result;

}

async function updateShippingAddress(e) {

  const $form = $('#shipping-address-form');
  const $input = e && $(e.target).is('input') ? $(e.target) : false;

  const result = await $.ajax({
    type: 'post',
    url: '/index.php?route=checkout/shipping_address/save',
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () { },
    success: function (json) {

      if (json['redirect']) {
        location = json['redirect'];
      }

      $form.find('.help.is-danger').remove();
      $form.find('.input.is-danger').removeClass('is-danger');

      if (json['error']) {
        if ($input) {
          if (json['error'][$input.attr('name')]) {
            $form.find('input[name="' + $input.attr('name') + '"], select[name="' + $input.attr('name') + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][$input.attr('name')] + '</p>');
            $form.find('input[name="' + $input.attr('name') + '"], select[name="' + $input.attr('name') + '"]').addClass('is-danger');
          }
        } else {
          for (let key in json['error']) {
            $form.find('input[name="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[id="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[name="' + key + '"]').addClass('is-danger');
            $form.find('input[id="' + key + '"]').addClass('is-danger');
          }
        }
      }

      if (json['added']) {
        $('#shipping-address').load('index.php?route=checkout/shipping_address', function () {
          $('#shipping-address').removeClass('is-hidden');
        });
      }

    },
    error: function (err) {
      console.error('AJAX Error:', err);
      notification({
        type: 'danger',
        text: 'Something went wrong while processing your request. Please try again.'
      });
    }
  });

  return result;

}

async function updatePickupPoint() {

  const $form = $('#shipping-pickup-form');

  const result = await $.ajax({
    url: 'index.php?route=checkout/shipping_address/save',
    type: 'post',
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () {
      $form.find('.select').removeClass('is-danger');
      $form.find('.select').addClass('is-loading');
    },
    success: function (json) {

      if (json['redirect']) {
        location = json['redirect'];
      }

      $form.find('.select').removeClass('is-loading');
      $form.find('.select').next().remove();

      if (json['error']) {
        $form.find('.select').addClass('is-danger');
        $form.find('.select').after('<p class="help is-danger">' + json['error']['pickup_point'] + '</p>');

        $('html, body').animate({ scrollTop: $('#checkout-layout p.help.is-danger').first().offset().top - 120 });
      }
    },
    error: function (err) {
      console.error('AJAX Error:', err);
      notification({
        type: 'danger',
        text: 'Something went wrong while processing your request. Please try again.'
      });
    }
  });

  return result;
}

async function updateShippingMethod() {

  const $form = $('#checkout-shipping-method form');

  let result = await $.ajax({
    url: 'index.php?route=checkout/shipping_method/save',
    type: 'post',
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () {
      spinner.add('#checkout-shipping', 'is-absolute', 100, 0.8);
    },
    success: function (json) {
      spinner.remove('#checkout-shipping');

      if (json['redirect']) {
        location = json['redirect'];
      }

      $('#checkout-shipping-method form > .title p').remove();

      $('#shipping-address').load('index.php?route=checkout/shipping_address', function () {
        $('#shipping-address').removeClass('is-hidden');
      });

      $('#checkout-total').load('index.php?route=checkout/total&ajax=1');
    },
    error: function (err) {
      console.error('AJAX Error:', err);
      notification({
        type: 'danger',
        text: 'Something went wrong while processing your request. Please try again.'
      });
    }
  });

  return result;

}

async function updatePaymentMethod() {
  const $form = $(this);

  const result = await $.ajax({
    url: '/index.php?route=checkout/payment_method/save',
    type: 'post',
    dataType: 'json',
    data: $form.serialize(),
    beforeSend: function () {

    },
    success: function (json) {

      if (json['redirect']) {
        location = json['redirect'];
      }

      $('#checkout-total').load('index.php?route=checkout/total&ajax=1');
      $('#checkout-payment form > .title p').remove();
    },
    error: function (err) {
      console.error('AJAX Error:', err);
      notification({
        type: 'danger',
        text: 'Something went wrong while processing your request. Please try again.'
      });
    }
  });

  return result;
}

async function confirmCheckout() {
  const $button = $(this);
  $button.addClass('is-loading');

  try {
    const customer = await updateCheckoutCustomer();
    if (!customer || !customer.done) {
      scrollToError();
      return;
    }

    if ($('#payment-address-form').length) {
      const payment = await updatePaymentAddress();
      if (!payment || !payment.done) {
        scrollToError();
        return;
      }
    }

    if ($('#shipping-pickup-form').length) {
      const pickup = await updatePickupPoint();
      if (!pickup || !pickup.done) {
        scrollToError();
        return;
      }
    } else if ($('#shipping-address-form').length) {
      const shipping = await updateShippingAddress();
      if (!shipping || !shipping.done) {
        scrollToError();
        return;
      }
    }

    if (!$('#checkout-shipping-method input[type="radio"]').is(':checked')) {
      $('#checkout-shipping-method form > .title p').remove();
      $('#checkout-shipping-method form > .title').append(
        '<p class="help is-danger">' + error_shipping + '</p>'
      );
      scrollToError();
      return;
    }

    if (!$('#checkout-payment input[type="radio"]').is(':checked')) {
      $('#checkout-payment form > .title p').remove();
      $('#checkout-payment form > .title').first().append(
        '<p class="help is-danger">' + error_payment + '</p>'
      );
      scrollToError();
      return;
    }

    $.ajax({
      url: 'index.php?route=checkout/confirm',
      dataType: 'html',
      cache: false,
      success: function (html) {
        $('#checkout-total .box').html(html);
      },
      error: function (err) {
        console.error('AJAX Error:', err);
        notification({
          type: 'danger',
          text: 'Something went wrong while processing your request. Please try again.'
        });
      }
    });

  } finally {
    $button.removeClass('is-loading');
  }
}

function getZoneList() {
  let $select = $(this);

  $.ajax({
    url: 'index.php?route=checkout/checkout/country&country_id=' + $select.val(),
    dataType: 'json',
    beforeSend: function () {
      $select.prop('disabled', true);
    },
    complete: function () {
      $select.prop('disabled', false);
    },
    success: function (json) {
      let html = '<option value="">' + text_select + '</option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == zone_id) {
            html += ' selected="selected"';
          }

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected">' + text_none + '</option>';
      }

      $select.parents('form').find('select[name="zone_id"]').html(html);
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}

function scrollToError() {
  const $firstError = $('#checkout-layout .help.is-danger').first();

  if ($firstError.length) {
    $('html, body').animate({
      scrollTop: $firstError.offset().top - 120
    }, 300);
  }
}
