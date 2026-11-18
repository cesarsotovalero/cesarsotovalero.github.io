// Click/tap an image in a blog post to see it magnified in an overlay.
// Skips linked images, small images (icons, badges), and images with the "no-zoom" class.
(function () {
  'use strict';

  var MIN_WIDTH = 120;
  var overlay, overlayImg, lastFocus, currentImg;

  function buildOverlay() {
    overlay = document.createElement('div');
    overlay.className = 'img-zoom-overlay';
    overlay.setAttribute('role', 'dialog');
    overlay.setAttribute('aria-modal', 'true');
    overlay.setAttribute('aria-label', 'Magnified image');
    overlay.hidden = true;

    var close = document.createElement('button');
    close.type = 'button';
    close.className = 'img-zoom-close';
    close.setAttribute('aria-label', 'Close magnified image');
    close.innerHTML = '&times;';

    overlayImg = document.createElement('img');
    overlayImg.className = 'img-zoom-image';

    overlay.appendChild(close);
    overlay.appendChild(overlayImg);
    document.body.appendChild(overlay);

    overlay.addEventListener('click', closeZoom);
    document.addEventListener('keydown', function (e) {
      if (!overlay.hidden && (e.key === 'Escape' || e.key === 'Esc')) closeZoom();
    });
    window.addEventListener('resize', function () {
      if (!overlay.hidden) sizeOverlayImage(currentImg, overlayImg.src);
    });
  }

  function openZoom(img) {
    if (!overlay) buildOverlay();
    lastFocus = document.activeElement;
    currentImg = img;
    var src = img.currentSrc || img.src;
    overlayImg.src = src;
    overlayImg.alt = img.alt || '';
    overlay.hidden = false;
    sizeOverlayImage(img, src);
    document.documentElement.classList.add('img-zoom-open');
    overlay.querySelector('.img-zoom-close').focus();
  }

  // Fit the image to the viewport keeping its aspect ratio. Vector images scale cleanly,
  // so they may grow past their natural size; rasters may not (they would get blurry).
  function sizeOverlayImage(img, src) {
    var rect = img.getBoundingClientRect();
    var ratio = (img.naturalWidth && img.naturalHeight)
      ? img.naturalWidth / img.naturalHeight
      : rect.width / rect.height;
    var maxW = window.innerWidth * 0.96;
    var maxH = window.innerHeight * 0.96;
    var width = Math.min(maxW, maxH * ratio);
    // On narrow screens fitting barely enlarges the image; show it bigger and let the reader pan.
    if (width < rect.width * 1.25) width = rect.width * 2;
    if (!/\.svg(\?|#|$)/i.test(src) && img.naturalWidth) {
      width = Math.min(width, Math.max(img.naturalWidth, rect.width));
    }
    overlayImg.style.width = Math.round(width) + 'px';
    overlayImg.style.height = Math.round(width / ratio) + 'px';
  }

  function closeZoom() {
    overlay.hidden = true;
    overlayImg.removeAttribute('src');
    document.documentElement.classList.remove('img-zoom-open');
    if (lastFocus && lastFocus.focus) lastFocus.focus();
  }

  function percentWidth(img) {
    var w = img.style.width || img.getAttribute('width') || '';
    return /%$/.test(w.trim()) ? w.trim() : null;
  }

  function makeZoomable(img) {
    if (img.closest('a, .no-zoom, .img-zoom-wrap') || img.classList.contains('no-zoom')) return;
    if (img.getBoundingClientRect().width < MIN_WIDTH) return;

    var wrap = document.createElement('span');
    wrap.className = 'img-zoom-wrap';
    wrap.setAttribute('role', 'button');
    wrap.setAttribute('tabindex', '0');
    wrap.setAttribute('aria-label', 'Magnify image' + (img.alt ? ': ' + img.alt : ''));

    // A percentage width must move to the wrapper, otherwise it resolves against the shrink-wrapped span.
    var pct = percentWidth(img);
    if (pct) {
      wrap.style.width = pct;
      img.style.width = '100%';
    }

    var icon = document.createElement('span');
    icon.className = 'img-zoom-icon';
    icon.setAttribute('aria-hidden', 'true');
    icon.innerHTML =
      '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">' +
      '<circle cx="11" cy="11" r="7"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>' +
      '<line x1="11" y1="8" x2="11" y2="14"/><line x1="8" y1="11" x2="14" y2="11"/></svg>';

    img.parentNode.insertBefore(wrap, img);
    wrap.appendChild(img);
    wrap.appendChild(icon);

    wrap.addEventListener('click', function () { openZoom(img); });
    wrap.addEventListener('keydown', function (e) {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        openZoom(img);
      }
    });
  }

  function init() {
    document.querySelectorAll('.blog-post img').forEach(function (img) {
      if (img.complete) {
        makeZoomable(img);
      } else {
        img.addEventListener('load', function () { makeZoomable(img); }, { once: true });
      }
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
