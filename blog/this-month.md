---
layout: page
permalink: /blog/this-month.html
title: Blog Posts This Month
description: "All the blog posts written this month by Cesar Soto Valero"
---

{% include subscribe.html %}

{% assign current_month_name = 'now' | date: "%B" %}
{% assign current_year = 'now' | date: "%Y" %}
{% assign current_month = 'now' | date: "%m" %}
{% assign date_format = site.date_format | default: "%B %-d, %Y" %}

<!-- count all post published this month -->
{% assign current_date = 'now' | date: '%Y-%m' %}
{% assign current_month_post_count = 0 %}
{% for post in site.posts %}
{% assign post_date = post.date | date: '%Y-%m' %}
{% if post_date == current_date %}
{% assign current_month_post_count = current_month_post_count | plus: 1 %}
{% endif %}
{% endfor %}

<!-- count all the blog posts -->
{% assign published_posts = site.posts | where:"published", true %}

<!-- count the number of tags -->
{% assign all_tags = "" | split: "" %}
{% for post in site.posts %}
{% assign all_tags = all_tags | concat: post.tags %}
{% endfor %}
{% assign unique_tags = all_tags | uniq %}

<div class="list-filters">
   <a href="/blog/this-month.html" class="list-filter"> This Month ({{ current_month_post_count }})</a>
   <a href="/blog/all.html" class="list-filter">All ({{ published_posts.size }})</a>
   <a href="/blog/tags.html" class="list-filter">Tags ({{ unique_tags.size }})</a>
</div>

<div id="full-tags-list">
   <h3 id="{{- current_year -}}" class="linked-section">
      <i class="fas fa-calendar-alt" aria-hidden="true"></i>
      &nbsp;{{ current_month_name }},&nbsp;{{- current_year -}}
   </h3>
   <div class="post-list">
      {%- assign has_posts = false -%}
      {%- for post in site.posts -%}
      {%- assign post_year = post.date | date: "%Y" -%}
      {%- assign post_month = post.date | date: "%m" -%}
      {%- if post_year == current_year and post_month == current_month -%}
      {%- assign has_posts = true -%}
      <div class="tag-entry">
         <a href="{{ post.url | relative_url }}">{{- post.title -}}</a>
         <div class="entry-date">
            <time datetime="{{- post.date | date_to_xmlschema -}}">{{- post.date | date: date_format -}}</time>
         </div>
         <div class="entry-description">
            {{ post.description }}
         </div>
      </div>
      {%- endif -%}
      {%- endfor -%}
      {%- if has_posts == false -%}
      <div class="no-posts">
         <p>
            No posts published this month yet 😕
         </p>
      </div>
      {%- endif -%}
   </div>
</div>
