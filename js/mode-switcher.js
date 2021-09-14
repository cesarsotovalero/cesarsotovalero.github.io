// see https://github.com/derekkedziora/jekyll-demo
let theme = sessionStorage.getItem('theme');
sessionStorage.setItem('theme', 'light');

document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-adjust fa-lg\"></i>";

function modeSwitcher() {
   let theme = sessionStorage.getItem('theme');
   if (theme === "dark") {
      document.documentElement.setAttribute('data-theme', 'light');
      sessionStorage.setItem('theme', 'light');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-adjust fa-lg\"></i>";
   } else if (theme === "light") {
      document.documentElement.setAttribute('data-theme', 'dark');
      sessionStorage.setItem('theme', 'dark');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-sun fa-lg\"></i>";
   } else if (systemInitiatedDark.matches) {
      document.documentElement.setAttribute('data-theme', 'light');
      sessionStorage.setItem('theme', 'light');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-adjust fa-lg\"></i>";
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
   document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-adjust fa-lg\"></i>";
}




