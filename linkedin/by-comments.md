---
layout: page
permalink: /linkedin/by-comments.html
title: LinkedIn Posts by Comments
description: LinkedIn posts by César Soto Valero, sorted by number of comments.
published: true
---

{% include follow-on-linkedin.html %}

<!-- Buttons for ordering LinkedIn posts -->
<div class="list-filters">
  <a href="/linkedin/by-year.html" class="list-filter">By Year</a>
  <a href="/linkedin/by-reactions.html" class="list-filter">By Reactions</a>
  <a href="/linkedin/by-comments.html" class="list-filter">By Comments</a>
</div>

{% assign sorted_posts = site.data.linkedin-posts.data.posts | sort: "commentsCount" | reverse %}
{% assign ranges_order = "100+,50-99,10-49,0-9" | split: "," %}

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
   {% assign posts_count = 0 %}
   {% for post in sorted_posts %}
    {% assign comments = post.commentsCount | default: 0 %}
    {% assign in_range = false %}
    {% if range == "100+" and comments >= 100 %}
      {% assign in_range = true %}
    {% elsif range == "50-99" and comments >= 50 and comments < 100 %}
      {% assign in_range = true %}
    {% elsif range == "10-49" and comments >= 10 and comments < 50 %}
      {% assign in_range = true %}
    {% elsif range == "0-9" and comments >= 0 and comments < 10 %}
      {% assign in_range = true %}
    {% endif %}
    {% if in_range %}
      {% assign posts_count = posts_count | plus: 1 %}
    {% endif %}
   {% endfor %}
   <h3 id="{{ range }}" class="linked-section">
    <i class="fas fa-comments" aria-hidden="true"></i>
    &nbsp;{{ range }}&nbsp;({{ posts_count }})
   </h3>
   <div class="post-list">
    {% for post in sorted_posts %}
      {% assign comments = post.commentsCount | default: 0 %}
      {% assign in_range = false %}
      {% if range == "100+" and comments >= 100 %}
       {% assign in_range = true %}
      {% elsif range == "50-99" and comments >= 50 and comments < 100 %}
       {% assign in_range = true %}
      {% elsif range == "10-49" and comments >= 10 and comments < 50 %}
       {% assign in_range = true %}
      {% elsif range == "0-9" and comments >= 0 and comments < 10 %}
       {% assign in_range = true %}
      {% endif %}
      {% if in_range %}
       <div class="tag-entry">
        <a href="{{ post.url }}" target="_blank">{{ post.text | truncatewords: 15 }}</a>
        <div class="entry-date">
          <time datetime="{{ post.posted_at.date }}">{{ post.posted_at.date | date: "%b %-d, %Y" }}</time>
          <span class="post-stats">
           · <i class="fas fa-comments" aria-hidden="true"></i> {{ post.commentsCount | default: 0 }}
           · <i class="fas fa-thumbs-up" aria-hidden="true"></i> {{ post.totalReactionCount | default: 0 }}
           · <i class="fas fa-retweet" aria-hidden="true"></i> {{ post.repostsCount | default: 0 }}
          </span>
        </div>
       </div>
      {% endif %}
    {% endfor %}
   </div>
  {% endfor %}
</div>
