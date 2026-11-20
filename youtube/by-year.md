---
layout: page
permalink: /youtube/by-year
title: YouTube Videos by Year
description: YouTube videos created by César Soto Valero, organized by year.
published: true
sitemap: false
noindex: true
css:
  - "/css/blog-index.css"
  - "/css/youtube-index.css"
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

{% assign sorted_videos = site.data.youtube-videos | sort: "snippet.publishedAt" | reverse %}
{% assign by_year = sorted_videos | group_by_exp: "video", "video.snippet.publishedAt | date: '%Y'" %}

<!-- Jump to a year -->
<div class="tag-list">
  {% for year in by_year %}
  <a href="#{{ year.name }}" class="btn btn-primary tag-btn"><i class="fas fa-calendar-alt" aria-hidden="true"></i>&nbsp;{{ year.name }}&nbsp;</a>
  {% endfor %}
</div>

<section class="blog-archive youtube-archive">
  {% for year in by_year %}
  <div class="blog-year">
    <h2 id="{{ year.name }}" class="blog-year-title"><i class="fas fa-calendar-alt" aria-hidden="true"></i> {{ year.name }} ({{ year.size }})</h2>
    {% include youtube-rows.html videos=year.items date_format="%b %-d" %}
  </div>
  {% endfor %}
</section>
<!-- markdownlint-enable MD033 -->
