---
permalink: youtube
layout: page
title: YouTube Videos
description: List of YouTube videos created by César Soto Valero.
published: true
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

<section class="blog-archive youtube-archive">
  {% assign by_year = sorted_videos | group_by_exp: "video", "video.snippet.publishedAt | date: '%Y'" %}
  {% for year in by_year %}
  <div class="blog-year">
    <h3 class="blog-year-title">{{ year.name }} ({{ year.size }})</h3>
    <ul class="blog-rows">
      {% for video in year.items %}
      {% assign views = video.statistics.viewCount | plus: 0 %}
      <li class="blog-row">
        <a class="youtube-row-thumb-link" href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank" rel="noopener" tabindex="-1" aria-hidden="true">
          <img class="thumb-rect youtube-row-thumb" src="{{ video.snippet.thumbnails.medium.url }}" alt="" width="128" height="72" loading="lazy" decoding="async">
        </a>
        <div class="blog-row-text">
          <a class="blog-row-title" href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank" rel="noopener">{{ video.snippet.title }}</a>
          <span class="blog-meta">
            <time datetime="{{ video.snippet.publishedAt }}">{{ video.snippet.publishedAt | date: "%b %-d" }}</time>
            · <i class="fas fa-clock" aria-hidden="true"></i> {{ video.contentDetails.duration | replace: "PT", "" | replace: "H", "h " | replace: "M", "m " | replace: "S", "s" }}
            · <i class="fas fa-eye" aria-hidden="true"></i> {% if views >= 1000 %}{{ views | divided_by: 1000 }}K{% else %}{{ views | number_with_delimiter }}{% endif %} views
            · <i class="fas fa-thumbs-up" aria-hidden="true"></i> {{ video.statistics.likeCount | number_with_delimiter }} likes
            · <i class="fas fa-comments" aria-hidden="true"></i> {{ video.statistics.commentCount | number_with_delimiter }} comments
          </span>
        </div>
      </li>
      {% endfor %}
    </ul>
  </div>
  {% endfor %}
</section>
