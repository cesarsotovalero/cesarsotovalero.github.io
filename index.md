---
layout: page
title: Hi, I'm César
subtitle: I'm a PhD student doing excellent research in Software Technology for the benefit of the Swedish industry
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


<ul class="list-inline text-center footer-links" id="black-icons">
          {% if site.author.facebook and site.footer-links-active.facebook %}
          <li>
            <a href="https://www.facebook.com/{{ site.author.facebook }}" style="color: black" title="Facebook">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
              </span>
              <span class="sr-only">Facebook</span>
            </a>
          </li>
          {% endif %}
          {% if site.author.github and site.footer-links-active.github %}
          <li>
            <a href="https://github.com/{{ site.author.github }}" style="color: black" title="My GitHub Profile">
              <span class="fa-stack fa" aria-hidden="true" >
                <i class="fab fa-github fa-stack-1x" ></i>
              </span>
              <span class="sr-only">GitHub</span>
            </a>
          </li>
          {% endif %}
          	  {% if site.author.stackoverflow and site.footer-links-active.stackoverflow %}
                    <li>
                      <a href="https://stackoverflow.com/users/{{ site.author.stackoverflow}}" style="color: black" title="My StackOverflow Profile">
                        <span class="fa-stack fa" aria-hidden="true">
                          <i class="fab fa-stack-overflow fa-stack-1x"></i>
                        </span>
                        <span class="sr-only">StackOverflow</span>
                      </a>
                    </li>
                    {% endif %}
                    &bull;
                                     {% if site.author.linkedin and site.footer-links-active.linkedin %}
                                      <li>
                                         <a href="https://linkedin.com/in/{{ site.author.linkedin }}" style="color: black" title="My LinkedIn Profile">
                                         <span class="fa-stack fa" aria-hidden="true">
                                           <i class="fab fa-linkedin-in fa-stack-1x"></i>
                                         </span>
                                            <span class="sr-only">LinkedIn</span>
                                         </a>
                                      </li>
                              {% endif %}
                    <li>
                      <a href="https://www.researchgate.net/profile/Cesar_Soto-Valero" style="color: black" title="My ResearchGate Profile">
                                  <span class="fa-stack fab" aria-hidden="true">
                                    <i class="ai ai-researchgate ai-1x"></i>
                                  </span>
                                  <span class="sr-only">ResearchGate</span>
                                </a>
                    </li>
                    <li>
                      <a href="https://scholar.google.es/citations?user=jNBoowwAAAAJ&hl=en" style="color: black" title="My GoogleScholar Profile">
                                                      <span class="fa-stack fab" aria-hidden="true">
                                                        <i class="ai ai-google-scholar ai-1x"></i>
                                                      </span>
                                                      <span class="sr-only">ResearchGate</span>
                                                    </a>
                    </li>
                    <li>
                      <a href="https://dblp.uni-trier.de/pers/s/Soto=Valero:C=eacute=sar.html" style="color: black" title="My dblp Profile">
                            <span class="fa-stack fab" aria-hidden="true">
                                                        <i class="ai ai-dblp ai-1x"></i>
                                                      </span>
                                                      <span class="sr-only">DBLP</span>
                                                    </a>
                                        </li>
                    <li>
                                          <a href="https://orcid.org/0000-0003-0541-6411" style="color: black" title="My ORCID Id">
                                                <span class="fa-stack fab" aria-hidden="true">
                                                                            <i class="ai ai-orcid ai-1x"></i>
                                                                          </span>
                                                                          <span class="sr-only">ORCID</span>
                                                                        </a>
                                                            </li>                    
                    		  {% if site.author.twitter and site.footer-links-active.twitter %}
          <li>
            <a href="https://twitter.com/{{ site.author.twitter }}" style="color: black" title="Twitter">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-twitter fa-stack-1x"></i>
              </span>
              <span class="sr-only">Twitter</span>
            </a>
          </li>
          {% endif %}
	  {% if site.author.reddit and site.footer-links-active.reddit %}
          <li>
            <a href="https://reddit.com/u/{{ site.author.reddit }}" style="color: black" title="Reddit">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-reddit fa-stack-1x"></i>
              </span>
              <span class="sr-only">Reddit</span>
            </a>
          </li>
          {% endif %}
           &bull;
          {% if site.author.youtube and site.footer-links-active.youtube %}
                    <li>
                      <a href="https://www.youtube.com/{{ site.author.youtube }}" style="color: black" title="My YouTube Profile">
                      <span class="fa-stack fa" aria-hidden="true">
                          <i class="fab fa-youtube fa-stack-1x"></i>
                        </span>
                        <span class="sr-only">YouTube</span>
                      </a>
                    </li>
                    {% endif %}
		  {% if site.author.email and site.footer-links-active.email %}
          <li>
            <a href="mailto:{{ site.author.email }}" style="color: black" title="Email me">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fas fa-envelope fa-stack-1x"></i>
              </span>
              <span class="sr-only">Email me</span>
            </a>
          </li>
          {% endif %}
		  {% if site.author.xing and site.footer-links-active.xing %}
          <li>
            <a href="https://www.xing.com/profile/{{ site.author.xing }}" style="color: black" title="Xing">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-xing fa-stack-1x"></i>
              </span>
              <span class="sr-only">Xing</span>
            </a>
          </li>
          {% endif %}
      {% if site.author.snapchat and site.footer-links-active.snapchat %}
          <li>
            <a href="https://www.snapchat.com/add/{{ site.author.snapchat }}" style="color: black" title="Snapchat">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-snapchat-ghost fa-stack-1x"></i>
              </span>
              <span class="sr-only">Snapchat</span>
            </a>
          </li>
          {% endif %}
      {% if site.author.instagram and site.footer-links-active.instagram %}
          <li>
            <a href="https://www.instagram.com/{{ site.author.instagram }}" style="color: black" title="Instagram">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-instagram fa-stack-1x"></i>
              </span>
              <span class="sr-only">Instagram</span>
            </a>
          </li>
          {% endif %}
      {% if site.author.spotify and site.footer-links-active.spotify %}
          <li>
            <a href="https://open.spotify.com/user/{{ site.author.spotify }}" style="color: black" title="Spotify">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-spotify fa-stack-1x"></i>
              </span>
              <span class="sr-only">Spotify</span>
            </a>
          </li>
       {% endif %}
      {% if site.author.telephone and site.footer-links-active.telephone %}
          <li>
            <a href="tel:{{ site.author.telephone }}" title="Phone">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-phone fa-stack-1x"></i>
              </span>
              <span class="sr-only">Phone</span>
            </a>
          </li>
        {% endif %}
		  {% if site.footer-links-active.rss %}
          <li>
            <a href="{{ '/feed.xml' | prepend: site.baseurl }}" style="color: black" title="RSS">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-rss fa-stack-1x"></i>
              </span>
              <span class="sr-only">RSS</span>
            </a>
          </li>
          {% endif %}
      {% if site.author.steam and site.footer-links-active.steam %}
          <li>
            <a href="https://steamcommunity.com/id/{{ site.author.steam }}" style="color: black" title="Steam">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-steam fa-stack-1x"></i>
              </span>
              <span class="sr-only">Steam</span>
            </a>
          </li>
          {% endif %}
      {% if site.author.twitch and site.footer-links-active.twitch %}
          <li>
            <a href="https://www.twitch.tv/{{ site.author.twitch }}" style="color: black" title="Twitch">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-twitch fa-stack-1x"></i>
              </span>
              <span class="sr-only">Twitch</span>
            </a>
          </li>
          {% endif %}
      {% if site.author.yelp and site.footer-links-active.yelp %}
          <li>
            <a href="https://{{ site.author.yelp }}.yelp.com" style="color: black" title="Yelp">
              <span class="fa-stack fa" aria-hidden="true">
                <i class="fa fa-circle fa-stack-1x"></i>
                <i class="fa fa-yelp fa-stack-1x "></i>
              </span>
              <span class="sr-only">Yelp</span>
            </a>
          </li>
          {% endif %}
        </ul>

<div class="list-filters">
    <a class="list-filter general-button" href="/publications">Publications</a>
    <a class="list-filter general-button" href="/software">Software</a>
    <a class="list-filter general-button" href="/service">Service</a>
</div>

<!-- 
> "It seems that perfection is attained, not when there is nothing more to add, but when there is nothing more to take away"
> -- <cite>Antoine de Saint-Exupéry</cite>

The ultimate defense is to drive the complexity of the ultimate attack up so high that the cost of attack is too high to be worth performing -->

---

<h1 class="text-center" style="font-family: 'Open Sans'; font-weight: lighter; margin-bottom: 0px; margin-top: 25px">Recent Blog Posts</h1> 
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
              			<span class="post-meta" title="Estimated read time">
                <svg id="i-clock" viewBox="0 0 32 32" width="18" height="18" fill="none" stroke="currentcolor" stroke-linecap="round"
              	   stroke-linejoin="round" stroke-width="2"><circle cx="16" cy="16" r="14" /><path d="M16 8 L16 16 20 20" /></svg>
                {% assign words = content | number_of_words %}
                {% if words < 360 %}
                  1 min read.
                {% else %}
                  {{ words | divided_by:180 }} mins read
                {% endif %}
              </span>
              			<style>
              				svg#i-clock {vertical-align: middle;}
              			</style>
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
<ul class="pager main-pager">
  <li>
    <a class="text-right" href="{{site.baseurl}}/blog">See all posts </a>
  </li>
</ul>

</div>

---

<h1 class="text-center" style="font-family: 'Open Sans'; font-weight: lighter">Organizations </h1>

<p align="center">
<a href="https://www.kth.se"><img class="" title="KTH" src="https://www.cesarsotovalero.net/img/logos/kth_logo.png" alt="KTH" height="85"></a>
<a href="http://wasp-sweden.org"><img class="" title="WASP" src="https://www.cesarsotovalero.net/img/logos/wasp_logo.png" alt="WASP" height="100"></a>
<a href="https://www.castor.kth.se"><img class="" title="CASTOR" src="https://www.cesarsotovalero.net/img/logos/castor_logo.png" alt="CASTOR" height="70"> </a>
</p>

 
 

