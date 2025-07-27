---
permalink: search.html
layout: page
title: Search
description: Search this site
subtitle: 🔎
---

<div class="search">
   <form method="get" action="https://www.google.com/search">
      <input name="sitesearch" value="cesarsotovalero.net" type="hidden"/>
      <div class="search-container">
         <input type="text" id="search-query" class="field field-text"
                onfocus="document.querySelector('.google').style.visibility = 'visible';"
                name="q" placeholder="Search..." autocomplete="off"/>
         <button type="submit" class="google" title="Search in this site via Google">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
               <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
            </svg>
         </button>
      </div>
   </form>
</div>

<style>
.search {
   max-width: 600px;
   margin: 0 auto;
   padding: 20px;
}

.search-container {
   position: relative;
   display: flex;
   align-items: center;
}

.field-text {
   width: 100%;
   padding: 12px 50px 12px 15px;
   border: 2px solid #ddd;
   border-radius: 25px;
   font-size: 16px;
   outline: none;
   transition: border-color 0.3s ease;
}

.field-text:focus {
   border-color: #007bff;
}

.google {
   position: absolute;
   right: 5px;
   background: none;
   border: none;
   cursor: pointer;
   padding: 8px;
   border-radius: 50%;
   visibility: hidden;
   transition: background-color 0.3s ease;
}

.google:hover {
   background-color: #f0f0f0;
}

.google svg {
   color: #666;
}
</style>
