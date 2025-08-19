---
layout: page
permalink: linkedin.html
title: LinkedIn Posts
description: LinkedIn posts posted by César Soto Valero.
published: true
---

{% include follow-on-linkedin.html %}

<!-- Buttons for ordering LinkedIn posts -->
<div class="list-filters">
   <a href="/linkedin/by-year.html" class="list-filter">By Year</a>
   <a href="/linkedin/by-reactions.html" class="list-filter">By Reactions</a>
   <a href="/linkedin/by-comments.html" class="list-filter">By Comments</a>
</div>

<div class="linkedin-posts-container post-preview">
  {% for post in site.data.linkedin-posts.data.posts %}
  <a href="{{ post.url }}" target="_blank" class="linkedin-post-link">
    <div class="linkedin-post-card">
      <div class="linkedin-post-text">
        <h3 class="linkedin-post-title">{{ post.text | truncatewords: 15 }}</h3>
        <p class="linkedin-post-description">
          Posted on {{ post.posted_at.date | date: "%b %-d, %Y" }}
        </p>
        <p class="linkedin-post-stats">
          <span>👍 Reactions: {{ post.totalReactionCount | default: 0 }}</span> |
          <span>💬 Comments: {{ post.commentsCount | default: 0 }}</span> |
          <span>🔁 Repost: {{ post.repostsCount | default: 0 }}</span>
        </p>
      </div>
      {% assign media_folder = '/assets/images/linkedin/' | append: post.posted_at.timestamp | append: '/' %}
      {% assign post_media = nil %}
      {% for file in site.static_files %}
        {% if file.path contains media_folder %}
          {% assign post_media = file.path %}
          {% break %}
        {% endif %}
      {% endfor %}

      {% if post_media %}
      <div class="linkedin-post-thumbnail">
        {% if post.media and post.media.type == 'video' %}
        <video controls>
          <source src="{{ post_media }}" type="video/mp4">
          Your browser does not support the video tag.
        </video>
        {% else %}
        <img src="{{ post_media }}" alt="LinkedIn Post Image">
        {% endif %}
      </div>
      {% endif %}
    </div>

  </a>
  {% endfor %}
</div>
