---
layout: page
title: Hi, I'm César
subtitle: A Ph.D. Student Doing Research in Software Technology
keywords: César Soto Valero, research, software engineering, KTH, WASP, Ph.D. student
description: I'm a Ph.D. Student Doing Research in Software Technology
use-site-title: true
---
{% include social.html type="page" %}

---

<div class="list-filters">
  <a href="/" class="list-filter">Latest Posts</a>
  <a href="/popular" class="list-filter">Popular</a>
  <a href="/tutorials" class="list-filter filter-selected">Tutorials</a>
  <a href="/tags" class="list-filter">Index</a>
</div>


{% assign posts = paginator.posts | default: site.posts %}

<div class="posts-list">
  {% for post in site.tags.tutorial %}
     <article class="post-preview">
      <span class="text-left">
     <a href="{{ post.url | prepend: site.baseurl }}">
       <h2 class="post-title">{{ post.title }}</h2>
     </a>
         {% if post.subtitle %}
       <h3 class="post-subtitle">
         {{ post.subtitle }}
       </h3>
       {% endif %}
     <p class="post-meta-index">
                     Posted on {{ post.date | date: "%B %-d, %Y" }}
              <!--- <span id="comments-count">
                 <i class="fas fa-comments"></i>
                 <a href="https://www.cesarsotovalero.net{{post.url}}#disqus_thread">0 comments</a>
              </span> -->
     </p>
         </span>
      <div class="post-entry-container">
         {% if post.image %}
         <div class="post-image" style="height: auto; width: auto;">
            <a href="{{ post.url | prepend: site.baseurl }}">
               <img src="{{ post.image }}"> </a></div>
         {% endif %}
         <div class="post-entry">
            {{ post.excerpt | strip_html | xml_escape | truncatewords: site.excerpt_length }} {% assign excerpt_word_count = post.excerpt
            | number_of_words %} {% if post.content != post.excerpt or excerpt_word_count > site.excerpt_length %}
            <p class="post-read-more-block">
               <a href="{{ post.url | prepend: site.baseurl }}" class="post-read-more">Continue reading...</a> {% endif %}
            </p>
         </div>
      </div>
     </article>
  {% endfor %}
</div>

{% if paginator.total_pages > 1 %}
<ul class="pagination main-pager">
  {% if paginator.previous_page %}
  <li class="page-item previous">
    <a class="page-link" href="{{ paginator.previous_page_path | absolute_url }}">&larr; Newer Posts</a>
  </li>
  {% endif %}
  {% if paginator.next_page %}
  <li class="page-item next">
    <a class="page-link" href="{{ paginator.next_page_path | absolute_url }}">Older Posts &rarr;</a>
  </li>
  {% endif %}
</ul>
{% endif %}



