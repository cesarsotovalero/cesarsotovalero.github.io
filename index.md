---
layout: page
title: César Soto Valero
subtitle: "I'm into {Tech ∩ Science}"
keywords: César Soto Valero, research, software engineering, KTH, WASP Sweden, software technology, PhD in Computer Science
description: César Soto Valero is a computer scientist, software engineer, and content creator. He completed a PhD at KTH Royal Institute of Technology in Sweden. César is passionate about science, technology, and education.
use-site-title: true
---

<div class="header-hiddable">
  {% include social.html type="page" %}
</div>

[//]: # (count all post published thi month)
{% assign current_date = 'now' | date: '%Y-%m' %}
{% assign current_month_post_count = 0 %}
{% for post in site.posts %}
  {% assign post_date = post.date | date: '%Y-%m' %}
  {% if post_date == current_date %}
    {% assign current_month_post_count = current_month_post_count | plus: 1 %}
  {% endif %}
{% endfor %}

[//]: # (count all the blog posts)
{% assign published_posts = site.posts | where: "published", true %}

[//]: # (count the number of tags)
{% assign all_tags = "" | split: "" %}
{% for post in site.posts %}
  {% assign all_tags = all_tags | concat: post.tags %}
{% endfor %}
{% assign unique_tags = all_tags | uniq %}

<div class="list-filters">
  <a href="/blog/this-month" class="list-filter"> This Month ({{ current_month_post_count }})</a>
  <a href="/blog/all-posts" class="list-filter">All ({{ published_posts.size }})</a>
  <a href="/blog/tags" class="list-filter">Tags ({{ unique_tags.size }})</a>
</div>

<div class="posts-list">
  {% for post in site.posts limit:10 %}
  <article class="post-preview-home">
  <article class="text-left" >
    <div class="text-left">  
        <a href="{{ post.url | prepend: site.baseurl }}" class="post-title-main">
          <h2 class="post-title-main">{{ post.title }}</h2>
        </a>
               {% if post.subtitle %}
               <h3 class="post-subtitle">
                 {{ post.subtitle }}
               </h3>
               {% endif %}
            <p class="post-meta-index">
              Posted on {{ post.date | date: "%B %-d, %Y" }}
              <!--
              <span id="comments-count">
                 <i class="fas fa-comments"></i>
                 <a href="https://www.cesarsotovalero.net{{post.url}}#disqus_thread">0 comments</a>
              </span>
              -->
            </p>
    </div>
        <div class="post-entry-container">
        {% if post.image %}
              <div class="post-image" style="height: auto; width: auto;">
                <a href="{{ post.url | prepend: site.baseurl }}">
                  <img src="{{ post.image }}" alt="{{ post.image }}">
                </a>
              </div>
              {% endif %}
          <div class="post-entry">
            {{ post.description | strip_html | truncatewords: site.excerpt_length }} {% assign excerpt_word_count = post.excerpt
            | number_of_words %} {% if post.content != post.excerpt or excerpt_word_count > site.excerpt_length %}
            <p class="post-read-more-block">
              <a href="{{ post.url | prepend: site.baseurl }}" class="post-read-more">Continue reading...</a>
            </p>
            {% endif %}
          </div>
        </div>
  </article>
  </article>
  {% endfor %}

<br>
<ul class="pager main-pager see-all">
  <li>
    <a class="text-right" href="{{site.baseurl}}/blog">View all posts </a>
  </li>
</ul>

</div>
