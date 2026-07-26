(function ($) {
  "use strict";

  function clamp(value, min, max) {
    return Math.max(min, Math.min(max, value));
  }

  function initCaptcha($root) {
    const $slider = $root.find(".slider-container");
    const $thumb = $root.find(".slider-thumb");
    const $track = $root.find(".slider-track");
    const $target = $root.find(".target-circle");
    const $progress = $root.find(".progress-text");
    const $token = $root.find(".captcha-token");

    if (
      !$slider.length ||
      !$thumb.length ||
      !$track.length ||
      !$target.length
    ) {
      return;
    }

    const $form = $root.closest("form");
    if ($form.length) {
      $form.on("reset", function () {
        loadNewChallenge();
      });
    }

    let module = parseInt($root.data("module"), 10) || 0;
    let challengeId = String($root.data("challenge-id") || "");
    let targetPercent = parseFloat($root.data("target") || "50");
    let tolerancePercent = parseFloat($root.data("tolerance") || "3");
    const validateUrl = String($root.data("validate-url") || "");
    const challengeUrl = String($root.data("challenge-url") || "");
    const lang = $root.data("lang");

    const leftOffset = 4;
    let dragging = false;
    let checking = false;
    let completed = false;
    let lastIsTrusted = false;

    if ($root.is(":hidden") || $slider.width() === 0) {
      const checkVisibility = setInterval(() => {
        if ($root.is(":visible") && $slider.width() > 0) {
          clearInterval(checkVisibility);
          updateTargetPosition();
          moveThumbTo(leftOffset);
        }
      }, 10);
    }

    function getMetrics() {
      const sliderWidth = $slider[0].clientWidth;
      const thumbWidth = $thumb[0].offsetWidth;
      const targetWidth = $target[0].offsetWidth;
      const maxLeft = Math.max(
        leftOffset,
        sliderWidth - thumbWidth - leftOffset,
      );

      return {
        sliderWidth: sliderWidth,
        thumbWidth: thumbWidth,
        targetWidth: targetWidth,
        maxLeft: maxLeft,
        travel: Math.max(1, maxLeft - leftOffset),
      };
    }

    function getTargetLeft(metrics) {
      const startCenter = leftOffset + metrics.thumbWidth / 2;
      const endCenter = metrics.maxLeft + metrics.thumbWidth / 2;
      const targetCenter =
        startCenter +
        ((endCenter - startCenter) * clamp(targetPercent, 0, 100)) / 100;

      return targetCenter - metrics.targetWidth / 2;
    }

    function setProgressState(message, stateClass) {
      $progress.text(message);
      $progress.removeClass("success fail loading");
      if (stateClass) {
        $progress.addClass(stateClass);
      }
    }

    function updateTargetPosition() {
      const metrics = getMetrics();
      $target.css("left", getTargetLeft(metrics) + "px");
    }

    function moveThumbTo(left) {
      const metrics = getMetrics();
      const normalizedLeft = clamp(left, leftOffset, metrics.maxLeft);
      const progressPercent =
        ((normalizedLeft - leftOffset) / metrics.travel) * 100;

      $thumb.css("left", normalizedLeft + "px");
      $track.css("width", progressPercent + "%");

      const thumbCenter = normalizedLeft + metrics.thumbWidth / 2;
      const targetCenter = getTargetLeft(metrics) + metrics.targetWidth / 2;
      const inTarget =
        Math.abs(thumbCenter - targetCenter) <= metrics.targetWidth / 2 + 3;

      if (inTarget) {
        $target.addClass("active");
        setProgressState(lang.release);
      } else {
        $target.removeClass("active");
        setProgressState(lang.drag);
      }
    }

    function pointerToLeft(clientX) {
      const rect = $slider[0].getBoundingClientRect();
      const thumbWidth = $thumb[0].offsetWidth;
      return clientX - rect.left - thumbWidth / 2;
    }

    function getFinalData() {
      const metrics = getMetrics();
      const currentLeft = parseFloat($thumb.css("left")) || leftOffset;
      const relativeLeft = clamp(currentLeft - leftOffset, 0, metrics.travel);
      const finalPercent = (relativeLeft / metrics.travel) * 100;

      return {
        final_percent: finalPercent,
        final_px: relativeLeft,
        track_width_px: metrics.sliderWidth,
        thumb_width_px: metrics.thumbWidth,
      };
    }

    function setSuccess(token) {
      completed = true;
      checking = false;
      $thumb.removeClass("dragging fail").addClass("success");
      $target.removeClass("active fail").addClass("success");
      $slider.removeClass("shake");
      setProgressState(lang.success, "success");
      if (token) {
        $token.val(token);
        $token.trigger('change');
      }
    }

    function resetSliderToStart() {
      completed = false;
      dragging = false;
      checking = false;
      $thumb.removeClass("dragging success fail");
      $target.removeClass("active success fail");
      $slider.removeClass("shake");
      $token.val("");
      $thumb.css("left", leftOffset + "px");
      $track.css("width", "0%");
      setProgressState(lang.drag);
    }

    function loadNewChallenge() {
      $.getJSON(challengeUrl)
        .done(function (json) {
          if (!json || !json.success) {
            setProgressState(lang.challengeError, "fail");
            return;
          }

          challengeId = String(json.challenge_id || "");
          targetPercent = parseFloat(json.target_percent || 50);
          tolerancePercent = parseFloat(
            json.tolerance_percent || tolerancePercent,
          );

          $root.data("challenge-id", challengeId);
          $root.data("target", targetPercent);
          $root.data("tolerance", tolerancePercent);

          resetSliderToStart();
          updateTargetPosition();
          setProgressState(lang.challengeNew);

          setTimeout(function () {
            if (!completed && !checking) {
              setProgressState(lang.drag);
            }
          }, 700);
        })
        .fail(function () {
          setProgressState(lang.challengeError, "fail");
        });
    }

    function handleValidationFail(message) {
      checking = false;
      completed = false;
      $thumb.removeClass("dragging success").addClass("fail");
      $target.removeClass("active success").addClass("fail");
      $slider.addClass("shake");
      setProgressState(message || lang.fail, "fail");

      setTimeout(function () {
        loadNewChallenge();
      }, 1000);
    }

    function verify() {
      if (checking || completed || !validateUrl || !challengeId || !module) {
        return;
      }

      checking = true;
      setProgressState(lang.checking, "loading");

      const payload = getFinalData();
      payload.module = module;
      payload.challenge_id = challengeId;
      payload.is_trusted = lastIsTrusted ? 1 : 0;

      $.ajax({
        url: validateUrl,
        type: "POST",
        dataType: "json",
        data: payload,
      })
        .done(function (json) {
          if (json && json.success) {
            setSuccess(json.token || "");
          } else {
            handleValidationFail(json && json.error ? json.error : lang.fail);
          }
        })
        .fail(function () {
          handleValidationFail(lang.challengeError);
        });
    }

    function readClientX(event) {
      const original = event.originalEvent || event;
      if (original.touches && original.touches.length) {
        return original.touches[0].clientX;
      }
      if (original.changedTouches && original.changedTouches.length) {
        return original.changedTouches[0].clientX;
      }
      return event.clientX;
    }

    $thumb.on("mousedown touchstart", function (event) {
      if (checking || completed) {
        return;
      }
      event.preventDefault();
      dragging = true;
      lastIsTrusted = !!(event.originalEvent || event).isTrusted;
      $thumb.addClass("dragging");
      moveThumbTo(pointerToLeft(readClientX(event)));
    });

    $(document).on("mousemove touchmove", function (event) {
      if (!dragging || checking || completed) {
        return;
      }
      event.preventDefault();
      moveThumbTo(pointerToLeft(readClientX(event)));
    });

    $(document).on("mouseup touchend", function () {
      if (!dragging) {
        return;
      }
      dragging = false;
      $thumb.removeClass("dragging");
      verify();
    });

    $(window).on("resize", function () {
      if (checking || completed) {
        return;
      }
      updateTargetPosition();
      moveThumbTo(parseFloat($thumb.css("left")) || leftOffset);
    });

    updateTargetPosition();
    resetSliderToStart();
  }

  $(function () {
    $(".excaptcha").each(function () {
      initCaptcha($(this));
    });
  });
})(jQuery);
