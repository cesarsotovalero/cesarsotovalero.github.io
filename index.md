---
layout: page
title: César Soto Valero
subtitle: Ph.D. Student | Simplicity Lover | Nice Guy
use-site-title: true
---

<!--
bigimg: [
'/img/intro5.jpg': "A goal without a good plan and hard work is just a wish.", 
'/img/intro5.jpg': "Computer Science is not about machines, in the same way that astronomy is not about telescopes.", '/img/intro5.jpg': "The best defense against bugs is to make them impossible by design.",
'/img/intro5.jpg': "The hardest single part of building a software system is deciding precisely what to build.",
'/img/intro5.jpg': "What we call chaos is just patterns we haven’t recognized. What we call random is just patterns we can’t decipher.",
'/img/intro5.jpg': "Use the source code, Luke!",
]
css: '/css/extend-home.css'
-->

> "It seems that perfection is attained, not when there is nothing more to add, but when there is nothing more to take away"
> -- <cite>Antoine de Saint Exupéry</cite>

---


<h2 class="text-center">Current Work</h2>
<div style="text-align: justify"> 
I'm a <a href="http://wasp-sweden.org/">WASP</a> Ph.D. student  in the <a href="https://www.kth.se/scs/software-engineering">Department of Software and Computer Systems </a> working with <a href="https://www.kth.se/profile/baudry">Benoit Baudry</a> at <a href="https://kth.se">KTH Royal Institute of Technology</a> in Sweden <img class="emoji" title=":sweden:" alt=":sweden:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f1f8-1f1ea.png" height="20" width="20">. My current research focuses on developing static and dynamic code transformation for software debloating. For more on this topic, see the living review of <a href="https://www.cesarsotovalero.net/2020-01-24-software-debloating-papers">software debloating papers</a>, or consult the list of <a href="https://www.cesarsotovalero.net/2020-01-07-software-debloating-tools">software debloating tools</a>.

I also do knowledge-seeking software engineering research, e.g., by extracting useful information from data stored in software repositories. I'm interested in measuring the impact and pervasiveness of bloatware across large-scale software ecosystems. I'm keen to perform research on software technology that: <b>(1)</b> provide actionable insights to researchers and practitioners about how modern software is currently being developed and maintained, and <b>(2)</b> provide practical tools for developers in order to improve the software quality.
</div>

<!-- The ultimate defense is to drive the complexity of the ultimate attack up so high that the cost of attack is too high to be worth performing -->

<!-- Researcher / Developer / Data Scientist / Nice Guy -->

---

<h2 class="text-center">Current Projects</h2>
- _JDbl: Automatically Specializing Java Applications Through Dynamic Debloat_

---

<h2 class="text-center">Organizations </h2>
<p align="center">
<a href="https://www.kth.se"><img class="" title="KTH" src="../img/logos/kth_logo.png" alt="KTH" width="100" height="100"></a>
 <a href="http://wasp-sweden.org"><img class="" title="WASP" src="../img/logos/wasp_logo.png" alt="WASP" width="331" height="100"></a> 
 <a href="https://www.castor.kth.se"><img class="" title="CASTOR" src="../img/logos/castor_logo.png" alt="CASTOR" width="250" height="70"> </a> 
 </p>
 
 
<!-- 
<h1 class="text-center" style="text-decoration: underline;">Recent Posts</h1>
<div class="spacer"></div>

<div class="posts-list">
  {% for post in site.posts limit:10 %}
  <article class="post-preview">
    <a href="{{ post.url | prepend: site.baseurl }}">
      <h2 class="post-title">{{ post.title }}</h2>

      {% if post.subtitle %}
      <h3 class="post-subtitle">
        {{ post.subtitle }}
      </h3>
      {% endif %}
    </a>

    <p class="post-meta">
      Posted on {{ post.date | date: "%B %-d, %Y" }}
    </p>

    <div class="post-entry-container">
      {% if post.image %}
      <div class="post-image">
        <a href="{{ post.url | prepend: site.baseurl }}">
          <img src="{{ post.image }}">
        </a>
      </div>
      {% endif %}
      <div class="post-entry">
        {{ post.excerpt | strip_html | xml_escape | truncatewords: site.excerpt_length }}
        {% assign excerpt_word_count = post.excerpt | number_of_words %}
        {% if post.content != post.excerpt or excerpt_word_count > site.excerpt_length %}
          <a href="{{ post.url | prepend: site.baseurl }}" class="post-read-more">[Read&nbsp;More]</a>
        {% endif %}
      </div>
    </div>

    {% if post.tags.size > 0 %}
    <div class="blog-tags">
      Tags:
      {% if site.link-tags %}
      {% for tag in post.tags %}
      <a href="{{ site.baseurl }}/tags#{{ tag }}">{{ tag }}</a>
      {% endfor %}
      {% else %}
        {{ post.tags | join: ", " }}
      {% endif %}
    </div>
    {% endif %}

   </article>
  {% endfor %}
</div>

<ul class="pager main-pager">
  <li>
    <a href="{{site.baseurl}}/blog">See all posts </a>
  </li>
</ul>
-->
