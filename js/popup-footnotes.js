// Footnote previews: hovering (or focusing) a footnote reference shows the note in a small box next to it.
// Plain JavaScript; the look is in css/main.css (#footnotediv).
(function () {
  'use strict';

  var hideTimer = null;
  var box = null;

  function remove() {
    if (box) box.remove();
    box = null;
  }

  function scheduleRemove() {
    clearTimeout(hideTimer);
    hideTimer = setTimeout(remove, 100);
  }

  function show(link) {
    clearTimeout(hideTimer);
    remove();
    var id = decodeURIComponent((link.getAttribute('href') || '').slice(1));
    var note = id && document.getElementById(id);
    if (!note) return;

    box = document.createElement('div');
    box.id = 'footnotediv';
    box.setAttribute('role', 'note');
    box.innerHTML = note.innerHTML;
    box.querySelectorAll('.reversefootnote, a[rev="footnote"]').forEach(function (back) { back.remove(); });
    box.addEventListener('mouseover', function () { clearTimeout(hideTimer); });
    box.addEventListener('mouseout', scheduleRemove);
    document.body.appendChild(box);

    // Below the reference, kept inside the window; above it when there is no room below.
    var rect = link.getBoundingClientRect();
    var left = rect.left + window.scrollX;
    var maxLeft = window.scrollX + document.documentElement.clientWidth - box.offsetWidth - 8;
    if (left > maxLeft) left = Math.max(window.scrollX + 8, maxLeft);
    var top = rect.top + window.scrollY + 20;
    if (rect.top + 20 + box.offsetHeight > window.innerHeight) top = rect.top + window.scrollY - box.offsetHeight - 15;
    box.style.left = left + 'px';
    box.style.top = top + 'px';
  }

  function setup() {
    document.querySelectorAll('a[rel="footnote"]').forEach(function (link) {
      link.addEventListener('mouseover', function () { show(link); });
      link.addEventListener('mouseout', scheduleRemove);
      link.addEventListener('focus', function () { show(link); });
      link.addEventListener('blur', scheduleRemove);
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', setup);
  else setup();
})();
