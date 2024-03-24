$(document).ready(function () {

  $('body').on('blur', '#checkout-customer-form input', updateCheckoutCustomer);

  $('body').on('change', '#checkout-shipping-method form', updateShippingMethod);

  $('body').on('change', '#shipping-pickup-form', updatePickupPoint);

  $('body').on('change', 'select[name="country_id"]', getZoneList);

  $('body').on('blur', '#shipping-address-form input, #shipping-address-form select', updateShippingAddress);

  $('body').on('change', '#checkout-payment form', updatePaymentMethod);

  $('body').on('click', '#confirm-checkout', confirmCheckout);

  $('body').on('change', 'input[name="register"]', function () {
    if($(this).is(':checked')) {
      $('.create-account').removeClass('is-hidden');
    } else {
      $('.create-account').addClass('is-hidden');
      $('.create-account input[type="password"]').val('');
    }
  });

  $('body').on('change', 'input[name="shipping_address"]', ()=> {
    $('#new-shipping-address').toggleClass('is-hidden');
  });

});

async function updateCheckoutCustomer() {

  let $form = $('#checkout-customer-form');
  let action;

  if($('#checkout-customer-form input[name="register"]').length && !$('#checkout-customer-form input[name="register"]').is(':checked')) {
    action = 'guest/save';
  } else {
    action = 'register/save';
  }

  let $input = $(event.target).is('input') ? $(this) : false;

  let result = await $.ajax({
    type: 'post',
    url: '/index.php?route=checkout/' + action,
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () {},
    success: function (json) {

      if(json['redirect']) {
        location = json['redirect'];
      }

      $form.find('.help.is-danger').remove();
      $form.find('.input.is-danger').removeClass('is-danger');

      if($('.google-captcha').length) {
        $('.google-captcha').find('.help.is-danger').remove();
      }

      if(json['error']) {
        if($input) {
          if (json['error'][$input.attr('name')]) {
            $form.find('input[name="' + $input.attr('name') + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][$input.attr('name')] + '</p>');
            $form.find('input[name="' + $input.attr('name') + '"]').addClass('is-danger');
          }

          for(let key in json['error']) {
            if(json['error'][key]) {
              $form.find('input[id="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
              $form.find('input[id="' + key + '"]').addClass('is-danger');
            }
          }
        } else {
          for(let key in json['error']) {
            $form.find('input[name="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[id="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[name="' + key + '"]').addClass('is-danger');
            $form.find('input[id="' + key + '"]').addClass('is-danger');

            if($('.google-captcha').length && key == 'captcha') {
              $form.find('.google-captcha').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            }
          }
        }
      }

      if(json['registered']) {
        $('#checkout-customer').load('index.php?route=checkout/checkout #checkout-customer .box');
      }

      if(json['approval']) {
        notification({
          type: 'info',
          text: json['approval']
        })
      }

    },
    error: function (err) {
      console.log(err);
    }
  });

  return result;

}

async function updateShippingMethod(){

  $form = $('#checkout-shipping-method form');

  let result = await $.ajax({
    url: 'index.php?route=checkout/shipping_method/save',
    type: 'post',
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () {
      spinner.add('#checkout-shipping', 'is-absolute', 100, 0.8);
    },
    success: function(json){
      spinner.remove('#checkout-shipping');

      if(json['redirect']) {
        location = json['redirect'];
      }

      $('#checkout-shipping-method form > .title p').remove();

      $('#shipping-address').load('index.php?route=checkout/shipping_address', function () {
        $('#shipping-address').removeClass('is-hidden');
      });

      $('#checkout-total').load('index.php?route=checkout/total&ajax=1');
    }
  });

  return result;

}

async function updateShippingAddress() {

  let $form = $('#shipping-address-form');
  let $input = event && $(event.target).is('input') ? $(this) : false;

  let result = await $.ajax({
    type: 'post',
    url: '/index.php?route=checkout/shipping_address/save',
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () {},
    success: function (json) {

      if(json['redirect']) {
        location = json['redirect'];
      }

      $form.find('.help.is-danger').remove();
      $form.find('.input.is-danger').removeClass('is-danger');

      if(json['error']) {
        if($input) {
          if (json['error'][$input.attr('name')]) {
            $form.find('input[name="' + $input.attr('name') + '"], select[name="' + $input.attr('name') + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][$input.attr('name')] + '</p>');
            $form.find('input[name="' + $input.attr('name') + '"], select[name="' + $input.attr('name') + '"]').addClass('is-danger');
          }

          for(let key in json['error']) {
            if(json['error'][key]) {
              $form.find('input[id="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
              $form.find('input[id="' + key + '"]').addClass('is-danger');
            }
          }
        } else {
          for(let key in json['error']) {
            $form.find('input[name="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[id="' + key + '"]').parents('.field').append('<p class="help is-danger">' + json['error'][key] + '</p>');
            $form.find('input[name="' + key + '"]').addClass('is-danger');
            $form.find('input[id="' + key + '"]').addClass('is-danger');
          }
        }
      }

      if(json['added']) {
        $('#shipping-address').load('index.php?route=checkout/shipping_address', function () {
          $('#shipping-address').removeClass('is-hidden');
        });
      }

    },
  });

  return result;

}

async function updatePickupPoint(){

  $form = $('#shipping-pickup-form');

  let result = await $.ajax({
    url: 'index.php?route=checkout/shipping_address/save',
    type: 'post',
    data: $form.serialize(),
    dataType: 'json',
    cache: false,
    beforeSend: function () {
      $form.find('.select').removeClass('is-danger');
      $form.find('.select').addClass('is-loading');
    },
    success: function(json){

      if(json['redirect']) {
        location = json['redirect'];
      }

      $form.find('.select').removeClass('is-loading');
      $form.find('.select').next().remove();

      if(json['error']) {
        $form.find('.select').addClass('is-danger');
        $form.find('.select').after('<p class="help is-danger">'+ json['error']['pickup_point'] +'</p>');

        $('html, body').animate({scrollTop: $('#checkout-layout p.help.is-danger').first().offset().top - 120 });
      }
    }
  });

  return result;
}

async function updatePaymentMethod () {
  let $form = $(this);

  let result = await $.ajax({
    url: '/index.php?route=checkout/payment_method/save',
    type: 'post',
    dataType: 'json',
    data: $form.serialize(),
    beforeSend: function () {

    },
    success: function (json) {

      if(json['redirect']) {
        location = json['redirect'];
      }

      $('#checkout-payment form > .title p').remove();
    }
  });

  return result;
}

async function confirmCheckout() {

  let $button = $(this);
  let proceed = false;

  $button.addClass('is-loading');

  await updateCheckoutCustomer().then(response => {
    proceed = response.done ? true : false;
  });

  if(proceed && $('#checkout-shipping-method input[type="radio"]').is(':checked')) {

    if($('#shipping-pickup-form').length) {
      await updatePickupPoint().then(response => {
        proceed = response.done ? true : false;
        proceed ? $button.removeClass('is-loading') : '';
      })
    }

    if($('#shipping-address-form').length) {
      await updateShippingAddress().then(response => {
        proceed = response.done ? true : false;
        proceed ? $button.removeClass('is-loading') : '';
      })
    }

    $('#checkout-shipping-method form > .title p').remove();
  } else {
    $button.removeClass('is-loading');
    $('#checkout-shipping-method form > .title p').remove();
    $('#checkout-shipping-method form > .title').append('<p class="help is-danger">' + error_shipping + '</p>');
  }

  if(!$('#checkout-payment input[type="radio"]').is(':checked')) {
    $('#checkout-payment form > .title p').remove();
    $('#checkout-payment form > .title').first().append('<p class="help is-danger">' + error_payment + '</p>');
    proceed = false;
    $button.removeClass('is-loading');
  }

  if(proceed) {
    $.ajax({
      url: 'index.php?route=checkout/confirm',
      dataType: 'html',
      cache: false,
      success: function (html) {
        $('#checkout-total .box').html(html);
      }
    })
  } else {
    $('html, body').animate({scrollTop: $('#checkout-layout p.help.is-danger').first().offset().top - 120 });
  }
}

function getZoneList() {
  let select = $(this);

  $.ajax({
    url: 'index.php?route=checkout/checkout/country&country_id=' + select.val(),
    dataType: 'json',
    beforeSend: function() {
      select.prop('disabled', true);
    },
    complete: function() {
      select.prop('disabled', false);
    },
    success: function(json) {
      html = '<option value="">' + text_select + '</option>';

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

      $('#new-shipping-address select[name="zone_id"]').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}
