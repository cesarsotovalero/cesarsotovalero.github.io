---
layout: post
title: Mining GitHub for Research Purposes
subtitle: Available datasets and tools
tags: github
description: TODO
keywords:
  - ChatGPT,
  - AI,
  - software engineering,
  - productivity
image: ../img/posts/2023/TODO.jpg
share-img: ../img/posts/2023/TODO.jpg
show-avatar: false
toc: true
date: 2023/04/01
author: cesarsotovalero
published: false
---

TODO

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/subway_in_red.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO. Photo of a painting in <a href="https://goo.gl/maps/cGN5k72vforbXD2T6">ABF Stockholm</a>.
  </figcaption>
</figure>

<aside class="quote">
    <em>“The beauty of our industry at some level is that it's not about who has capability, it's about who can actually exercise that capability and translate it into tangible products.” <cite>Satya Nadella</cite></em> 
</aside>

# Standard GitHub API


# GitHub Archive


## Clickhouse

Clickhouse is offering a SQL interface to [<i class="fab fa-github"></i> GitHub Archive](https://gharchive.org).
Github archive is ingesting and storing all github timeline events (e.g. issues, pushes, reviews, prs and so on) since ~2011. This dataset contains quite a bit of data, so you don't really want to download and analyze it yourself…

You can find a playground at https://play.clickhouse.com/play?user=play. As an example I wrote a small query returning the repositories with most stars :) Note that there is no event for unwatching, so it might slightly overcount stars.
Clickhouse also has a large repo of sample queries. I didn't previously know that every comment I post, every star I give, every commit I break, every review I make, gharchive is watching me and has a convenient SQL frontend :^)



# Further Reading



# Footnotes

[^1]: Great talk https://youtu.be/Unzc731iCUY