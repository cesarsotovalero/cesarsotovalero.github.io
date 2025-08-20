---
layout: post
title: My PhD as a Comic
subtitle: The time when I became a superhero
tags: science
description: At the end of my PhD journey, I was lucky enough to be surrounded by professional software artists. Together, we created a comic to make the ideas of my PhD thesis more accessible and engaging to the non-tech audience. In this article, I share the comic and the story behind it.
keywords:
  - PhD thesis,
  - use comics for research,
  - communicating research,
  - delivering technical content,
image: ../img/posts/2023/2023-07-10/comic-cover.jpg
share-img: ../img/posts/2023/2023-07-10/comic-cover.jpg
show-avatar: false
toc: true
date: 2023/07/10
author: cesarsotovalero
published: true
---

Doing ~~good~~ science is hard.
Communicating science is even harder because it requires a larger doses of creativity.
I learned during my 5 years as a PhD student that art visuals and stories are excellent ways to [communicate scientific ideas and results](./blog/how-to-give-a-great-technical-presentation).
But using art as a form of expression is not easy, specially when dealing with complex technical content.
Nevertheless, it is worth the effort.
This is something I experienced at the end of my PhD journey.
Then, I was lucky enough to be surrounded by professional software artists who already mastered this skill.
Together, we created a comic to make the core ideas of my PhD thesis more accessible and engaging to the non-tech audience.[^4]
In this article, I share the comic pages, and the planning behind them.
If you are a PhD student interested in the use of comics (or other forms of art) for communicating your research, then this article is for you.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-07-10/board-for-phd-comic.jpg alt:"Whiteboard summarizing my PhD contributions" %}
  <figcaption class="stroke">
    I spend more than 3 hours explaining my PhD contribution (DepClean, DepTrim, and JDBL) to a team of software artists. I summarized the results of my 5 years of research work on a large whiteboard.
  </figcaption>
</figure>

# The Plan

During my PhD at KTH, I had the opportunity to collaborate with [reth&#124;read](https://rethread.art), a visionary collective of creators using [software art](https://en.wikipedia.org/wiki/Software_art) to communicate software engineering research.
I collaborated in the [un&#124;fold](https://rethread.art/projects/unfold) project, an  installation for the [Nobel Week Lights 2022](https://nobelweeklights.se/?lang=en).
Along the time, I meet many talented and creative software artists, and even shared office space with some of them.

By being exposed to they work, I learned that art is a powerful tool for making science resonate with hearts and minds.
One day, I was talking with [Maria Kling](https://www.linkedin.com/in/maria-euler-art-science-design), and she suggested me to create a comic to explain my PhD thesis in a fun and engaging way.
We had a few meetings where I explained the content of [my PhD thesis](../files/thesis/cesar-fulltext.pdf).
Explaining software concepts to software artists is easy, as many of them are great coders.

The picture above shows the output of the first meeting.
First, I illustrated the different facets of the global problem: "Debloating Java Applications."
This is illustrated in the top left corner of the whiteboard.
Then, I divided the whiteboard into three sections, one for each of my PhD contributions.
The goal was to create a comic to show the usefulness of these software tools: [<i class="fab fa-github"></i> DepClean](https://github.com/ASSERT-KTH/depclean), [<i class="fab fa-github"></i> DepTrim](https://github.com/ASSERT-KTH/deptrim), and [<i class="fab fa-github"></i> JDBL](https://github.com/ASSERT-KTH/jdbl).

# The Result

The full comic in PDF form is available [here](../files/thesis/phd-comic/comicfoldprintpagesreorderedadjusted.pdf).
More details as follows.

## First Contribution

The core idea of my first tool, DepClean, is to remove unused dependencies (a.k.a packages) from Java applications.
In other words, it is about getting rid of the software bloat coming from third-party code.
This involves the analysis and transformation of **dependency trees** in order to remove completely unused dependencies.

> "Imagine your computer program as a big, messy tree with components connected to different parts that are called dependencies or packages. Some of them are helpful, while others are just in the way. DepClean's job is to trim away the unnecessary branches, getting rid of the clutter coming from the unuseful dependencies that are added over time."

We wanted to illustrate this idea in a simple way.
In the comic, the superhero of our story (me) uses DepClean to snip away the unneeded branches of dependencies from his program's dependency tree, keeping it clean.
The result is shown below.

<figure class="jb_picture">
  {% responsive_image path: files/thesis/phd-comic/2.png alt:"Fist page of the comic" %}
  <figcaption class="stroke">
    Figure 2.
    First page of the comic, where the core idea is introduced along my first software tool: DepCLean.
  </figcaption>
</figure>

I really like the aesthetics of this page.
Note the three logos, one for each of the the tools, in the top right corner.[^1]
Also note that the comic is mostly in white and black, except for the parts that use the colors in the logos.
The source code in the background is [<i class="fab fa-github"></i> a real code snippet](https://github.com/ASSERT-KTH/depclean/blob/f8a2607178ed48e5843768c3cbc8e60406d63a66/depclean-core/src/main/java/se/kth/depclean/core/analysis/model/ProjectDependencyAnalysis.java#L171-L184) from the DepClean's GitHub repository.
I also like the last scene of this page, which serves as **a hook** to get the reader excited to turn to the next page!

## Second and Third Contributions

The next page of the comic is about my second and third PhD contributions, implemented in the tools JDBL and DepTrim.
JDBL is an advanced tool for debloating Java applications based on client's usage.
JDBL relies on dynamic analysis and code coverage tools for detecting the unnecessary code parts.[^2]
On the other hand, DepTrim relies on static analysis to remove unused code in partially used dependencies.[^3]
Both JDBL and DepTrim are like supercharged versions of DepClean, they help keep programs neat and tidy but in slightly different ways.
Now, let's take a look at the second page of the comic.

<figure class="jb_picture">
  {% responsive_image path: files/thesis/phd-comic/3.png alt:"Second of the comic" %}
  <figcaption class="stroke">
    Figure 3.
    Second page of the comic, showcasing how we can do better, using my two other tools: DepTrim and JDBL.
  </figcaption>
</figure>

Again, this page conveys the core ideas of my PhD thesis in a simple way.
The first scene shows the superhero (me) using DepTrim to remove unused code from partially used dependencies.
In the background of this scene, we can see [<i class="fab fa-github"></i> a source code snippet](https://github.com/ASSERT-KTH/jdbl/blob/ed028f68ebfb9c7f1ffce0d1fa32e7d08d68ce2d/jdbl-core/src/main/java/se/kth/castor/jdbl/coverage/JacocoCoverage.java#L200-L213) of JDBL.
The last scene features my supervisor and me celebrating the successful completion of my [hero's journey](https://en.wikipedia.org/wiki/Hero%27s_journey).

# Conclusion

Software art is a powerful medium for communicating complex scientific concepts.
I'm glad that I had the opportunity to collaborate with software artists dedicated full time to this endeavour.
I believe that the field of Computer Science could benefit from digital creations showcasing the complexity behind the most simple computing operations.

<aside class="quote">
    <em>“Science communication isn't just key, it's essential. It unlocks funding, boosts outreach, and serves as both an introduction and justification of research to society.”</em>
</aside>

At the end of my PhD journey, the research contributions and companion tools that I developed became more than [code](./software), experiments, and [papers](./publications).
They took on a life of their own thanks to the great work of the software artists who used their talents to turn it all into a comic.
In the story, I'm a character in a grand tale using DepClean, DepTrim, and JDBL to enter a never-ending battle against code bloat in Java applications.

I plan to continue the exploration of the many ways of using software art for creation,and as a form of expression.
The next step is to learn about the right tools for the job.
It shouldn't be too hard.
After all, I've just proven that given the right amount of time and effort: ~~even myself~~ anyone can become a superhero!

# Footnotes

[^1]: I kept a consist design for the logos of all of my software tool during my PhD. It's great to see that this approach proved to be useful later.

[^2]: You can read [the paper here](https://dl.acm.org/doi/10.1145/3546948) if you're interested.

[^3]: The details about DepTrim are in [this paper](https://arxiv.org/abs/2302.08370).

[^4]: This idea is not new, here's a dedicated [research paper](https://www.mdpi.com/2304-6775/6/3/38) about it.
