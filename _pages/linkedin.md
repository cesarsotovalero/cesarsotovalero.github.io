---
permalink: linkedin.html
layout: page
title: LinkedIn
subtitle: 👨🏼‍💼
description: César Soto Valero's LinkedIn profile.
published: true
---

# All My Posts

<div class="posts-container">
  {% for post in site.data.linkedin-posts.data %}
    <div class="post-card">
      <div class="post-card-text">
        <!-- The first ~10 words as a heading -->
        <h3>{{ post.text | truncatewords: 10 }}</h3>

        <!-- The next ~40 words as a snippet -->
        <p>{{ post.text | truncatewords: 40 }}</p>
        
        <!-- Link to the full LinkedIn post -->
        <a href="{{ post.postUrl }}" target="_blank">Read Full Post</a>
        
        <!-- If you want to show the post date or reaction count -->
        <p><small>Posted on {{ post.postedDate | date: "%B %-d, %Y at %H:%M" }} | Likes: {{ post.likeCount }}</small></p>
      </div>
      
      <!-- Show the first image if it exists -->
      {% if post.image and post.image.size > 0 %}
        <div class="post-card-image">
          <img src="{{ post.image[0].url }}" alt="LinkedIn Post Image" />
        </div>
      {% endif %}
    </div>
{% endfor %}
</div>
