function scrollToTop() {
   var reduceMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
   window.scrollTo({top: 0, behavior: reduceMotion ? 'auto' : 'smooth'});
}