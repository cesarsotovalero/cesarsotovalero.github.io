---
layout: page
permalink: /blog/tags
title: Blog Posts by Tags
description: "All the tags used in the blog posts written by Cesar Soto Valero"
---

{% include subscribe.html %}

{% assign date_format = site.date_format | default: "%B %-d, %Y" %}
    {%- capture site_tags -%}
        {%- for tag in site.tags -%}
            {{- tag | first -}}{%- unless forloop.last -%},{%- endunless -%}
        {%- endfor -%}
    {%- endcapture -%}
{%- assign tags_list = site_tags | split:',' | sort -%}

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
   <a href="/blog/this-month" class="list-filter"> This Month ({{ current_month_post_count }})</a>
   <a href="/blog/all" class="list-filter">All ({{ published_posts.size }})</a>
   <a href="/blog/tags" class="list-filter">Tags ({{ unique_tags.size }})</a>
</div>

<div class="tag-list">
{%- for tag in tags_list -%}
    <a href="#{{- tag -}}" class="btn btn-primary tag-btn"><i class="fas fa-tag" aria-hidden="true"></i>&nbsp;{{- tag -}}&nbsp;({{site.tags[tag].size}})</a>
{%- endfor -%}
</div>

<div id="full-tags-list">
{%- for tag in tags_list -%}
    <h3 id="{{- tag -}}" class="linked-section">
        <i class="fas fa-tag" aria-hidden="true"></i>
        &nbsp;{{- tag -}}&nbsp;({{site.tags[tag].size}})
    </h3>
    <div class="post-list">
        {%- for post in site.tags[tag] -%}
            <div class="tag-entry">
                <a href="{{ post.url | relative_url }}">{{- post.title -}}</a>
                <div class="entry-date">
                    <time datetime="{{- post.date | date_to_xmlschema -}}">{{- post.date | date: date_format -}}</time>
                </div>
            </div>
        {%- endfor -%}
    </div>
{%- endfor -%}
</div>
