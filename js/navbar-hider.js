var prevScrollpos = window.pageYOffset;
window.onscroll = function () {
   var currentScrollPos = window.pageYOffset;
   var elems = document.getElementsByClassName('navbar-fixed-top');
   if (prevScrollpos > currentScrollPos) {
      for (var i = 0; i < elems.length; i++) {
         elems[i].style.transition = "top 0.5s ease-in-out";
         elems[i].style.top = "0";
      }
   } else {
      for (var i = 0; i < elems.length; i++) {
         elems[i].style.transition = "top 1.5s ease-in-out";
         elems[i].style.top = "-70px";
      }
   }
   prevScrollpos = currentScrollPos;
}