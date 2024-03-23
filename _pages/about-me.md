---
permalink: about-me.html
layout: page
title: About me
subtitle: 👨🏼‍💻
---

[//]: # (Profile to view: https://www.zeileis.org/)

[//]: # (<code style="text-align: center; font-family:jetbrains_monoregular, courier new, serif; font-size: 18px; font-weight: lighter">)

[//]: # ( <span class="type" style="text-align: center"></span>)


<!-- ![Custom badge](https://img.shields.io/badge/-WORK-blueviolet.svg) -->
# TL;DR

[//]: # (:briefcase: )
I'm César Soto Valero, a [researcher](./software) and [engineer](./software.html).

I'm passionate about science, software technology, and teaching. 

Here is my minimalistic [resumé](../files/CV/cv.pdf).

**Update:** Since April 2023, I'm a Data Engineer at [SEB](https://seb.se/) in Stockholm <img class="emoji" title=":sweden:" alt=":sweden:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f1f8-1f1ea.png" height="20" width="20">.

# Career

I'd a PhD in Computer Science in the Department of [Software and Computer Systems](https://www.kth.se/scs/software-engineering) at [KTH Royal Institute of Technology](https://kth.se), supervised by [Benoit Baudry](https://www.kth.se/profile/baudry) and [Martin Monperrus](https://www.monperrus.net/martin/) (I graduated in 2023).[^4]

My PhD was about software debloating,[^1] check out my [thesis](https://www.cesarsotovalero.net/files/thesis/cesar-fulltext.pdf) and [public defense](https://youtu.be/Ub684G_aM5Q?si=5Ow61XFEGmtP9ZZw).

Besides my PhD topic, I do knowledge-seeking software engineering research.
For example, by extracting useful information from data stored in software repositories.[^2] 
I'm particularly interested in measuring the impact and pervasiveness of software bloat across large-scale software ecosystems.

I'm keen to perform research on software technology which:

1. Provide **actionable insights** to researchers and practitioners about how modern software is currently being developed and maintained.
2. Produce **practical tools** for developers to improve software quality.
3. Disrupt the **status quo** of software engineering methodologies or practices.

I'm always open to work with researchers and supervise students in these areas.
If you are interested in collaborating with me, have a look at my list of [research topics](./collaborations.html).

{% badge https://stackoverflow.com/users/flair/10480869.png with=200 https://stackoverflow.com/users/10480869/cesarsotovalero %}

I also hold a [BSc](../../files/certificates/BSc_Degree_(certified)_eng.pdf) and [MSc](../../files/certificates/MSc_Degree_(certified)_eng.pdf) in Computer Science.

A long time ago, I participated in [programming competitions](/competitions.html). 

# Misc

Out of work, I enjoy spending time with my family, reading ~~physical~~ books, and jogging across the Stockholm's beautiful parks.[^3]

My very <span style="background-color:#042742;color:white;border-radius:4px;">&nbsp;dark blue&nbsp;</span> is `#042742`.

#  Contact

<!-- 
     After implementing this contact form make sure
     1. you have defined "email: youremail@email.com" in _config.yml file.
     2. you verify your form on formspree.io.
-->

You can email me using the form below:

<form id="contact-me" class="wj-contact" action="https://formspree.io/mrgqpknn" method="POST">
    <input type="text" name="email" placeholder="Type your email">
    <textarea type="text" name="content" rows="5" placeholder="Type your message"></textarea>
    <input type="hidden" name="_next" value="<REDIRECTION LINK> ">
    <input type="hidden" name="_subject" value="New Contact Form Submission">
    <input type="text" name="_gotcha" style="display:none">
    <input type="submit" value="✉️ Send Message">
</form>

<style>
form.wj-contact input[type="text"], form.wj-contact textarea[type="text"] {
    width: 100%;
    vertical-align: middle;
    font-size: 20px;
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
}

form.wj-contact input[type="submit"] {
    outline: none;
    color: #444;
    background-color: white;
    border-radius: 3px;
    padding: 12px;
    margin: 0.25em 0 0 0;
    height: auto;
    font-family:  "Concourse T6", sans-serif;
    text-transform: uppercase;
    font-size: 16px;
    font-weight: 800;
    letter-spacing: 1px;
    border: 1px solid #444;
}

form.wj-contact input[type="submit"]:hover {
  background-color: #444;
  color: white;
  cursor: pointer;
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

[^3]: Check out my result at [Midnattsloppet 2022](../files/certificates/Midnattsloppet_Diplom_2022.pdf), and [:earth_americas: Blodomloppet 2023](https://www.racetimer.se/sv/runner/show/8204163?layout=blodomloppet&race_id=5627).

[^4]: My research work was generously funded by the [Wallenberg Autonomous Systems and Software Program (WASP)](https://wasp-sweden.org), funded by Knut and Alice Wallenberg Foundation.

