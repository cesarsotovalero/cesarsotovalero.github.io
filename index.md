---
layout: page
title: Hello, I'm César
subtitle: Ph.D. Student | Simplicity Lover | + Guy
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
> -- <cite>Antoine de Saint-Exupéry</cite>


<!-- The ultimate defense is to drive the complexity of the ultimate attack up so high that the cost of attack is too high to be worth performing -->


---

<h1 class="text-center">Recent Posts</h1>
<div class="posts-list">
  {% for post in site.posts limit:3 %}
  <article class="text-left" >
    <span class="text-left">  
        <a href="{{ post.url | prepend: site.baseurl }}" class="post-title-main">
          <h3 class="post-title-main">{{ post.title }}</h3>
        </a>
            <p class="post-meta-index">
              Posted on {{ post.date | date: "%B %-d, %Y" }}
            </p>
    </span>
        <div class="post-entry-container">
          <div class="post-entry">
            {{ post.excerpt | strip_html | xml_escape | truncatewords: site.excerpt_length }} {% assign excerpt_word_count = post.excerpt
            | number_of_words %} {% if post.content != post.excerpt or excerpt_word_count > site.excerpt_length %}
            <a href="{{ post.url | prepend: site.baseurl }}" class="post-read-more">[Read&nbsp;More]</a>
            {% endif %}
          </div>
        </div>
  </article>
  {% endfor %}

<br>
<ul class="pager main-pager">
  <li>
    <a href="{{site.baseurl}}/blog">See all posts </a>
  </li>
</ul>

</div>



---

<h1 class="text-center">Organizations </h1>
<p align="center">
<a href="https://www.kth.se"><img class="" title="KTH" src="../img/logos/kth_logo.png" alt="KTH" width="100" height="100"></a>
 <a href="http://wasp-sweden.org"><img class="" title="WASP" src="../img/logos/wasp_logo.png" alt="WASP" width="331" height="100"></a> 
 <a href="https://www.castor.kth.se"><img class="" title="CASTOR" src="../img/logos/castor_logo.png" alt="CASTOR" width="250" height="70"> </a> 
 </p>
 
 

