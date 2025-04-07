---
permalink: linkedin.html
layout: page
title: LinkedIn Posts
description: List of LinkedIn posts videos posted by César Soto Valero.
published: true
---

{% include follow-on-linkedin.html %}

<div class="posts-container">
  {% for post in site.data.linkedin-posts.data %}
    <div class="post-card">
      <div class="post-card-text">
        <!-- The first 10 words in bold -->
        <p><strong>{{ post.text | truncatewords: 10 }}</strong></p>
        <!-- The remainder 30 words not in bold -->
        <p>{{ post.text | slice: 10, 40 }}</p>
        <!-- Date of posted -->
        <p>Posted on {{ post.postedDate | date: "%B %-d, %Y at %H:%M" }}</p>        
        <!-- Link to the full LinkedIn post -->
        <a href="{{ post.postUrl }}" target="_blank">Read Full Post</a>        
        <!-- If you want to show the post date or reaction count -->
        <p>Likes: {{ post.likeCount }}</p>
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
