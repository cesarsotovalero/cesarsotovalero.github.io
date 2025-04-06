---
permalink: youtube.html
layout: page
title: YouTube Videos
description: List of YouTube videos created by César Soto Valero.
published: true
---

{% include subscribe-on-youtube.html %}

<div class="youtube-videos-container">
  {% for video in site.data.youtube-videos %}
  <div class="youtube-video-card">
    <div class="youtube-video-text">
      <h3 class="youtube-video-title">{{ video.snippet.title }}</h3>
      <p class="youtube-video-description">
        {{ video.snippet.description | truncate: 150 }}
      </p>
      <p class="youtube-video-stats">
        <span>Views: {{ video.statistics.viewCount }}</span> | 
        <span>Likes: {{ video.statistics.likeCount }}</span>
      </p>
    </div>
    <div class="youtube-video-thumbnail">
      <img src="{{ video.snippet.thumbnails.medium.url }}" alt="Thumbnail for {{ video.snippet.title }}">
    </div>
  </div>
  {% endfor %}
</div>

