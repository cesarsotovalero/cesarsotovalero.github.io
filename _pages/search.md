---
permalink: search
layout: page
title: Search
description: Search the blog posts and pages of César Soto Valero's website.
subtitle: Blog posts, talks, research, and pages
sitemap: false
noindex: true
css:
  - "/pagefind/pagefind-ui.css"
  - "/css/search.css"
---

<div id="search" class="site-search"></div>

<!-- Shown when the search index is unavailable (JavaScript off, or a local build without Pagefind). -->
<div id="search-fallback" class="search-fallback" hidden>
   <p>Search with Google instead:</p>
   <form method="get" action="https://www.google.com/search" class="search-fallback-form">
      <input name="sitesearch" value="cesarsotovalero.net" type="hidden"/>
      <label for="search-query" class="sr-only">Search this site</label>
      <input type="search" id="search-query" name="q" placeholder="Search..." autocomplete="off"/>
      <button type="submit">Search</button>
   </form>
</div>
<noscript>
   <style>#search-fallback { display: block !important; }</style>
</noscript>

<script src="/pagefind/pagefind-ui.js" defer onerror="document.getElementById('search-fallback').hidden = false"></script>
<script>
// The index in /pagefind/ is built after Jekyll by Pagefind (see .github/workflows/deploy-website.yml).
window.addEventListener('DOMContentLoaded', function () {
   if (!window.PagefindUI) {
      document.getElementById('search-fallback').hidden = false;
      return;
   }
   var ui = new PagefindUI({
      element: '#search',
      showSubResults: true,
      showImages: false,
      resetStyles: false,
      autofocus: true,
      translations: { placeholder: 'Search posts and pages' }
   });
   var query = new URLSearchParams(location.search).get('q');
   if (query) ui.triggerSearch(query);
});
</script>
