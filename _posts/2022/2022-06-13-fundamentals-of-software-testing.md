---
layout: post
title: Fundamentals of Software Testing
subtitle: With examples
tags: tools
description: TODO
keywords:
  - customize command line,
  - beautiful terminal,
  - Oh-my-zsh,
  - Beautiful prompt,
image: ../img/posts/2022/walking_alone_cover.jpg
share-img: ../img/posts/2022/walking_alone_cover.jpg
show-avatar: false
toc: true
date: 2022/06/13
author: cesarsotovalero
published: false
---


<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/walking_alone.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; Doing software development without proper testing dangerous, like running away with no clear direction. Photo of my little son in <a href="https://goo.gl/maps/1awrQ9VeArmtY8Fr5">Tessinparken</a>, where my little son happily plays without caring about anything else.
  </figcaption>
</figure>

# Oracle

> The oracle in a unit test specifies a behavior that is ex as a consequence of running the MUT with a specific test input.

# Mocking

1. Mocking
2. Stubbing
3. Verifying

## Mocking

Real objects can be replaced with “fake” implementations called mocks. 

> “Mocking is a mechanism to replace real objects with skeletal implementations that mimic them.” -- [Thomas and Hunt](https://ieeexplore.ieee.org/document/1003449)

## Stubbing

Mocked objects can be stubbed to produce tailored behavior. 

> “Stubbing is the process of initializing a mock object to behave in specific, pre-determined ways.” -- [Martin Fowler](https://martinfowler.com/articles/mocksArentStubs.html)

## Verifying

The  interactions made with the mocks can be verified, such as the number of times  they were triggered with a given input, and in a specific sequence.

> “Verifying a mocked object consists of assessing its behavior for a particular stub.” [Beckman et al.](https://link.springer.com/chapter/10.1007/978-3-642-22655-7_2)


# Assertions 



# Footnotes

TODO