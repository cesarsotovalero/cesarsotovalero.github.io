---
permalink: linkedin.html
layout: page
title: LinkedIn Posts
subtitle: "🤝"
description: List of LinkedIn posts videos posted by César Soto Valero.
published: true
---

{% include follow-on-linkedin.html %}

<div class="linkedin-posts-container">
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
      {% if post.image and post.image.size > 0 %}
      <div class="linkedin-post-thumbnail">
        <img src="{{ post.image[0].url }}" alt="LinkedIn Post Image">
      </div>
      {% endif %}
    </div>
  </a>
  {% endfor %}
</div>
