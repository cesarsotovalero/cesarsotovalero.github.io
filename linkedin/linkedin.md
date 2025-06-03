---
permalink: linkedin.html
layout: page
title: LinkedIn Posts
subtitle: '🤝'
description: LinkedIn posts posted by César Soto Valero.
published: true
---

{% include follow-on-linkedin.html %}

<!-- Buttons for ordering LinkedIn posts -->
<div class="list-filters">
   <a href="/linkedin/all.html" class="list-filter">By Year</a>
   <a href="/linkedin/reactions.html" class="list-filter">By Reactions</a>
   <a href="/linkedin/comments.html" class="list-filter">By Comments</a>
</div>

<div class="linkedin-posts-container post-preview">
  {% for post in site.data.linkedin-posts.data %}
  <a href="{{ post.postUrl }}" target="_blank" class="linkedin-post-link">
    <div class="linkedin-post-card">
      <div class="linkedin-post-text">
        <h3 class="linkedin-post-title">{{ post.text | truncatewords: 15 }}</h3>
        <p class="linkedin-post-description">
          Posted on {{ post.postedDate | date: "%b %-d, %Y" }}          
        </p>
        <p class="linkedin-post-stats">
          <span>👍 Reactions: {{ post.totalReactionCount | default: 0 }}</span> | 
          <span>💬 Comments: {{ post.commentsCount | default: 0 }}</span> | 
          <span>🔁 Repost: {{ post.repostsCount | default: 0 }}</span>
        </p>
      </div>
      {% assign image_folder = '/assets/images/linkedin/' | append: post.postedDateTimestamp | append: '/' %}
      {% assign largest_image = nil %}
      {% assign max_width = 0 %}
      {% for file in site.static_files %}
        {% if file.path contains image_folder %}
          {% assign file_name = file.name | split: '.' | first %}
          {% assign dimensions = file_name | split: 'x' %}
          {% if dimensions.size == 2 %}
            {% assign width = dimensions[0] | plus: 0 %}
            {% if width > max_width %}
              {% assign max_width = width %}
              {% assign largest_image = file.path %}
            {% endif %}
          {% endif %}
        {% endif %}
      {% endfor %}
      
      {% if largest_image %}
      <div class="linkedin-post-thumbnail">
        <img src="{{ largest_image }}" alt="LinkedIn Post Image">
      </div>
      {% endif %}
    </div>
  </a>
  {% endfor %}
</div>
