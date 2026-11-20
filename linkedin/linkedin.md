---
layout: page
permalink: linkedin
title: LinkedIn Posts
description: LinkedIn posts posted by César Soto Valero.
published: true
css:
  - "/css/blog-index.css"
  - "/css/media-rows.css"
---

<!-- markdownlint-disable MD033 -->
{% include follow-on-linkedin.html %}
{% assign published_posts = site.data.linkedin-posts.data.posts %}

<!-- Buttons for ordering LinkedIn posts -->
<div class="list-filters">
  <a href="/linkedin" class="list-filter">All ({{ published_posts.size }})</a>
  <a href="/linkedin/by-year" class="list-filter">By Year</a>
  <a href="/linkedin/by-reactions" class="list-filter">By Reactions</a>
  <a href="/linkedin/by-comments" class="list-filter">By Comments</a>
</div>

{% assign by_year = published_posts | group_by_exp: "post", "post.posted_at.date | date: '%Y'" %}

<section class="blog-archive media-archive">
  {% for year in by_year %}
  <div class="blog-year">
    <h3 class="blog-year-title">{{ year.name }} ({{ year.size }})</h3>
    {% include linkedin-rows.html posts=year.items date_format="%b %-d" %}
  </div>
  {% endfor %}
</section>
<!-- markdownlint-enable MD033 -->
