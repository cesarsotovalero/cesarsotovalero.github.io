---
layout: page
permalink: /youtube/by-views
title: YouTube Videos by Views
description: YouTube videos created by César Soto Valero, sorted by number of views.
published: true
sitemap: false
noindex: true
css:
  - "/css/blog-index.css"
  - "/css/media-rows.css"
---

<!-- markdownlint-disable MD033 -->
{% include subscribe-on-youtube.html %}
{% assign published_videos = site.data.youtube-videos %}

<!-- Buttons for ordering YouTube videos -->
<div class="list-filters">
  <a href="/youtube" class="list-filter">All ({{ published_videos.size }})</a>
  <a href="/youtube/by-year" class="list-filter">By Year</a>
  <a href="/youtube/by-views" class="list-filter">By Views</a>
  <a href="/youtube/by-likes" class="list-filter">By Likes</a>
  <a href="/youtube/by-comments" class="list-filter">By Comments</a>
</div>

{% assign sorted_videos = site.data.youtube-videos | sort: "statistics.viewCount" | reverse %}
{% assign ranges_order = "10K+,1K-9K,<1K" | split: "," %}
{% assign videos_by_range = "" | split: "" %}
{% for range in ranges_order %}
  {% assign filtered = "" | split: "" %}
  {% for video in sorted_videos %}
    {% assign n = video.statistics.viewCount | plus: 0 %}
    {% if range == "10K+" and n >= 10000 %}
      {% assign filtered = filtered | push: video %}
    {% elsif range == "1K-9K" and n >= 1000 and n < 10000 %}
      {% assign filtered = filtered | push: video %}
    {% elsif range == "<1K" and n < 1000 %}
      {% assign filtered = filtered | push: video %}
    {% endif %}
  {% endfor %}
  {% assign videos_by_range = videos_by_range | push: filtered %}
{% endfor %}

<!-- Jump to a range -->
<div class="tag-list">
  {% for range in ranges_order %}
  <a href="#{{ range }}" class="btn btn-primary tag-btn"><i class="fas fa-eye" aria-hidden="true"></i>&nbsp;{{ range }}&nbsp;</a>
  {% endfor %}
</div>

<section class="blog-archive media-archive">
  {% for range in ranges_order %}
  {% assign filtered_videos = videos_by_range[forloop.index0] %}
  <div class="blog-year">
    <h2 id="{{ range }}" class="blog-year-title"><i class="fas fa-eye" aria-hidden="true"></i> {{ range }} ({{ filtered_videos.size }})</h2>
    {% include youtube-rows.html videos=filtered_videos %}
  </div>
  {% endfor %}
</section>
<!-- markdownlint-enable MD033 -->
