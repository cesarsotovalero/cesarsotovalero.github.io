// Let’s read from localStorage once at the top:
let theme = localStorage.getItem('theme');
// For system default detection:
let systemInitiatedDark = window.matchMedia('(prefers-color-scheme: dark)');

// Helper to set dark mode
function setThemeToDark() {
   document.documentElement.setAttribute('data-theme', 'dark');
   localStorage.setItem('theme', 'dark');
   document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-sun fa-lg\"></i>";
   setHighlightMode(true);
   loadGiscus();
}

// Helper to set light mode
function setThemeToLight() {
   document.documentElement.setAttribute('data-theme', 'light');
   localStorage.setItem('theme', 'light');
   document.getElementById("theme-toggle").innerHTML = "<i class=\"fas fa-adjust fa-lg\"></i>";
   setHighlightMode(false);
   loadGiscus();
}

// Decide which theme to apply on initial load:
function initTheme() {
   let storedTheme = localStorage.getItem('theme');

   if (storedTheme === "dark") {
      setThemeToDark();
   } else if (storedTheme === "light") {
      setThemeToLight();
   } else {
      // If no stored theme, check system preference
      if (systemInitiatedDark.matches) {
         setThemeToDark();
      } else {
         setThemeToLight();
      }
   }
}

function setHighlightMode(darkMode) {
   const link = document.getElementById('code');
   if (!link) return; // guard if link not found
   if (darkMode) {
      link.href = "https://www.cesarsotovalero.net/css/pygment_highlights_dark.css";
   } else {
      link.href = "https://www.cesarsotovalero.net/css/pygment_highlights.css";
   }
}

// The toggle function
function modeSwitcher() {
   // getItem each time we switch
   let currentTheme = localStorage.getItem('theme');
   if (currentTheme === "dark") {
      setThemeToLight();
   } else {
      setThemeToDark();
   }
}

// On page load, call initTheme:
document.addEventListener('DOMContentLoaded', initTheme);