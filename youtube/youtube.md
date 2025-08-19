---
permalink: youtube.html
layout: page
title: YouTube Videos
description: List of YouTube videos created by César Soto Valero.
published: true
---

<!-- markdownlint-disable MD033 -->
{% include subscribe-on-youtube.html %}
{% assign published_videos = site.data.youtube-videos %}

<!-- Buttons for ordering YouTube videos -->
<div class="list-filters">
  <a href="/youtube.html" class="list-filter">All ({{ published_videos.size }})</a>
  <a href="/youtube/by-year.html" class="list-filter">By Year</a>
  <a href="/youtube/by-views.html" class="list-filter">By Views</a>
  <a href="/youtube/by-likes.html" class="list-filter">By Likes</a>
  <a href="/youtube/by-comments.html" class="list-filter">By Comments</a>
</div>

{% assign sorted_videos = site.data.youtube-videos | sort: "snippet.publishedAt" | reverse %}

<div class="linkedin-posts-container post-preview" style="margin-top: 20px;">
  {% for video in sorted_videos %}
  <a href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank" class="youtube-video-link">
   <div class="youtube-video-card">
    <div class="youtube-video-text">
      <h3 class="youtube-video-title">{{ video.snippet.title }}</h3>
      <p class="youtube-video-description">
       Published on {{ video.snippet.publishedAt | date: "%b %-d, %Y" }} ·
       {{ video.contentDetails.duration | replace: "PT", "" | replace: "H", "h " | replace: "M", "m " | replace: "S", "s" }}
      </p>
      <p class="youtube-video-stats">
       <i class="fas fa-eye"></i> {% assign views = video.statistics.viewCount | plus: 0 %}{% if views >= 1000 %}{{ views | divided_by: 1000 }}K{% else %}{{ views | number_with_delimiter }}{% endif %} |
       <span><i class="fas fa-thumbs-up"></i> Likes: {{ video.statistics.likeCount | number_with_delimiter }}</span> |
       <span><i class="fas fa-comments"></i> Comments: {{ video.statistics.commentCount | number_with_delimiter }}</span>
      </p>
    </div>
    <div class="youtube-video-thumbnail">
      <img src="{{ video.snippet.thumbnails.medium.url }}" alt="Thumbnail for {{ video.snippet.title }}">
    </div>
   </div>
  </a>
  {% endfor %}
</div>
