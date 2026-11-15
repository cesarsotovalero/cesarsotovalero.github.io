// Let’s read from localStorage once at the top:
let theme = localStorage.getItem('theme');
// For system default detection:
let systemInitiatedDark = window.matchMedia('(prefers-color-scheme: dark)');

// Update every toggle button (desktop navbar and mobile drawer): icon and pressed state.
function updateToggles(dark) {
   document.querySelectorAll('.theme-toggle').forEach(function (button) {
      button.innerHTML = dark
         ? '<i class="fas fa-sun fa-lg" aria-hidden="true"></i>'
         : '<i class="fas fa-adjust fa-lg" aria-hidden="true"></i>';
      button.setAttribute('aria-pressed', dark ? 'true' : 'false');
   });
}

// Helper to set dark mode
function setThemeToDark() {
   document.documentElement.setAttribute('data-theme', 'dark');
   localStorage.setItem('theme', 'dark');
   updateToggles(true);
   setHighlightMode(true);
   reloadGiscus();
}

// Helper to set light mode
function setThemeToLight() {
   document.documentElement.setAttribute('data-theme', 'light');
   localStorage.setItem('theme', 'light');
   updateToggles(false);
   setHighlightMode(false);
   reloadGiscus();
}

// Giscus comments are only loaded on posts, so the loader may not exist on this page.
function reloadGiscus() {
   if (typeof loadGiscus === "function") loadGiscus();
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
   const codeElement = document.getElementById('code');
   const codeLineno = document.getElementsByClassName('lineno');
   if (!codeElement) return; // guard if codeElement not found
   if (darkMode) {
      codeElement.href = "/css/pygment_highlights_dark.css";
      codeLineno.href = "/css/pygment_highlights_dark.css";
   } else {
      codeElement.href = "/css/pygment_highlights.css";
      codeLineno.href = "/css/pygment_highlights.css";
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