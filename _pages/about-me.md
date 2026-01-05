---
permalink: about-me
layout: page
title: About Me
subtitle: 👨🏼‍💻
description: César Soto Valero is a computer scientist, software engineer, and content creator.
---

{% include social.html type="page" %}

[//]: # "Profile to view: https://www.zeileis.org/"
[//]: # '<code style="text-align: center; font-family:jetbrains_monoregular, courier new, serif; font-size: 18px; font-weight: lighter">'
[//]: # ' <span class="type" style="text-align: center"></span>'

# TL;DR

César is a [computer scientist](./publications) and [software engineer](./software).

He's on a mission to help engineers learn, build, and grow faster. Check out his [personal blog](https://www.cesarsotovalero.net/blog), [YouTube channel](https://www.youtube.com/channel/UCR4rI98w6-MqYoCS6jR9LGg), or connect with him on [LinkedIn](https://www.linkedin.com/in/cesarsotovalero).

Here's his [one-page résumé](../files/CV/cesar-resume.pdf).

More importantly, these are [his professional values](./my-professional-values).

**Current Job:** Data Scientist, working in [SEB](https://seb.se) since April 2023 <img class="emoji" title=":sweden:" alt=":sweden:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f1f8-1f1ea.png" height="20" width="20">.

# Research

César has [authored 30+ research papers](./publications) and [been involved in academic services](./service).

His research efforts have been [recognized with awards](./awards).

# Software

César has created [open-source projects](./software), some with 300+ <i class="fas fa-star"></i> on GitHub.

# Education

{% youtube Ub684G_aM5Q %}

César earned a PhD in Computer Science in 2023 from [KTH Royal Institute of Technology](https://kth.se).[^4]

His PhD work was supervised by Profs. [Benoit Baudry](https://www.kth.se/profile/baudry) and [Martin Monperrus](https://www.monperrus.net/martin).

César's PhD was about software debloating,[^1] you can look at [his PhD thesis](https://www.cesarsotovalero.net/files/thesis/cesar-fulltext.pdf) to know more.

He also holds a [BSc](<../../files/certificates/BSc_Degree_(certified)_eng.pdf>) and [MSc](<../../files/certificates/MSc_Degree_(certified)_eng.pdf>) in Computer Science.

César is a lifelong learner, he's often [taking courses and MOOCs](./courses).

A long time ago, César [participated in ACM-ICPC programming contests](./competitions).

# Misc

Outside of work, César enjoys spending quality time with his family, reading books, and [running](./races) (his current best 10K time is 48:00).

He also likes epic music. Some of his favorites are [Two Steps From Hell](https://www.youtube.com/watch?v=9O4_awEHh1g), [Hans Zimmer](https://www.youtube.com/watch?v=hHwqfT4mhfI), and [Zack Hemsey](https://www.youtube.com/user/zackhemsey).

His very <span style="background-color:#042742;color:white;border-radius:4px;">&nbsp;dark blue&nbsp;</span> is `#042742`.

# Contact Him

<!--
     After implementing this contact form make sure
     1. you have defined "email: youremail@email.com" in _config.yml file.
     2. you verify your form on formspree.io.
-->

You can email César using the form below:

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

<br>

👉 Have insights or research ideas? Please reach out, César is always [open to collaborations](./collaborations).

<p class="post-meta" style="margin-top: 60px;">
   <i class="fas fa-user-edit"></i>
   This page was last modified on {{ page.last_modified_at | date: "%B %-d, %Y" }}
</p>

# Footnotes

[^1]: For more on these topics, see [his living review of software debloating papers](./software-debloating-papers), or consult [his list of software debloating tools](./software-debloating-tools).
[^4]: César's PhD was generously funded by the [Wallenberg Autonomous Systems and Software Program (WASP)](https://wasp-sweden.org), funded by Knut and Alice Wallenberg Foundation.
