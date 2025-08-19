---
layout: page
permalink: /youtube/by-views.html
title: YouTube Videos by Views
description: YouTube videos created by César Soto Valero, sorted by number of views.
published: true
---

{% include subscribe-on-youtube.html %}

<!-- Buttons for ordering YouTube videos -->
<div class="list-filters">
   <a href="/youtube/by-year.html" class="list-filter">By Year</a>
   <a href="/youtube/by-views.html" class="list-filter">By Views</a>
   <a href="/youtube/by-likes.html" class="list-filter">By Likes</a>
   <a href="/youtube/by-comments.html" class="list-filter">By Comments</a>
</div>

{% comment %} Begin replacement of existing views list block {% endcomment %}
{% assign sorted_videos = site.data.youtube-videos | sort: "statistics.viewCount" | reverse %}
{% assign ranges_order = "0-99#100-999#1,000-9,999#10,000+" | split: "#" %}

<!-- Views cloud -->
<div class="tag-list">
  {% for range in ranges_order %}
    <a href="#{{ range }}" class="btn btn-primary tag-btn">{{ range }}</a>
  {% endfor %}
</div>

<div id="full-tags-list" style="margin-top: 20px;">
  {% for range in ranges_order %}
    {% assign videos_count = 0 %}
    {% for video in sorted_videos %}
      {% assign views = video.statistics.viewCount | plus: 0 %}
      {% assign in_range = false %}
      {% if range == "0-99" and views >= 0 and views < 100 %}
        {% assign in_range = true %}
      {% elsif range == "100-999" and views >= 100 and views < 1000 %}
        {% assign in_range = true %}
      {% elsif range == "1,000-9,999" and views >= 1000 and views < 10000 %}
        {% assign in_range = true %}
      {% elsif range == "10,000+" and views >= 10000 %}
        {% assign in_range = true %}
      {% endif %}
      {% if in_range %}
        {% assign videos_count = videos_count | plus: 1 %}
      {% endif %}
    {% endfor %}
    <h3 id="{{ range }}" class="linked-section">{{ range }} ({{ videos_count }})</h3>
    <div class="post-list">
      {% for video in sorted_videos %}
        {% assign views = video.statistics.viewCount | plus: 0 %}
        {% assign in_range = false %}
        {% if range == "0-99" and views >= 0 and views < 100 %}
          {% assign in_range = true %}
        {% elsif range == "100-999" and views >= 100 and views < 1000 %}
          {% assign in_range = true %}
        {% elsif range == "1,000-9,999" and views >= 1000 and views < 10000 %}
          {% assign in_range = true %}
        {% elsif range == "10,000+" and views >= 10000 %}
          {% assign in_range = true %}
        {% endif %}
        {% if in_range %}
          <div class="tag-entry">
            <a href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank">{{ video.snippet.title }}</a>
            <div class="entry-date">
              <time datetime="{{ video.snippet.publishedAt }}">{{ video.snippet.publishedAt | date: "%B %-d, %Y" }}</time>
              <span class="post-stats">
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
{% comment %} End replacement of existing views list block {% endcomment %}
