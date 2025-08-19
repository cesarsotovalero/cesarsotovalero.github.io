---
layout: page
permalink: /youtube/by-likes.html
title: YouTube Videos by Likes
description: YouTube videos by César Soto Valero, sorted by number of likes.
published: true
---

<!-- Buttons for ordering YouTube videos -->
<div class="list-filters">
   <a href="/youtube/by-year.html" class="list-filter">By Year</a>
   <a href="/youtube/by-views.html" class="list-filter">By Views</a>
   <a href="/youtube/by-likes.html" class="list-filter">By Likes</a>
   <a href="/youtube/by-comments.html" class="list-filter">By Comments</a>
</div>

{% assign sorted_videos = site.data.youtube-videos | sort: "statistics.likeCount" | reverse %}
{% assign ranges_order = "100+,50-99,10-49,0-9" | split: "," %}

<!-- Likes cloud -->
<div class="tag-list">
  {% for range in ranges_order %}
    <a href="#{{ range }}" class="btn btn-primary tag-btn">
      <i class="fas fa-thumbs-up" aria-hidden="true"></i>&nbsp;{{ range }}&nbsp;
    </a>
  {% endfor %}
</div>

<div id="full-tags-list">
  {% for range in ranges_order %}
    {% assign videos_count = 0 %}
    {% for video in sorted_videos %}
      {% assign in_range = false %}
      {% assign likes = video.statistics.likeCount | plus: 0 %}
      {% if range == "100+" and likes >= 100 %}{% assign in_range = true %}{% endif %}
      {% if range == "50-99" and likes >= 50 and likes < 100 %}{% assign in_range = true %}{% endif %}
      {% if range == "10-49" and likes >= 10 and likes < 50 %}{% assign in_range = true %}{% endif %}
      {% if range == "0-9" and likes >= 0 and likes < 10 %}{% assign in_range = true %}{% endif %}
      {% if in_range %}
        {% assign videos_count = videos_count | plus: 1 %}
      {% endif %}
    {% endfor %}
    <h3 id="{{ range }}" class="linked-section">
      <i class="fas fa-thumbs-up" aria-hidden="true"></i>&nbsp;{{ range }}&nbsp;({{ videos_count }})
    </h3>
    <div class="video-list">
      {% for video in sorted_videos %}
        {% assign in_range = false %}
        {% assign likes = video.statistics.likeCount | plus: 0 %}
        {% if range == "100+" and likes >= 100 %}{% assign in_range = true %}{% endif %}
        {% if range == "50-99" and likes >= 50 and likes < 100 %}{% assign in_range = true %}{% endif %}
        {% if range == "10-49" and likes >= 10 and likes < 50 %}{% assign in_range = true %}{% endif %}
        {% if range == "0-9" and likes >= 0 and likes < 10 %}{% assign in_range = true %}{% endif %}
        {% if in_range %}
          <div class="tag-entry">
            <a href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank">{{ video.snippet.title | truncatewords: 15 }}</a>
            <div class="entry-date">
              <time datetime="{{ video.snippet.publishedAt }}">{{ video.snippet.publishedAt | date: "%B %-d, %Y" }}</time>
              <span class="video-stats">
                · 👀 {{ video.statistics.viewCount | number_with_delimiter }}
                · 👍 {{ video.statistics.likeCount | number_with_delimiter }}
                · 💬 {{ video.statistics.commentCount | number_with_delimiter }}
                · ⏱️ {{ video.contentDetails.duration | replace: "PT", "" | replace: "H", "h " | replace: "M", "m " | replace: "S", "s" }}
              </span>
            </div>
          </div>
        {% endif %}
      {% endfor %}
    </div>
  {% endfor %}
</div>
<!-- markdownlint-enable MD033 MD041 MD022 -->
