---
layout: page
permalink: /youtube/by-likes.html
title: YouTube Videos by Likes
description: YouTube videos created by César Soto Valero, sorted by number of likes.
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

{% assign sorted_videos = site.data.youtube-videos | sort: "statistics.likeCount" | reverse %}

<div id="full-tags-list" style="margin-top: 20px;">
    <div class="post-list">
        {% for video in sorted_videos %}
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
        {% endfor %}
    </div>
</div>
