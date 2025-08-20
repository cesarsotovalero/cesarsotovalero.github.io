---
layout: page
permalink: /linkedin/by-year
title: LinkedIn Posts by Year
description: All LinkedIn posts posted by César Soto Valero, organized by year.
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

{% assign date_format = site.date_format | default: "%B %-d, %Y" %}
{% assign years_list = "" | split: "" %}
{% for post in site.data.linkedin-posts.data.posts %}
{% assign post_year = post.posted_at.date | date: "%Y" %}
{% unless years_list contains post_year %}
{% assign years_list = years_list | push: post_year %}
{% endunless %}
{% endfor %}
{% assign years_list = years_list | sort %}

<!-- Years cloud -->
<div class="tag-list">
     {% for year in years_list %}
     <a href="#{{- year -}}" class="btn btn-primary tag-btn"><i class="fas fa-calendar-alt" aria-hidden="true"></i>&nbsp;{{- year -}} &nbsp;</a>
     {% endfor %}
</div>

{% assign reverse_years_list = years_list | reverse %}

<div id="full-tags-list">
     {% for year in reverse_years_list %}
     {% assign posts_count = 0 %}
     {% for post in site.data.linkedin-posts.data.posts %}
          {% assign post_year = post.posted_at.date | date: "%Y" %}
          {% if post_year == year %}
                {% assign posts_count = posts_count | plus: 1 %}
          {% endif %}
     {% endfor %}
     <h3 id="{{- year -}}" class="linked-section">
          <i class="fas fa-calendar-alt" aria-hidden="true"></i>
          &nbsp;{{- year -}}&nbsp;({{ posts_count }})
     </h3>
     <div class="post-list">
          {% for post in site.data.linkedin-posts.data.posts %}
          {% assign post_year = post.posted_at.date | date: "%Y" %}
          {% if post_year == year %}
          <div class="tag-entry">
                <a href="{{ post.url }}" target="_blank">{{ post.text | truncatewords: 15 }}</a>
                <div class="entry-date">
                     <!-- markdownlint-disable MD033 -->
                     <time datetime="{{ post.posted_at.date }}">{{ post.posted_at.date | date: "%b %-d, %Y"}}</time>
                     <!-- markdownlint-enable MD033 -->
                     <!-- markdownlint-disable MD033 -->
                     <span class="post-stats">
                          · <i class="fas fa-thumbs-up" aria-hidden="true"></i> {{ post.totalReactionCount | default: 0 }}
                          · <i class="fas fa-comment" aria-hidden="true"></i> {{ post.commentsCount | default: 0 }}
                          · <i class="fas fa-retweet" aria-hidden="true"></i> {{ post.repostsCount | default: 0 }}
                     </span>
                     <!-- markdownlint-enable MD033 -->
                </div>
          </div>
          {% endif %}
          {% endfor %}
     </div>
     {% endfor %}
</div>
