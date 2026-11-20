// Light and dark theme.
// - The theme is set before the first paint by the inline script at the top of _includes/head.html.
// - Until the visitor picks a theme with the toggle, the site follows the system setting, also when it
//   changes; a pick is saved in localStorage and wins from then on.
// - Switching spreads the new theme in a circle from the toggle (View Transitions; instant where they
//   are not supported or when reduced motion is asked for).

var systemInitiatedDark = window.matchMedia('(prefers-color-scheme: dark)');

var SVG_OPEN = '<svg class="icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">';
var MOON_ICON = SVG_OPEN + '<path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z"/></svg>';
var SUN_ICON = SVG_OPEN + '<circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4"/></svg>';

function storedTheme() {
   try { return localStorage.getItem('theme'); } catch (e) { return null; }
}

function storeTheme(value) {
   try { localStorage.setItem('theme', value); } catch (e) {}
}

// Update every toggle button (desktop navbar and mobile drawer): icon and pressed state.
function updateToggles(dark) {
   document.querySelectorAll('.theme-toggle').forEach(function (button) {
      button.innerHTML = dark ? SUN_ICON : MOON_ICON;
      button.setAttribute('aria-pressed', dark ? 'true' : 'false');
   });
}

function applyTheme(dark) {
   document.documentElement.setAttribute('data-theme', dark ? 'dark' : 'light');
   updateToggles(dark);
   setHighlightMode(dark);
   reloadGiscus();
}

// Kept for other scripts: these also save the choice.
function setThemeToDark() {
   applyTheme(true);
   storeTheme('dark');
}

function setThemeToLight() {
   applyTheme(false);
   storeTheme('light');
}

// Re-render the comments in the new theme, but only if they are already on the page:
// they load lazily when the reader scrolls near them (_includes/giscus.html).
function reloadGiscus() {
   var container = document.getElementById("giscus-container");
   if (typeof loadGiscus === "function" && container && container.hasChildNodes()) loadGiscus();
}

function initTheme() {
   var stored = storedTheme();
   applyTheme(stored ? stored === 'dark' : systemInitiatedDark.matches);
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

// The toggle function (navbar, mobile menu and command palette).
function modeSwitcher() {
   var root = document.documentElement;
   var dark = root.getAttribute('data-theme') !== 'dark';
   var change = function () {
      if (dark) setThemeToDark(); else setThemeToLight();
   };
   var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
   if (!document.startViewTransition || reduce) {
      change();
      return;
   }
   // The circle starts at the visible toggle (or the top right corner) and grows to cover the window.
   var toggle = Array.prototype.filter.call(document.querySelectorAll('.theme-toggle'), function (b) {
      return b.getClientRects().length > 0;
   })[0];
   var rect = toggle ? toggle.getBoundingClientRect() : null;
   var x = rect ? rect.left + rect.width / 2 : window.innerWidth - 40;
   var y = rect ? rect.top + rect.height / 2 : 32;
   var radius = Math.hypot(Math.max(x, window.innerWidth - x), Math.max(y, window.innerHeight - y));
   root.style.setProperty('--reveal-x', x + 'px');
   root.style.setProperty('--reveal-y', y + 'px');
   root.style.setProperty('--reveal-r', radius + 'px');
   root.classList.add('theme-transition');
   var transition = document.startViewTransition(change);
   transition.finished.finally(function () {
      root.classList.remove('theme-transition');
   });
}

// Follow the system setting until the visitor picks a theme.
if (systemInitiatedDark.addEventListener) {
   systemInitiatedDark.addEventListener('change', function (event) {
      if (!storedTheme()) applyTheme(event.matches);
   });
}

document.addEventListener('DOMContentLoaded', initTheme);
