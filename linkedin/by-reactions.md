---
layout: page
permalink: /linkedin/by-reactions
title: LinkedIn Posts by Reactions
description: LinkedIn posts by César Soto Valero, sorted by number of reactions.
published: true
---

<!-- markdownlint-disable MD033 -->
{% include follow-on-linkedin.html %}
{% assign published_posts = site.data.linkedin-posts.data.posts %}

<!-- Buttons for ordering LinkedIn posts -->
<div class="list-filters">
  <a href="/linkedin" class="list-filter">All ({{ published_posts.size }})</a>
  <a href="/linkedin/by-year" class="list-filter">By Year</a>
  <a href="/linkedin/by-reactions" class="list-filter">By Reactions</a>
  <a href="/linkedin/by-comments" class="list-filter">By Comments</a>
</div>

{% assign sorted_posts = published_posts | sort: "totalReactionCount" | reverse %}
{% assign ranges_order = "100+,10-99,<10" | split: "," %}

<!-- Reactions cloud -->
<div class="tag-list">
  {% for range in ranges_order %}
    <a href="#{{ range }}" class="btn btn-primary tag-btn">
      <i class="fas fa-thumbs-up" aria-hidden="true"></i>&nbsp;{{ range }}&nbsp;
    </a>
  {% endfor %}
</div>

<div id="full-tags-list">
  {% for range in ranges_order %}
    {% assign posts_count = 0 %}
    {% for post in sorted_posts %}
      {% assign in_range = false %}
      {% assign reactions = post.totalReactionCount | default: 0 %}
      {% if range == "100+" and reactions >= 100 %}
        {% assign in_range = true %}
      {% endif %}
      {% if range == "10-99" and reactions >= 10 and reactions < 100 %}
        {% assign in_range = true %}
      {% endif %}
      {% if range == "<10" and reactions < 10 %}
        {% assign in_range = true %}
      {% endif %}
      {% if in_range %}
        {% assign posts_count = posts_count | plus: 1 %}
      {% endif %}
    {% endfor %}
    <h3 id="{{ range }}" class="linked-section">
      <i class="fas fa-thumbs-up" aria-hidden="true"></i>&nbsp;{{ range }}&nbsp;({{ posts_count }})
    </h3>
    <div class="post-list">
      {% for post in sorted_posts %}
        {% assign in_range = false %}
        {% assign reactions = post.totalReactionCount | default: 0 %}
        {% if range == "100+" and reactions >= 100 %}
          {% assign in_range = true %}
        {% endif %}
        {% if range == "10-99" and reactions >= 10 and reactions < 100 %}
          {% assign in_range = true %}
        {% endif %}
        {% if range == "<10" and reactions < 10 %}
          {% assign in_range = true %}
        {% endif %}
        {% if in_range %}
          <div class="tag-entry">
            <a href="{{ post.url }}" target="_blank">{{ post.text | truncatewords: 15 }}</a>
            <div class="entry-date">
              <time datetime="{{ post.posted_at.date }}">{{ post.posted_at.date | date: "%b %-d, %Y" }}</time>
              <span class="post-stats">
                · <i class="fas fa-thumbs-up" aria-hidden="true"></i> {{ post.totalReactionCount | default: 0 }}
                · <i class="fas fa-comment" aria-hidden="true"></i> {{ post.commentsCount | default: 0 }}
                · <i class="fas fa-retweet" aria-hidden="true"></i> {{ post.repostsCount | default: 0 }}
              </span>
            </div>
          </div>
        {% endif %}
      {% endfor %}
    </div>
  {% endfor %}
</div>
