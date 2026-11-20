---
permalink: youtube
layout: page
title: YouTube Videos
description: List of YouTube videos created by César Soto Valero.
published: true
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

{% assign sorted_videos = site.data.youtube-videos | sort: "snippet.publishedAt" | reverse %}

<section class="blog-archive media-archive">
  {% assign by_year = sorted_videos | group_by_exp: "video", "video.snippet.publishedAt | date: '%Y'" %}
  {% for year in by_year %}
  <div class="blog-year">
    <h3 class="blog-year-title">{{ year.name }} ({{ year.size }})</h3>
    {% include youtube-rows.html videos=year.items date_format="%b %-d" %}
  </div>
  {% endfor %}
</section>
