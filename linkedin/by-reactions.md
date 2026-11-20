---
layout: page
permalink: /linkedin/by-reactions
title: LinkedIn Posts by Reactions
description: LinkedIn posts by César Soto Valero, sorted by number of reactions.
published: true
sitemap: false
noindex: true
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

{% assign sorted_posts = published_posts | sort: "totalReactionCount" | reverse %}
{% assign ranges_order = "100+,10-99,<10" | split: "," %}
{% assign posts_by_range = "" | split: "" %}
{% for range in ranges_order %}
  {% assign filtered = "" | split: "" %}
  {% for post in sorted_posts %}
    {% assign n = post.totalReactionCount | default: 0 %}
    {% if range == "100+" and n >= 100 %}
      {% assign filtered = filtered | push: post %}
    {% elsif range == "10-99" and n >= 10 and n < 100 %}
      {% assign filtered = filtered | push: post %}
    {% elsif range == "<10" and n < 10 %}
      {% assign filtered = filtered | push: post %}
    {% endif %}
  {% endfor %}
  {% assign posts_by_range = posts_by_range | push: filtered %}
{% endfor %}

<!-- Jump to a range -->
<div class="tag-list">
  {% for range in ranges_order %}
  <a href="#{{ range }}" class="btn btn-primary tag-btn"><i class="fas fa-thumbs-up" aria-hidden="true"></i>&nbsp;{{ range }}&nbsp;</a>
  {% endfor %}
</div>

<section class="blog-archive media-archive">
  {% for range in ranges_order %}
  {% assign filtered_posts = posts_by_range[forloop.index0] %}
  <div class="blog-year">
    <h2 id="{{ range }}" class="blog-year-title"><i class="fas fa-thumbs-up" aria-hidden="true"></i> {{ range }} ({{ filtered_posts.size }})</h2>
    {% include linkedin-rows.html posts=filtered_posts %}
  </div>
  {% endfor %}
</section>
<!-- markdownlint-enable MD033 -->
