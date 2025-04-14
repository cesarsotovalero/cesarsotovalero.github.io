---
permalink: linkedin.html
layout: page
title: LinkedIn Posts
subtitle: "🤝"
description: LinkedIn posts posted by César Soto Valero.
published: true
---

{% include follow-on-linkedin.html %}

<!-- Buttons for ordering LinkedIn posts -->
<div class="list-filters">
   <a href="/linkedin/all-posts.html" class="list-filter">All Posts (by Year)</a>
   <a href="/linkedin/more-reactions.html" class="list-filter">More Reactions</a>
   <a href="/linkedin/more-comments.html" class="list-filter">More Comments</a>
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
      {% if post.image and post.image.size > 0 %}
      <div class="linkedin-post-thumbnail">
        <img src="{{ post.image[0].url }}" alt="LinkedIn Post Image">
      </div>
      {% endif %}
    </div>
  </a>
  {% endfor %}
</div>
