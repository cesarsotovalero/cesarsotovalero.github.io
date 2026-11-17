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

{% comment %} Tags by number of posts, ties by name. Keys like "991|java" sort as text, so they hold 999 minus the count, padded: an ascending sort then puts the most-used tags first and ties in alphabetical order. {% endcomment %}
{% assign tag_counts = "" | split: "" %}
{% for tag in site.tags %}
  {% assign padded = 999 | minus: tag[1].size | prepend: "000" | slice: -3, 3 %}
  {% assign tag_entry = padded | append: "|" | append: tag[0] %}
  {% assign tag_counts = tag_counts | push: tag_entry %}
{% endfor %}
{% assign tag_counts = tag_counts | sort %}

<section class="blog-subscribe" aria-label="Newsletter">
   {% include subscribe.html %}
</section>

<nav class="blog-filters" aria-label="Filter posts by topic">
   <ul>
      <li><a href="{{ site.baseurl }}/blog" class="blog-filter" data-tag="">All</a></li>
      {% for entry in tag_counts %}
      {% assign parts = entry | split: "|" %}
      <li><a href="{{ site.baseurl }}/tag/{{ parts[1] }}" class="blog-filter" data-tag="{{ parts[1] }}"><i class="fas fa-tag" aria-hidden="true"></i>{{ parts[1] }} <span class="blog-filter-count">{{ 999 | minus: parts[0] }}</span></a></li>
      {% endfor %}
   </ul>
</nav>
<p class="blog-filter-status" role="status" aria-live="polite"></p>

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
            {% if post.image %}
            <img class="thumb-round blog-row-thumb" src="{{ post.image | thumbnail }}" alt="" width="64" height="64" loading="lazy" decoding="async">
            {% endif %}
            <div class="blog-row-text">
            <a class="blog-row-title" href="{{ post.url | relative_url }}">{{ post.title }}</a>
            {% if post.subtitle %}<span class="blog-row-subtitle">{{ post.subtitle }}</span>{% endif %}
            <span class="blog-meta">
               <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %-d" }}</time> · {% if words < 180 %}1{% else %}{{ words | divided_by: 180 }}{% endif %} min read{% for tag in post.tags %} · <a class="blog-row-tag" href="{{ site.baseurl }}/tag/{{ tag }}"><i class="fas fa-tag" aria-hidden="true"></i> {{ tag }}</a>{% endfor %}
            </span>
            </div>
         </li>
         {% endfor %}
      </ul>
   </div>
   {% endfor %}
</section>

<script>
// Filter the list in place. Without JavaScript the filters are links to the tag pages.
(function () {
   var filters = document.querySelectorAll('.blog-filter');
   var rows = document.querySelectorAll('.blog-row');
   var years = document.querySelectorAll('.blog-year');
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
