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

      // Then re-inject Giscus with light theme:
      injectGiscus("https://giscus.app/themes/ligth.css");

   } else if (theme === "light") {
      document.documentElement.setAttribute('data-theme', 'dark');
      sessionStorage.setItem('theme', 'dark');
      document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-sun fa-lg\"></i>";

      // Then re-inject Giscus with dark theme:
      injectGiscus("https://giscus.app/themes/dark_dimmed.css");

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


function injectGiscus(themeURL) {
   // 1) Remove old Giscus container:
   const giscusContainer = document.getElementById("giscus-container");
   if (giscusContainer) {
      giscusContainer.innerHTML = "";
   }

   // 2) Create a new script with updated data-theme:
   const script = document.createElement("script");
   script.src = "https://giscus.app/client.js";
   script.setAttribute("data-repo", "cesarsotovalero/cesarsotovalero.github.io");
   script.setAttribute("data-repo-id", "MDEwOlJlcG9zaXRvcnkyMzE2NzM0OTI=");
   script.setAttribute("data-category", "Announcements");
   script.setAttribute("data-category-id", "DIC_kwDODc8OlM4B-aMB");
   script.setAttribute("data-mapping", "pathname");
   script.setAttribute("data-reactions-enabled", "1");
   script.setAttribute("data-emit-metadata", "1");

   // The key part: dynamic theme (could be "dark", "light", or a URL)
   script.setAttribute("data-theme", themeURL);

   script.setAttribute("crossorigin", "anonymous");
   script.async = true;

   // 3) Append new script to the container:
   if (giscusContainer) {
      giscusContainer.appendChild(script);
   }
}

