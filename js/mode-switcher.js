// see https://github.com/derekkedziora/jekyll-demo
let systemInitiatedDark = window.matchMedia("(prefers-color-scheme: dark)");
let theme = sessionStorage.getItem('theme');
sessionStorage.setItem('theme', 'light');

// set the icon
// if (systemInitiatedDark.matches) {
//    document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-sun fa-lg\"></i>";
// } else {
   document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-moon fa-lg\"></i>";
// }

function prefersColorTest(systemInitiatedDark) {
   // if (systemInitiatedDark.matches) {
   //    document.documentElement.setAttribute('data-theme', 'dark');
   //    document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-sun fa-lg\"></i>";
   //    sessionStorage.setItem('theme', '');
   // } else {
      document.documentElement.setAttribute('data-theme', 'light');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-moon fa-lg\"></i>";
      sessionStorage.setItem('theme', '');
   // }
}


systemInitiatedDark.addListener(prefersColorTest);

function modeSwitcher() {
   let theme = sessionStorage.getItem('theme');
   if (theme === "dark") {
      document.documentElement.setAttribute('data-theme', 'light');
      sessionStorage.setItem('theme', 'light');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-moon fa-lg\"></i>";
   } else if (theme === "light") {
      document.documentElement.setAttribute('data-theme', 'dark');
      sessionStorage.setItem('theme', 'dark');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-sun fa-lg\"></i>";
   } else if (systemInitiatedDark.matches) {
      document.documentElement.setAttribute('data-theme', 'light');
      sessionStorage.setItem('theme', 'light');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-moon fa-lg\"></i>";
   } else {
      document.documentElement.setAttribute('data-theme', 'dark');
      sessionStorage.setItem('theme', 'dark');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-sun fa-lg\"></i>";
   }
}

if (theme === "dark") {
   document.documentElement.setAttribute('data-theme', 'dark');
   sessionStorage.setItem('theme', 'dark');
   document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-sun fa-lg\"></i>";
} else if (theme === "light") {
   document.documentElement.setAttribute('data-theme', 'light');
   sessionStorage.setItem('theme', 'light');
   document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-moon fa-lg\"></i>";
}

// Change disqus color
const event = new Event('themeChanged');
document.dispatchEvent(event);
console.log("Theme changed");


