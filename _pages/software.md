---
permalink: software.html 
layout: page 
title: Software 
subtitle: Open-source contributions 
published: true
---

> "If you’re not contributing to open source, if your GitHub profile is not full of projects and commits, your “value” as a software developer is low, simply because this lack of open source activity tells everybody that you’re not passionate about software development and are simply working for money."
> -- <cite>Yegor Bugayenko</cite>

---

I develop robust software prototypes to support my research. I also contribute to open-source projects. Unless otherwise specified on the project page, all of my software projects are released under an MIT license. Below is a listing of those projects:

# Author

  <div id="portfolio">
    <div id="tiles-big">
      {% for app in site.data.portfolio %}
	    <div class="tile">
          <a class="applink" href="{{ app.url }}">
            <img class="appimg" src="https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/logos/{{ app.img }}" />
            <div class="apptitle">{{ app.title }}</div>
            <div class="gh-stats">
                <img class="gh-stat" src="//img.shields.io/github/stars/{{ app.stars }}" alt="GitHub stars">
                <img class="gh-stat" src="//img.shields.io/github/forks/{{ app.stars }}" alt="GitHub stars">
            </div>
            <div class="appdesc">{{ app.description }}</div>
          </a>
        </div>
	  {% endfor %}
    </div>
  </div>
