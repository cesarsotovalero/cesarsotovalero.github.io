---
layout: page
permalink: /linkedin/all.html
title: All LinkedIn Posts
subtitle: '🤝'
description: All LinkedIn posts posted by César Soto Valero, organized by year.
published: true
---

{% include follow-on-linkedin.html %}

<!-- Buttons for ordering LinkedIn posts -->
<div class="list-filters">
   <a href="/linkedin/all.html" class="list-filter filter-selected">By Year</a>
   <a href="/linkedin/reactions.html" class="list-filter">By Reactions</a>
   <a href="/linkedin/comments.html" class="list-filter">By Comments</a>
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
                    · 👍 {{ post.totalReactionCount | default: 0 }}
                    · 💬 {{ post.commentsCount | default: 0 }}
                    · 🔁 {{ post.repostsCount | default: 0 }}
                </span>
                <!-- markdownlint-enable MD033 -->
            </div>
        </div>
        {% endif %}
        {% endfor %}
    </div>
    {% endfor %}
</div>
