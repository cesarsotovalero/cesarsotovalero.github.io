---
permalink: software.html 
layout: page 
title: Software
subtitle: 💻
description: List of software projects created by César Soto Valero.
published: true
---

<!--
> "If you’re not contributing to open source, if your GitHub profile is not full of projects and commits, your “value” as a software developer is low, simply because this lack of open source activity tells everybody that you’re not passionate about software development and are simply working for money."
> -- <cite>Yegor Bugayenko</cite>
-->

# Author

{% badge https://stackoverflow.com/users/flair/10480869.png with=200 https://stackoverflow.com/users/10480869/cesarsotovalero %}

I contribute to open-source software on <a href="https://github.com/cesarsotovalero"><i class="fab fa-github"></i></a> [GitHub](https://github.com/cesarsotovalero).[^1]
Below is a list of software projects I have created.

  <div id="portfolio">
    <div id="tiles-big">
      {% for app in site.data.portfolio %}
	    <div class="tile">
          <a class="applink" href="{{ app.url }}">
            <img class="appimg" src="../img/logos/{{ app.img }}" />
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



[//]: # (see https://github.com/slarse/slarse/blob/master/README.md for more inspiration)


[^1]: Unless otherwise specified on the project page, all of them are released under [MIT license](https://opensource.org/licenses/MIT).