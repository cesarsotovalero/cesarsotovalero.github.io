---
layout: page
permalink: /youtube/by-year.html
title: YouTube Videos by Year
description: YouTube videos created by César Soto Valero, organized by year.
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

{% assign date_format = site.date_format | default: "%B %-d, %Y" %}
{% assign years_list = "" | split: "" %}
{% for video in site.data.youtube-videos %}
{% assign video_year = video.snippet.publishedAt | date: "%Y" %}
{% unless years_list contains video_year %}
{% assign years_list = years_list | push: video_year %}
{% endunless %}
{% endfor %}
{% assign years_list = years_list | sort %}

<!-- Years cloud -->
<div class="tag-list">
     {% for year in years_list %}
     <a href="#{{- year -}}" class="btn btn-primary tag-btn"><i class="fas fa-calendar-alt" aria-hidden="true"></i>&nbsp;{{- year -}} &nbsp;</a>
     {% endfor %}
</div>

{% assign reverse_years_list = years_list | reverse %}

<div id="full-tags-list" style="margin-top: 20px;">
     {% for year in reverse_years_list %}
     {% assign videos_count = 0 %}
     {% for video in site.data.youtube-videos %}
          {% assign video_year = video.snippet.publishedAt | date: "%Y" %}
          {% if video_year == year %}
                {% assign videos_count = videos_count | plus: 1 %}
          {% endif %}
     {% endfor %}
     <h3 id="{{- year -}}" class="linked-section">
          <i class="fas fa-calendar-alt" aria-hidden="true"></i>
          &nbsp;{{- year -}}&nbsp;({{ videos_count }})
     </h3>
     <div class="post-list">
          {% for video in site.data.youtube-videos %}
          {% assign video_year = video.snippet.publishedAt | date: "%Y" %}
          {% if video_year == year %}
          <div class="tag-entry">
                <a href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank">{{ video.snippet.title }}</a>
                <div class="entry-date">
                     <time datetime="{{ video.snippet.publishedAt }}">{{ video.snippet.publishedAt | date: date_format }}</time>
                     <span class="post-stats">
                          · <i class="fas fa-eye"></i> {{ video.statistics.viewCount | number_with_delimiter }}
                          · <i class="fas fa-thumbs-up"></i> {{ video.statistics.likeCount | number_with_delimiter }}
                          · <i class="fas fa-comment"></i> {{ video.statistics.commentCount | number_with_delimiter }}
                          · <i class="fas fa-clock"></i> {{ video.contentDetails.duration | replace: "PT", "" | replace: "H", "h " | replace: "M", "m " | replace: "S", "s" }}
                     </span>
                </div>
          </div>
          {% endif %}
          {% endfor %}
     </div>
     {% endfor %}
</div>
