// Let’s read from localStorage once at the top:
let theme = localStorage.getItem('theme');
// For system default detection:
let systemInitiatedDark = window.matchMedia('(prefers-color-scheme: dark)');

var SVG_OPEN = '<svg class="icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">';
var MOON_ICON = SVG_OPEN + '<path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z"/></svg>';
var SUN_ICON = SVG_OPEN + '<circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4"/></svg>';

// Update every toggle button (desktop navbar and mobile drawer): icon and pressed state.
function updateToggles(dark) {
   document.querySelectorAll('.theme-toggle').forEach(function (button) {
      button.innerHTML = dark ? SUN_ICON : MOON_ICON;
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