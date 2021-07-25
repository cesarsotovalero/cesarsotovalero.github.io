---
layout: page
title: Hi, I'm César
subtitle: I'm a Ph.D. student doing excellent research in Software Technology
keywords: César Soto Valero, research, software engineering, KTH, WASP, PhD student
description: I'm a PhD student doing excellent research in Software Technology
use-site-title: true
---

{% include social.html type="page" %}


---

<div class="list-filters">
  <a href="/" class="list-filter filter-selected">Latest Posts</a>
  <a href="/popular" class="list-filter">Popular</a>
  <a href="/tutorials" class="list-filter">Tutorials</a>
  <a href="/tags" class="list-filter">Index</a>
</div>

<div class="posts-list">
  {% for post in site.posts limit:6 %}
  <article class="post-preview-home">
  <article class="text-left" >
    <span class="text-left">  
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
    </span>
        <div class="post-entry-container">
        {% if post.image %}
              <div class="post-image" style="height: auto; width: auto;">
                <a href="{{ post.url | prepend: site.baseurl }}">
                  <img src="{{ post.image }}">
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
    <a class="text-right" href="{{site.baseurl}}/blog">See all posts </a>
  </li>
</ul>

</div>

---

<h1 class="text-center" style="font-family: 'Linux Biolinum'; font-weight: lighter">Organizations </h1>

<p align="center">
<a href="https://www.kth.se"><img class="" title="KTH" src="https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/logos/kth_logo.png" alt="KTH" height="65"></a>
<a href="http://wasp-sweden.org"><img class="" title="WASP" src="https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/logos/wasp_logo.png" alt="WASP" height="75"></a>
<a href="https://www.castor.kth.se"><img class="" title="CASTOR" src="https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/logos/castor_logo.png" alt="CASTOR" height="50"> </a>
</p>
