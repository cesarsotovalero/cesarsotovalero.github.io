---
layout: page
permalink: /youtube/by-comments
title: YouTube Videos by Comments
description: YouTube videos created by César Soto Valero, sorted by number of comments.
published: true
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

{% assign sorted_videos = site.data.youtube-videos | sort: "statistics.commentCount" | reverse %}
{% assign ranges_order = "100+,10-99,<10" | split: "," %}
{% assign videos_by_range = "" | split: "" %}

{% for range in ranges_order %}
    {% assign filtered = "" | split: "" %}
    {% for video in sorted_videos %}
        {% assign comments = video.statistics.commentCount | plus: 0 %}
        {% if range == "100+" and comments >= 100 %}
            {% assign filtered = filtered | push: video %}
        {% elsif range == "10-99" and comments >= 10 and comments < 100 %}
            {% assign filtered = filtered | push: video %}
        {% elsif range == "<10" and comments < 10 %}
            {% assign filtered = filtered | push: video %}
        {% endif %}
    {% endfor %}
    {% assign videos_by_range = videos_by_range | push: filtered %}
{% endfor %}

<!-- Comments cloud -->
<div class="tag-list">
    {% for range in ranges_order %}
         <a href="#{{ range }}" class="btn btn-primary tag-btn">
                <i class="fas fa-comments" aria-hidden="true"></i>&nbsp;{{ range }}&nbsp;
         </a>
    {% endfor %}
</div>

<div id="full-tags-list">
    {% for range in ranges_order %}
        {% assign idx = forloop.index0 %}
        {% assign filtered_videos = videos_by_range[idx] %}
        <h3 id="{{ range }}" class="linked-section">
             <i class="fas fa-comments" aria-hidden="true"></i>&nbsp;{{ range }}&nbsp;({{ filtered_videos.size }})
        </h3>
        <div class="video-list">
            {% for video in filtered_videos %}
                 <div class="tag-entry">
                        <a href="https://www.youtube.com/watch?v={{ video.id }}" target="_blank">{{ video.snippet.title | truncatewords: 15 }}</a>
                        <div class="entry-date">
                            <time datetime="{{ video.snippet.publishedAt }}">{{ video.snippet.publishedAt | date: "%B %-d, %Y" }}</time>
                            <span class="video-stats">
                                 · <i class="fas fa-eye"></i> {% assign views = video.statistics.viewCount | plus: 0 %}{% if views >= 1000 %}{{ views | divided_by: 1000 }}K{% else %}{{ views | number_with_delimiter }}{% endif %}
                                 · <i class="fas fa-thumbs-up"></i> {{ video.statistics.likeCount | number_with_delimiter }}
                                 · <i class="fas fa-comments"></i> {{ video.statistics.commentCount | number_with_delimiter }}
                                 · <i class="fas fa-clock"></i> {{ video.contentDetails.duration | replace: "PT", "" | replace: "H", "h " | replace: "M", "m " | replace: "S", "s" }}
                            </span>
                        </div>
                 </div>
            {% endfor %}
        </div>
    {% endfor %}
</div>
<!-- markdownlint-enable MD033 -->
