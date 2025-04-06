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
          Published at: {{ video.snippet.publishedAt | date: "%B %-d, %Y" }}<br>
          Duration: {{ video.contentDetails.duration | replace: "PT", "" | replace: "H", " hours " | replace: "M", " minutes " | replace: "S", " seconds" }}
        </p>
        <p class="youtube-video-stats">
          <span>Views: {{ video.statistics.viewCount }}</span> | 
          <span>Likes: {{ video.statistics.likeCount }}</span> | 
          <span>Comments: {{ video.statistics.commentCount }}</span>
        </p>
      </div>
      <div class="youtube-video-thumbnail">
        <img src="{{ video.snippet.thumbnails.medium.url }}" alt="Thumbnail for {{ video.snippet.title }}">
      </div>
    </div>
  </a>
  {% endfor %}
</div>

