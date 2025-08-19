---
layout: page
permalink: /blog/all.html
title: Blog Posts by Year
description: "All the blog posts written by Cesar Soto Valero"
---

{% include subscribe.html %}

{% assign date_format = site.date_format | default: "%B %-d, %Y" %}
{% assign years_list = "" | split: "" %}
    {%- for post in site.posts -%}
        {%- assign post_year = post.date | date: "%Y" -%}
        {%- unless years_list contains post_year -%}
            {%- assign years_list = years_list | push: post_year -%}
        {%- endunless -%}
    {%- endfor -%}
{%- assign years_list = years_list | sort -%}

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

<!-- Years cloud -->
<div class="tag-list">
    {%- for year in years_list -%}
    <a href="#{{- year -}}" class="btn btn-primary tag-btn"><i class="fas fa-calendar-alt" aria-hidden="true"></i>&nbsp;{{- year -}} &nbsp;</a>
    {%- endfor -%}
</div>

{% assign reverse_years_list = years_list | reverse %}
<div id="full-tags-list">
    {%- for year in reverse_years_list -%}
    {%- assign posts_count = 0 -%}
    {%- for post in site.posts -%}
        {%- assign post_year = post.date | date: "%Y" -%}
        {%- if post_year == year -%}
            {%- assign posts_count = posts_count | plus: 1 -%}
        {%- endif -%}
    {%- endfor -%}
    <h3 id="{{- year -}}" class="linked-section">
        <i class="fas fa-calendar-alt" aria-hidden="true"></i>
        &nbsp;{{- year -}}&nbsp;({{ posts_count }})
    </h3>
    <div class="post-list">
        {%- for post in site.posts -%}
        {%- assign post_year = post.date | date: "%Y" -%}
        {%- if post_year == year -%}
        <div class="tag-entry">
            <a href="{{ post.url | relative_url }}">{{- post.title -}}</a>
            <div class="entry-date">
                <time datetime="{{- post.date | date_to_xmlschema -}}">{{- post.date | date: date_format -}}</time>
            </div>
        </div>
        {%- endif -%}
        {%- endfor -%}
    </div>
    {%- endfor -%}
</div>
