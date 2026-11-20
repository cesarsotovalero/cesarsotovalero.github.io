// Topic and type filters (.blog-filters) on the blog index and publications pages. On phones they
// scroll sideways in one row (css/blog-index.css): keep the selected filter in view, and drop the
// fade at the right edge once the row is scrolled to its end.
(function () {
  'use strict';
  document.querySelectorAll('.blog-filters ul').forEach(function (row) {
    var selected = row.querySelector('[aria-pressed="true"]');
    if (selected && row.scrollWidth > row.clientWidth) {
      row.scrollLeft = Math.max(0, selected.parentElement.offsetLeft - row.offsetLeft - 15);
    }
    var markEnd = function () {
      row.classList.toggle('is-scrolled-end', row.scrollLeft + row.clientWidth >= row.scrollWidth - 2);
    };
    row.addEventListener('scroll', markEnd, { passive: true });
    window.addEventListener('resize', markEnd);
    markEnd();
  });
})();
