---
permalink: youtube.html
layout: page
title: YouTube Videos
subtitle: "🎥"
description: List of YouTube videos created by César Soto Valero.
published: true
---

{% include subscribe-on-youtube.html %}

<!-- Buttons for ordering YouTube videos -->
<div class="list-filters">
   <a href="/youtube/all.html" class="list-filter">By Year</a>
   <a href="/youtube/views.html" class="list-filter">By Views</a>
   <a href="/youtube/likes.html" class="list-filter">By Likes</a>
   <a href="/youtube/comments.html" class="list-filter">By Comments</a>   
</div>

<div class="youtube-videos-container post-preview">
  {% for video in site.data.youtube-videos %}
  <a href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank" class="youtube-video-link">
    <div class="youtube-video-card">
      <div class="youtube-video-text">
        <h3 class="youtube-video-title">{{ video.snippet.title }}</h3>
        <p class="youtube-video-description">
          Published on {{ video.snippet.publishedAt | date: "%b %-d, %Y" }} · 
          {{ video.contentDetails.duration | replace: "PT", "" | replace: "H", "h " | replace: "M", "m " | replace: "S", "s" }}
        </p>
        <p class="youtube-video-stats">
                  <span>👀 Views: {{ video.statistics.viewCount | number_with_delimiter }}</span> | 
                  <span>👍 Likes: {{ video.statistics.likeCount | number_with_delimiter }}</span> | 
                  <span>💬 Comments: {{ video.statistics.commentCount | number_with_delimiter }}</span>
        </p>
      </div>
      <div class="youtube-video-thumbnail">
        <img src="{{ video.snippet.thumbnails.medium.url }}" alt="Thumbnail for {{ video.snippet.title }}">
      </div>
    </div>
  </a>
  {% endfor %}
</div>
console.log("Total YouTube videos: " + site.data.youtube-videos.length);

