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
  <a href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank" class="youtube-video-link">
    <div class="youtube-video-card">
      <div class="youtube-video-text">
        <h3 class="youtube-video-title">{{ video.snippet.title }}</h3>
        <p class="youtube-video-description">
          🗓️ {{ video.snippet.publishedAt | date: "%b %-d, %Y" }} · 
          ⏱️ {{ video.contentDetails.duration | replace: "PT", "" | replace: "H", "h " | replace: "M", "m " | replace: "S", "s" }}
        </p>
        <p class="youtube-video-stats">
                  <span>Views: {{ video.statistics.viewCount | number_with_delimiter }}</span> | 
                  <span>Likes: {{ video.statistics.likeCount | number_with_delimiter }}</span> | 
                  <span>Comments: {{ video.statistics.commentCount | number_with_delimiter }}</span>
        </p>
      </div>
      <div class="youtube-video-thumbnail">
        <img src="{{ video.snippet.thumbnails.medium.url }}" alt="Thumbnail for {{ video.snippet.title }}">
      </div>
    </div>
  </a>
  {% endfor %}
</div>

