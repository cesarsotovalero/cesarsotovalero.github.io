---
permalink: about-me.html
layout: page
title: About me
subtitle: 👨🏼‍💻
description: César Soto Valero is a computer scientist, software engineer, and content creator.
---

{% include social.html type="page" %}

[//]: # (Profile to view: https://www.zeileis.org/)

[//]: # (<code style="text-align: center; font-family:jetbrains_monoregular, courier new, serif; font-size: 18px; font-weight: lighter">)

[//]: # ( <span class="type" style="text-align: center"></span>)


<!-- ![Custom badge](https://img.shields.io/badge/-WORK-blueviolet.svg) -->
# TL;DR

I'm César, a [computer scientist](./publications.html), [software engineer](./software.html), and [creator of things](./blog).

I'm passionate about science, technology, and education. 

Here is my [résumé](../files/CV/cv.pdf).

[Here](https://chatgpt.com/share/6732edfc-2374-8007-98e4-091b4f0ccff9) is the one thing ChatGPT 4o thinks about myself that I don't know about myself (in September 2024).

For recruiters, [here](./my-professional-values.html) are my professional values.

**Update:** Since December 2024, I'm a Data Scientist at [SEB](https://seb.se/) in Stockholm <img class="emoji" title=":sweden:" alt=":sweden:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f1f8-1f1ea.png" height="20" width="20">.

# Career

I'd a PhD in Computer Science at [KTH Royal Institute of Technology](https://kth.se).
My PhD was supervised by [Benoit Baudry](https://www.kth.se/profile/baudry) and [Martin Monperrus](https://www.monperrus.net/martin/).
I graduated in 2023.[^4]

**Cool Fact:** {%include university_ranking.html%}

My PhD was about software debloating,[^1] here's my [thesis](https://www.cesarsotovalero.net/files/thesis/cesar-fulltext.pdf), and you can watch my [public defense](https://youtu.be/Ub684G_aM5Q?si=5Ow61XFEGmtP9ZZw).

{% youtube Ub684G_aM5Q %}

I enjoy doing knowledge-seeking software engineering research.
For example, to extract useful information from software repositories.[^2] 
Particularly, I'm interested in measuring the impact and pervasiveness of software bloat across large-scale software ecosystems.

I'm keen to perform research on software technology which:

1. Provide **actionable insights** to researchers and practitioners about how modern software is currently being developed and maintained.
2. Produce **practical tools** for developers to improve software quality.
3. Disrupt the _status quo_ of software engineering **latest practices**.

I'm open to collaborate with researchers and give advice to students in these areas.
If you are interested in working with me, please have a look at my list of [research topics](./collaborations.html) and email me using the form below.

{% badge https://stackoverflow.com/users/flair/10480869.png with=200 https://stackoverflow.com/users/10480869/cesarsotovalero %}

I also hold a [BSc](../../files/certificates/BSc_Degree_(certified)_eng.pdf) and [MSc](../../files/certificates/MSc_Degree_(certified)_eng.pdf) in Computer Science.

A long time ago, I participated in [programming competitions](/competitions.html). 

# Misc

Out of work, I enjoy spending time with my family, reading ~~physical~~ books, and running across Stockholm's beautiful parks.[^3]

I also like epic music, e.g., [Two Steps From Hell](https://www.youtube.com/watch?v=9O4_awEHh1g), [Hans Zimmer](https://www.youtube.com/watch?v=hHwqfT4mhfI), [Zack Hemsey](https://www.youtube.com/user/zackhemsey) or [Enya](https://www.youtube.com/watch?v=7jfRG-fgvQ8) and embrace [autodidacticism](https://en.wikipedia.org/wiki/Autodidacticism).

My very <span style="background-color:#042742;color:white;border-radius:4px;">&nbsp;dark blue&nbsp;</span> is `#042742`.

#  Contact

<!-- 
     After implementing this contact form make sure
     1. you have defined "email: youremail@email.com" in _config.yml file.
     2. you verify your form on formspree.io.
-->

You can email me using the form below:

<form id="contact-me" class="wj-contact" action="https://formspree.io/mrgqpknn" method="POST">
    <input type="text" name="email" placeholder="Your email goes here">
    <textarea type="text" name="content" rows="5" placeholder="Your message goes here"></textarea>
    <input type="hidden" name="_next" value="<REDIRECTION LINK> ">
    <input type="hidden" name="_subject" value="New Contact Form Submission">
    <input type="text" name="_gotcha" style="display:none">
    <input type="submit" value="✉️ Send Message">
</form>

<style>
form.wj-contact input[type="text"], form.wj-contact textarea[type="text"] {
    width: 100%;
    vertical-align: middle;
    font-size: 18px;
    margin-top: 0.25em;
    margin-bottom: 0.5em;
    padding: 0.75em;
    font-weight: lighter;
    border-style: solid;
    border-color: #444;
    outline-color: #444;
    border-width: 1px;
    border-radius: 3px;
    transition: box-shadow .2s ease;
    font-family:  "Equity Text A", sans-serif;
    cursor: pointer;
    background-color: var(--blockquote-background-color);
}

form.wj-contact input[type="submit"] {
    outline: none;
    color: var(--main-text-color);
    border-radius: 3px;
    padding: 12px;
    margin: 0.25em 0 0 0;
    height: auto;
    font-family:  "Concourse T6", sans-serif;
    text-transform: uppercase;
    font-size: 15px;
    font-weight: 800;
    letter-spacing: 1px;
    border: 1px solid #444;
    background-color: var(--blockquote-background-color);
    transition: transform 0.1s ease, box-shadow 0.1s ease;
}

form.wj-contact input[type="submit"]:hover {
  background-color: var(--blockquote-background-color);
  color: var(--main-text-color);
  cursor: pointer;
}

form.wj-contact input[type="submit"]:active {
  transform: scale(0.95);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}
</style>

<!-- Typing -->
<script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
<script>
   var typed = new Typed('.type', {
      strings: [
              "I code in Java",
              "I code in R",
              "I code in Javascript",
              "I code in Python",
              "I design software",
              "I read research papers",
              "I contribute to open-source",
              "I write about what I learn",
              "I teach what I know",
              "I do research",
              "I overcome my failures",
              "I never stop learning",
              "I don't give up",              
              "I value family and friends",
              "I like listening podcasts",
              "I like homemade food",
              "I like photography",
      ],
      // Optionally use an HTML element to grab strings from (must wrap each string in a <p>)
      stringsElement: null,
      // typing speed
      typeSpeed: 100,
      // time before typing starts
      startDelay: 1200,
      // backspacing speed
      backSpeed: 20,
      // time before backspacing
      backDelay: 500,
      // loop
      loop: true,
      // false = infinite
      loopCount: 10,
      // show cursor
      showCursor: true,
      // character for cursor
      cursorChar: "|",
      // attribute to type (null == text)
      attr: null,
      // either html or text
      contentType: 'html',
      // call when done callback function
      callback: function () {
      },
      // starting callback function before each string
      preStringTyped: function () {
      },
      //callback for every typed string
      onStringTyped: function () {
      },
      // callback for reset
      resetCallback: function () {
      }
   });
</script>


<p class="post-meta" style="margin-top: 60px;">
   <i class="fas fa-user-edit"></i>
   Website last modified on {{ page.last_modified_at | date: "%B %-d, %Y" }}
</p>

# Footnotes

[^1]: For more on these topics, see my living review of [software debloating papers](./software-debloating-papers.html), or consult my list of [software debloating tools](./software-debloating-tools.html).

[^2]: See my list of [mining software repositories resources](./mining-software-repositories-resources.html).

[^3]: I collect the results of my races in Stockholm [here](/races.html).

[^4]: My research work was generously funded by the [Wallenberg Autonomous Systems and Software Program (WASP)](https://wasp-sweden.org), funded by Knut and Alice Wallenberg Foundation.
