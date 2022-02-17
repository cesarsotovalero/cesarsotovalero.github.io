---
layout: post
title: Bus Factor of One is Hellish
subtitle: Why should you care about it?
tags: management
description: TODO
keywords:
  - truck factor,
  - software resilience,
  - knowledge management,
  - intelligent collaboration tools,
  - open-source management 
image: ../img/posts/2022/plane_paint_cover.jpg
share-img: ../img/posts/2022/plane_paint_cover.jpg
show-avatar: false
date: 2022/02/06
author: cesarsotovalero
published: false
---

TODO

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/plane_paint.jpg alt:"What if instead of a bus, the whole dev team is lost in a plane crash?" %}
  <figcaption class="stroke"> 
    &#169; What if instead of a bus, the whole dev team is lost in a plane crash? Photo from <a href="https://goo.gl/maps/j8GC4KtHEXoKxLpB8">Tekniska Högskolan station</a>.
  </figcaption>
</figure>


# Causes
Common reasons:
- burn out (probably #1)
- underpaid and undervalued so easily 'poached' (I don't like that term but don't have a better one)
- chronic illness
- accidents
- death.

> "How many or few would have to be hit by a truck (or quit) before the project is incapacitated?" -- James Coplien (in Pair Programming Illuminated)

James Coplien, Pair Programming Illuminated. Quote: "How many or few would have to be hit by a truck (or quit) before the project is incapacitated?"
I’m trying to calculate the bus or truck factor, which is a very funny statistic about knowledge concentration on a code repo.

# Notes

- The "bus factor" is the minimum number of team members that have to suddenly disappear from a project before the project stalls due to a lack of knowledgeable or competent personnel.
- The metric identifies how resilient the project is to a sudden engineer turnover.
- Bus factor is perceived as an important problem in collective development.
- Bus factor is a health metric for a project; the concept is related to socio-technical debt.

# Motivation

The knowledge in a project is shared and created not only by writing code.
Therefore, a bus factor algorithm that, in addition to Git uses project members' communication data, and code reviews data, could give better estimation of knownledge distribution.

# Novelty

- A multimodal bus factor estimation algorithm that uses data on code review and meetings together with Git data.
- The algorithm is evaluated on 13 projects developed at JetBrains and compared with the state-of-the-art tools.
- Interviews 269 engineers to collect opinions and concerns about the bust factor relevance and derive best practices to address this issue.

# Opinion

- Good paper by the JetBrain research team.
- Translating the bus factor definition into a bus factor estimation algorithm is nontrivial.
- The proposed algorithm is not usable in practice, in contrast with the algorithm of Avelino et al. (e.g., it uses variables such as the "maximum effective time in a meeting related to a commit", this blows my mind!)
- Bus factor is a sound human-based metric to assess the resilience of a software project.
- Overall, I think there are many different approaches studied in the literature, so it is difficult to make a novel contribution to the "bus factor problem."


# Conclusion

For example, use  to write


# Computing the bus factor 

The Degree of Authorship is computed by:

$$DOA(e,f) = 3.293 + 1.098FA + 0.164DL − 0.321 log(1 + AC)$$


The formula of Avelino is;

$$DOA(e, f ) > 0.75 * max_{e} DOA(e, f)$$

# Available tools

- https://github.com/aserg-ufmg/Truck-Factor
- https://github.com/SOM-Research/busfactor
- https://github.com/yamikuronue/BusFactor
- https://github.com/elek/bus-factor

# References

- https://eight2late.wordpress.com/2008/09/03/increasing-your-teams-bus-factor/
- https://en.wikipedia.org/wiki/Bus_factor
- https://www.bitband.com/blog/git-and-the-bus-factor-how-safe-is-your-project/
- https://lwn.net/Articles/651366/
- https://medium.com/@aserg.ufmg/top-30-github-projects-with-highest-truck-factor-ab0862e9bb7a


[//]: # (Enable Latex support, see https://zjuwhw.github.io/2017/06/04/MathJax.html)
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [['$','$'], ['\\(','\\)']],
    processEscapes: true
  }
});
</script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>