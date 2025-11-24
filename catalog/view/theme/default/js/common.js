const spinner = {

  add: function (parent, position = 'is-absolute', size = 100, opacity = 1) {
    const markup = `<div class="loading"><div class="spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>`;

    if (!$(parent).find('.loading').length) {
      $(parent).append(markup);
    }

    $(parent).find('.loading').addClass(position);

    if (size != 100) {
      $(parent).find('.spinner').attr('style', 'transform: scale(' + size + '%)');
    }

    if (opacity != 1) {
      $(parent).find('.loading').attr('style', 'opacity:' + opacity);
    }

  },

  remove: function (parent) {
    $(parent).find('.loading').remove();
  }

};

const cart = {
  add: function (product_id, quantity, $trigger) {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: 'product_id=' + product_id + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1),
      dataType: 'json',
      cache: false,
      beforeSend: function () {
        $trigger.addClass('is-loading');
      },
      complete: function () {
        $trigger.removeClass('is-loading');
      },
      success: function (json) {

        if (json['redirect']) {
          location = json['redirect'];
        }

        if (json['success']) {

          updateCartBadge(json['total']);

          notification({
            type: 'success',
            text: json['success'],
          });

        }
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  },
  update: function (key, quantity) {
    $.ajax({
      url: 'index.php?route=checkout/cart/edit',
      type: 'post',
      data: 'key=' + key + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1),
      dataType: 'json',
      beforeSend: function () {
        spinner.add('.cart-products .panel', 'is-absolute', 100, 0.8);
      },
      success: function (json) {
        updateCartBadge(json['total']);

        if ($('#cart-page').length) {
          $('#cart-content').load('index.php?route=checkout/cart #cart-content');
        }
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  },
  remove: function (key, $trigger) {
    $.ajax({
      url: 'index.php?route=checkout/cart/remove',
      type: 'post',
      data: 'key=' + key,
      dataType: 'json',
      beforeSend: function () {
        $trigger.addClass('is-loading');
      },
      success: function (json) {
        updateCartBadge(json['total']);

        if ($('#cart-page').length) {
          $('#cart-content').load('index.php?route=checkout/cart #cart-content');
        }
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  }
}

const compare = {
  add: function (product_id, $trigger) {
    $.ajax({
      url: 'index.php?route=product/compare/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      beforeSend: function () {
        $trigger ? $trigger.addClass('is-loading') : '';
      },
      success: function (json) {
        $trigger ? $trigger.removeClass('is-loading') : '';

        if (json['success']) {
          updateCompareBadge(json['total']);

          notification({
            type: 'success',
            text: json['success'],
          });
        }

      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      },
      complete: function () {
        $trigger.removeClass('is-loading');
      }
    });
  },
  remove: function () {

  }
}

const wishlist = {
  add: function (product_id, $trigger) {
    $.ajax({
      url: 'index.php?route=account/wishlist/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      beforeSend: function () {
        $trigger ? $trigger.addClass('is-loading') : '';
      },
      success: function (json) {
        $trigger ? $trigger.removeClass('is-loading') : '';

        if (json['redirect']) {
          location = json['redirect'];
        }

        if (json['success']) {
          updateWishlistBadge(json['total']);

          notification({
            type: 'success',
            text: json['success'],
          });
        }

      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  },
  remove: function () {

  }
}

function notification(params = {}) {

  if (!$('#notifications').length) {
    $('body').append('<div id="notifications"></div>');
  };

  let type = params.type ? params.type : '';
  let text = params.text ? params.text : '';
  let htmlClass = '';
  let id = Date.now();

  switch (type) {
    case 'primary':
      htmlClass = 'notification is-primary is-clickable';
      break;
    case 'link':
      htmlClass = 'notification is-link is-clickable';
      break;
    case 'info':
      htmlClass = 'notification is-info is-clickable';
      break;
    case 'success':
      htmlClass = 'notification is-success is-clickable';
      break;
    case 'warning':
      htmlClass = 'notification is-warning is-clickable';
      break;
    case 'danger':
      htmlClass = 'notification is-danger is-clickable';
      break;
    default:
      htmlClass = 'notification is-clickable';
  }

  $('#notifications').append('<div class="' + htmlClass + '" data-id="' + id + '">' + text + '<button class="delete"></button></div>').hide().fadeIn(200);

  setTimeout(function () {
    $('#notifications .notification[data-id="' + id + '"]').fadeOut(200, function () {
      $(this).remove();
    })
  }, 5000)
}

function updateCartBadge(value) {
  if (value == undefined && $('.cart-icon .badge').text() > 0) {
    $('.cart-icon .badge').addClass('shown');
  } else if (value > 0) {
    $('.cart-icon .badge').text(value);
    $('.cart-icon .badge').addClass('shown');
  } else {
    $('.cart-icon .badge').text(0);
    $('.cart-icon .badge').removeClass('shown');
  }
};

function updateCompareBadge(value) {
  if (value == undefined && $('.compare .badge').text() > 0) {
    $('.compare .badge').addClass('shown');
  } else if (value > 0) {
    $('.compare .badge').text(value);
    $('.compare .badge').addClass('shown');
  } else {
    $('.compare .badge').text(0);
    $('.compare .badge').removeClass('shown');
  }
};

function updateWishlistBadge(value) {
  if (value == undefined && $('.wishlist .badge').text() > 0) {
    $('.wishlist .badge').addClass('shown');
  } else if (value > 0) {
    $('.wishlist .badge').text(value);
    $('.wishlist .badge').addClass('shown');
  } else {
    $('.wishlist .badge').text(0);
    $('.wishlist .badge').removeClass('shown');
  }
};

function validateEmailUniqueness($input) {
  if ($input.attr('type') == 'email' && $input.val().length > 3) {
    $.ajax({
      method: 'post',
      url: 'index.php?route=account/register/validateEmailUniqueness',
      data: $input,
      dataType: 'json',
      success: function (json) {
        $input.parents('.field').find('.help.is-danger').remove();
        $input.removeClass('is-danger');

        if (json['existed']) {
          $input.parents('.field').append('<p class="help is-danger">' + json['error'] + '</p>');
          $input.addClass('is-danger');
        }
      }
    });
  }
}

$(document).ready(function () {

  updateCartBadge();
  updateCompareBadge();
  updateWishlistBadge();

  // add product to cart from anywhere
  $('body').on('click', '.add-to-cart', function () {
    cart.add($(this).data('product_id'), $(this).data('minimum'), $(this));
  });

  // add product to compare
  $('body').on('click', '.add-to-compare', function () {
    compare.add($(this).data('product_id'), $(this));
  });

  // add product to wishlist
  $('body').on('click', '.add-to-wishlist', function () {
    wishlist.add($(this).data('product_id'), $(this));
  });

  // update cart
  $('body').on('change', '.input-quantity', function (e) {
    e.preventDefault();
    setTimeout(() => {
      cart.update($(this).data('key'), $(this).val());
    }, 10);

  });

  $('body').on('keydown', '.input-quantity', function (e) {
    if (e.keyCode == 13) {
      e.preventDefault();
      setTimeout(() => {
        cart.update($(this).data('key'), $(this).val());
      }, 10);
    }
  });

  // delete product from cart
  $('body').on('click', '.cart-delete-product', function () {
    cart.remove($(this).data('key'), $(this));
  });

  //counters
  $('body').on('click', '.minus, .plus', function () {
    if ($(this).attr('class').includes('minus')) {
      let input = $(this).parents('.field').find('input');
      let actual = +input.val();
      if (actual > 1) {
        input.val(actual - 1);
        input.change();
      }
    }
    if ($(this).attr('class').includes('plus')) {
      let input = $(this).parents('.field').find('input');
      let actual = +input.val();
      input.val(actual + 1);
      input.change();
    }
  });

  // mobile menu trigger
  $('body').on('click', '.mobile-menu-trigger', function (e) {
    e.stopPropagation();
    $('#menu').toggleClass('shown');
    $('.mobile-menu-trigger').toggleClass('shown');
  });

  $('body').on('click', '#menu .modal-background, #menu.shown', function (e) {
    if (!$(e.target).closest('.mobile-menu-trigger').length) {
      $('#menu').removeClass('shown');
      $('.mobile-menu-trigger').removeClass('shown');
    }
  });

  $('body').on('click', '.cart-trigger, #cart-modal .delete, #cart-modal .modal-background', function () {
    $('#cart-modal').toggleClass('is-active');
  });

  $('body').on('click', '.login-trigger, #login-modal .delete, #login-modal .modal-background', function (e) {
    if ($(e.currentTarget).hasClass('modal-background') || $(e.currentTarget).hasClass('delete')) {
      $('#login-modal').addClass('is-animated');

      $('#login-modal .modal-background').one('animationend', function () {
        $('#login-modal').removeClass('is-animated is-active');
        history.replaceState(null, null, window.location.pathname + window.location.search);
      });
    } else {
      $('#login-modal').addClass('is-active');
      history.pushState(null, null, window.location.pathname + '#login-modal');
    }
    const trigger = $(this);

    if ($('#login-modal .modal-card .loading').length) {
      $('#login-modal .modal-card').load('/index.php?route=account/login/modal', function () {
        if (trigger.data('redirect')) {
          $('#login-modal form').find('input[name="redirect"]').val(window.location.origin + trigger.data('redirect'));
        }
      });
    }
  });

  $('body').on('click', '#notifications .notification', function () {
    $(this).fadeOut(200);
  });

  // score
  $('body').on('click', '.score .tag', function () {
    $(this).siblings().removeClass('is-active');
    $(this).addClass('is-active');

    $(this).parent().find('input[name="rating"]').val($(this).data('score'));
  });

  // Currency
  $('#form-currency').on('change', function (e) {
    $('#form-currency').submit();
  });

  // Language
  $('#form-language').on('change', function (e) {
    $('#form-language').submit();
  });

  // Product List
  $('#list-view').click(function () {
    $('.product-cards').attr('class', 'columns is-mobile is-multiline mt-3 product-cards list');

    let columns = $('#column-right, #column-left').length;

    if (columns == 2) {
      $('.product-cards > div').attr('class', 'column is-12-fullhd is-12-widescreen is-12-desktop is-12-tablet is-12-mobile');
    } else if (columns == 1) {
      $('.product-cards > div').attr('class', 'column is-6-fullhd is-6-widescreen is-12-desktop is-12-tablet is-12-mobile');
    } else {
      $('.product-cards > div').attr('class', 'column is-6-fullhd is-6-widescreen is-12-desktop is-12-tablet is-12-mobile');
    }

    localStorage.setItem('display', 'list');
  });

  // Product Grid
  $('#grid-view').click(function () {
    $('.product-cards').attr('class', 'columns is-mobile is-multiline mt-3 product-cards grid');

    let columns = $('#column-right, #column-left').length;

    if (columns == 2) {
      $('.product-cards > div').attr('class', 'column is-6-fullhd is-6-widescreen is-12-desktop is-6-tablet is-12-mobile');
    } else if (columns == 1) {
      $('.product-cards > div').attr('class', 'column is-4-fullhd is-6-widescreen is-6-desktop is-6-tablet is-12-mobile');
    } else {
      $('.product-cards > div').attr('class', 'column is-3-fullhd is-4-widescreen is-6-desktop is-6-tablet is-12-mobile');
    }

    localStorage.setItem('display', 'grid');
  });

  if (localStorage.getItem('display') == 'list') {
    $('#list-view').trigger('click');
  } else {
    $('#grid-view').trigger('click');
  }

  $('.mobile-contacts-trigger').on('click', function () {
    $(this).parent().find('.mobile-contacts-list').toggleClass('shown');
    $(this).toggleClass('shown');

    if ($(this).hasClass('has-background-success')) {
      $(this).removeClass('has-background-success');
      $(this).addClass('has-background-danger');
    } else {
      $(this).removeClass('has-background-danger');
      $(this).addClass('has-background-success');
    }
  });

  let phone_scroll_point = $('header').height();

  $(this).on('scroll', function () {

    if (phone_scroll_point < $(this).scrollTop()) {
      $('.mobile-contacts').addClass('shown');
    } else {
      $('.mobile-contacts').removeClass('shown');
    }
  });

  let scrolled = 500;

  $(window).on('scroll', function () {
    if (scrolled < $(this).scrollTop()) {
      $('.scroll-top-trigger').addClass('shown');
    } else {
      $('.scroll-top-trigger').removeClass('shown');
    }
  });

  $(window).on('popstate', function (e) {
    // close modals on popstate
    let $opened = $('.modal.is-active');

    if ($opened.length) {
      let id = $opened.attr('id');
      let hash = '#' + id;

      if (window.location.hash !== hash) {
        $opened.addClass('is-animated');
        $opened.find('.modal-background').one('animationend', () => {
          $opened.removeClass('is-animated is-active')
        });
      }
    }
  });

  if (window.location.hash.includes('-modal')) {
    $(window.location.hash).addClass('is-active');
  }

  $('.scroll-top-trigger').on('click', function () {
    $('html, body').animate({ scrollTop: 0 }, 500);
  });

  $('body').on('click', '.agree', function (e) {
    $('#agree-modal').remove();

    let trigger = this;

    $.ajax({
      url: $(trigger).attr('href'),
      type: 'get',
      dataType: 'html',
      success: function (data) {
        html = '<div id="agree-modal" class="modal">';
        html += '  <div class="modal-background"></div>';
        html += '  <div class="modal-card is-relative" style="width:100%; max-width: 1366px;">';
        html += '    <div class="modal-card-body">';
        html += '       <div class="content">' + data + '</div>';
        html += '    </div>';
        html += '  	<button class="delete is-large is-absolute"></button>';
        html += '  </div>';
        html += '</div>';

        $('body').append(html);

        $('#agree-modal').addClass('is-active');

        $('#agree-modal .modal-background, #agree-modal, #agree-modal .delete').click(function (e) {
          if ($(e.currentTarget).hasClass('modal-background') || $(e.currentTarget).hasClass('delete')) {
            $('#agree-modal').addClass('is-animated');

            $('#agree-modal .modal-background').one('animationend', function () {
              $('#agree-modal').removeClass('is-animated is-active');
              $('#agree-modal').remove();
            });
          }
        });
      }
    });

    return false;
  });

});

// Autocomplete */
(function ($) {
  $.fn.autocomplete = function (option) {
    return this.each(function () {
      this.timer = null;
      this.items = new Array();

      $.extend(this, option);

      $(this).attr('autocomplete', 'off');

      // Focus
      $(this).on('focus', function () {
        this.request();
      });

      // Blur
      $(this).on('blur', function () {
        setTimeout(function (object) {
          object.hide();
        }, 200, this);
      });

      // Keydown
      $(this).on('keydown', function (event) {
        switch (event.keyCode) {
          case 27: // escape
            this.hide();
            break;
          default:
            this.request();
            break;
        }
      });

      // Click
      this.click = function (event) {
        event.preventDefault();

        value = $(event.target).parent().attr('data-value');

        if (value && this.items[value]) {
          this.select(this.items[value]);
        }
      }

      // Show
      this.show = function () {
        var pos = $(this).position();

        $(this).siblings('ul.dropdown-menu').css({
          top: pos.top + $(this).outerHeight(),
          left: pos.left
        });

        $(this).siblings('ul.dropdown-menu').show();
      }

      // Hide
      this.hide = function () {
        $(this).siblings('ul.dropdown-menu').hide();
      }

      // Request
      this.request = function () {
        clearTimeout(this.timer);

        this.timer = setTimeout(function (object) {
          object.source($(object).val(), $.proxy(object.response, object));
        }, 200, this);
      }

      // Response
      this.response = function (json) {
        html = '';

        if (json.length) {
          for (i = 0; i < json.length; i++) {
            this.items[json[i]['value']] = json[i];
          }

          for (i = 0; i < json.length; i++) {
            if (!json[i]['category']) {
              html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
            }
          }

          // Get all the ones with a categories
          var category = new Array();

          for (i = 0; i < json.length; i++) {
            if (json[i]['category']) {
              if (!category[json[i]['category']]) {
                category[json[i]['category']] = new Array();
                category[json[i]['category']]['name'] = json[i]['category'];
                category[json[i]['category']]['item'] = new Array();
              }

              category[json[i]['category']]['item'].push(json[i]);
            }
          }

          for (i in category) {
            html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

            for (j = 0; j < category[i]['item'].length; j++) {
              html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
            }
          }
        }

        if (html) {
          this.show();
        } else {
          this.hide();
        }

        $(this).siblings('ul.dropdown-menu').html(html);
      }

      $(this).after('<ul class="dropdown-menu"></ul>');
      $(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

    });
  }
})(window.jQuery);

function previewManager(config = {}) {

  if (!config.container) {
    throw new Error('Container selector is required for previewManager');
  }

  if (!config.maxSize) {
    throw new Error('Max size is required for previewManager');
  }

  if (!config.allowedMimes) {
    throw new Error('Allowed MIME types are required for previewManager');
  }

  const $container = $(config.container);
  let queue = {};

  function createPreviewElement(file, id, dataURL) {

    const item = $(document.createElement('div')).addClass('is-flex is-align-items-center is-justify-content-space-between mb-2');
    const name = $(document.createElement('p')).addClass('has-text-grey');
    name.html('<span class="text">' + file.name + '</span><span class="ml-3 tag is-info is-light">' + formatBytes(file.size) + '</span>');
    const remove = $(document.createElement('span')).addClass('delete');

    item.attr('id', id);

    if (file.type.startsWith('image/') && dataURL) {
      const img = $(document.createElement('img')).attr('src', dataURL).addClass('mr-3').css({
        'width': '48px',
        'height': '48px',
        'object-fit': 'cover',
        'border-radius': '0.25rem'
      });
      name.prepend(img);
    }

    item.append(name);
    item.append(remove);

    return item;
  }

  function validateFile(file) {

    if (config.maxFiles && Object.keys(queue).length >= config.maxFiles) {
      const error = text_files_limit_error + config.maxFiles;
      $container.prev('.help.is-danger').remove();
      $container.before('<div class="help is-danger">' + error + '</div>');
      return false;
    }

    if (config.allowedMimes.length && !config.allowedMimes.includes(file.type)) {
      const error = text_files_type_error + config.allowedMimes.join(', ');
      $container.prev('.help.is-danger').remove();
      $container.before('<div class="help is-danger">' + error + '</div>');
      return false;
    }
    if (file.size > config.maxSize) {
      const error = text_files_size_error + formatBytes(config.maxSize);
      $container.prev('.help.is-danger').remove();
      $container.before('<div class="help is-danger">' + error + '</div>');
      return false;
    }
    return true;
  }

  const manager = {
    addFile: function (file) {

      $container.prev('.help.is-danger').remove();

      if (!validateFile(file)) return;

      $container.addClass('mt-5');

      const reader = new FileReader();
      const id = 'file' + Math.floor(Math.random() * 1000000);

      queue[id] = file;

      reader.addEventListener('load', function (e) {
        const item = createPreviewElement(file, id, e.target.result);
        $container.append(item);
      });

      reader.readAsDataURL(file);
    },

    removeFile: function (id) {
      delete queue[id];
      $container.find('#' + id).remove();
      if (Object.keys(queue).length === 0) {
        $container.removeClass('mt-5').empty();
      }
    },

    getQueue: function () {
      return { ...queue };
    },

    reset: function () {
      queue = {};
      $container.removeClass('mt-5').empty();
      $container.prev('.help.is-danger').remove();
    }
  };

  $container.on('click', '.delete', function (e) {
    const id = $(this).parents('.is-flex').attr('id');
    manager.removeFile(id);
  });

  return manager;
}

function getURLVar(key) {
  var value = [];

  var query = String(document.location).split('?');

  if (query[1]) {
    var part = query[1].split('&');

    for (i = 0; i < part.length; i++) {
      var data = part[i].split('=');

      if (data[0] && data[1]) {
        value[data[0]] = data[1];
      }
    }

    if (value[key]) {
      return value[key];
    } else {
      return '';
    }
  }
}

function formatBytes(bytes, decimals = 2) {
  if (!+bytes) return '0 Bytes';

  const k = 1024;
  const dm = decimals < 0 ? 0 : decimals;
  const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

  const i = Math.floor(Math.log(bytes) / Math.log(k));

  return `${parseFloat((bytes / Math.pow(k, i)).toFixed(dm))} ${sizes[i]}`;
}

function copyToClipboard(element) {
  let $hidden = $('<input type="text" value=""  />');
  $('body').append($hidden);
  $hidden.val($(element).text().trim()).select();
  document.execCommand("copy");
  $hidden.remove();
}
