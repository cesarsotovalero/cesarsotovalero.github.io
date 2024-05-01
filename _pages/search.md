---
permalink: search.html
layout: page
title: Search
description: Search this site
subtitle: 🔎
---

<div class="search">
   <form method="get" action="https://www.google.com/search">
      <input name="sitesearch" value="cesarsotovalero.github.io" type="hidden"/>
             <input type="text" id="search-query" class="field field-text"
               onfocus="$('.google').css('visibility', 'visible');" name="q" placeholder="Search..." autocomplete="off"/>
             <input type="image" src="//www.yegor256.com/images/google-search-icon.svg" class="google"
               title="Search in this site via Google" alt="Search in this site via Google"/>
           </form>
</div>  