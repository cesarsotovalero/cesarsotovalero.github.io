---
layout: page
permalink: blog
title: Blog Posts
description: "Blog posts by César Soto Valero on applied AI for finance, software engineering, research, and careers."
css:
  - "/css/blog-index.css"
pagefind: false
---

{% assign posts = site.posts %}

{% comment %} Tags sorted by number of posts: "007|java" sorts as text, so pad the counts. {% endcomment %}
{% assign tag_counts = "" | split: "" %}
{% for tag in site.tags %}
  {% assign padded = tag[1].size | prepend: "000" | slice: -3, 3 %}
  {% assign tag_entry = padded | append: "|" | append: tag[0] %}
  {% assign tag_counts = tag_counts | push: tag_entry %}
{% endfor %}
{% assign tag_counts = tag_counts | sort | reverse %}

<p class="blog-intro">{{ posts.size }} posts on applied AI, software engineering, research, and careers, written since {{ posts.last.date | date: "%Y" }}.</p>

<nav class="blog-filters" aria-label="Filter posts by topic">
   <ul>
      <li><a href="{{ site.baseurl }}/blog" class="blog-filter" data-tag="">All</a></li>
      {% for entry in tag_counts limit: 10 %}
      {% assign parts = entry | split: "|" %}
      <li><a href="{{ site.baseurl }}/tag/{{ parts[1] }}" class="blog-filter" data-tag="{{ parts[1] }}">{{ parts[1] }} <span class="blog-filter-count">{{ parts[0] | plus: 0 }}</span></a></li>
      {% endfor %}
      <li><a href="{{ site.baseurl }}/blog/tags" class="blog-filter-more">All tags &rarr;</a></li>
   </ul>
</nav>
<p class="blog-filter-status" role="status" aria-live="polite"></p>

<section class="blog-latest" aria-labelledby="blog-latest-title">
   <h2 id="blog-latest-title" class="blog-section-title">Latest</h2>
   <ul class="blog-cards">
      {% for post in posts limit: 3 %}
      {% assign words = post.content | number_of_words %}
      <li class="blog-card">
         <a href="{{ post.url | relative_url }}">
            {% if post.image %}
            <img src="{{ post.image | thumbnail }}" alt="" loading="lazy" decoding="async">
            {% endif %}
            <span class="blog-card-text">
               <span class="blog-card-title">{{ post.title }}</span>
               {% if post.subtitle %}<span class="blog-card-subtitle">{{ post.subtitle }}</span>{% endif %}
               <span class="blog-meta"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %-d, %Y" }}</time> · {% if words < 180 %}1{% else %}{{ words | divided_by: 180 }}{% endif %} min read</span>
            </span>
         </a>
      </li>
      {% endfor %}
   </ul>
</section>

<section class="blog-archive" aria-labelledby="blog-archive-title">
   <h2 id="blog-archive-title" class="blog-section-title">All posts</h2>
   {% assign by_year = posts | group_by_exp: "post", "post.date | date: '%Y'" %}
   {% for year in by_year %}
   <div class="blog-year">
      <h3 class="blog-year-title">{{ year.name }}</h3>
      <ul class="blog-rows">
         {% for post in year.items %}
         {% assign words = post.content | number_of_words %}
         <li class="blog-row" data-tags="{{ post.tags | join: ' ' }}">
            <a class="blog-row-title" href="{{ post.url | relative_url }}">{{ post.title }}</a>
            {% if post.subtitle %}<span class="blog-row-subtitle">{{ post.subtitle }}</span>{% endif %}
            <span class="blog-meta">
               <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %-d" }}</time> · {% if words < 180 %}1{% else %}{{ words | divided_by: 180 }}{% endif %} min read{% for tag in post.tags %} · <a class="blog-row-tag" href="{{ site.baseurl }}/tag/{{ tag }}">{{ tag }}</a>{% endfor %}
            </span>
         </li>
         {% endfor %}
      </ul>
   </div>
   {% endfor %}
</section>

<section class="blog-subscribe" aria-label="Newsletter">
   {% include subscribe.html %}
</section>

<script>
// Filter the list in place. Without JavaScript the filters are links to the tag pages.
(function () {
   var filters = document.querySelectorAll('.blog-filter');
   var rows = document.querySelectorAll('.blog-row');
   var years = document.querySelectorAll('.blog-year');
   var latest = document.querySelector('.blog-latest');
   var status = document.querySelector('.blog-filter-status');

   function apply(tag, updateUrl) {
      var shown = 0;
      rows.forEach(function (row) {
         var match = !tag || (' ' + row.getAttribute('data-tags') + ' ').indexOf(' ' + tag + ' ') !== -1;
         row.hidden = !match;
         if (match) shown++;
      });
      years.forEach(function (year) {
         year.hidden = !year.querySelector('.blog-row:not([hidden])');
      });
      latest.hidden = !!tag;
      filters.forEach(function (filter) {
         filter.setAttribute('aria-pressed', filter.getAttribute('data-tag') === tag ? 'true' : 'false');
      });
      status.textContent = tag ? shown + (shown === 1 ? ' post' : ' posts') + ' tagged “' + tag + '”' : '';
      if (updateUrl) {
         history.replaceState(null, '', tag ? '?tag=' + encodeURIComponent(tag) : location.pathname);
      }
   }

   filters.forEach(function (filter) {
      filter.setAttribute('role', 'button');
      filter.addEventListener('click', function (event) {
         event.preventDefault();
         apply(filter.getAttribute('data-tag'), true);
      });
      filter.addEventListener('keydown', function (event) {
         if (event.key === ' ') { event.preventDefault(); filter.click(); }
      });
   });

   var initial = new URLSearchParams(location.search).get('tag') || '';
   apply(initial, false);
})();
</script>
