---
layout: page
title: Hi, I'm César
subtitle: Researcher & Developer
keywords: César Soto Valero, research, software engineering, KTH, WASP Sweden, software technology, PhD in Computer Science
description: PhD in Computer Science
use-site-title: true
---

<div class="header-hiddable">
   {% include social.html type="page" %}
</div>

<!-- Carbon ads -->
<div class="cesarcarbon">
  <script async type="text/javascript" src="//cdn.carbonads.com/carbon.js?serve=CESI52JM&placement=wwwcesarsotovaleronet" id="_carbonads_js"></script>
</div>

<div class="list-filters">
  <a href="/" class="list-filter filter-selected">Latest Posts</a>
  <a href="/all-posts" class="list-filter">All Posts</a>
  <a href="/tags" class="list-filter">Tag Index</a>
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
            {{ post.excerpt | strip_html | xml_escape | truncatewords: site.excerpt_length }} {% assign excerpt_word_count = post.excerpt
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
  