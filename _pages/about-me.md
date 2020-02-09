---
permalink: about-me.html
layout: page
title: About me
subtitle: In a Few Words
---
<div style="border-bottom: 1px solid #eee;">
  <h3 style="text-align: center; font-family:courier, courier new, serif; padding-bottom: 35px;"><span class="type"></span></h3>
</div>

<!-- ![Custom badge](https://img.shields.io/badge/-WORK-blueviolet.svg) -->
### :briefcase: Current work
I'm a <a href="http://wasp-sweden.org/">WASP</a> Ph.D. student  in the <a href="https://www.kth.se/scs/software-engineering">Department of Software and Computer Systems </a> working with <a href="https://www.kth.se/profile/baudry">Benoit Baudry</a> at <a href="https://kth.se">KTH Royal Institute of Technology</a> in Sweden <img class="emoji" title=":sweden:" alt=":sweden:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f1f8-1f1ea.png" height="20" width="20">. My current research is focused on [software diversity](https://en.wikipedia.org/wiki/Software_diversity), [automatic program debloating](https://cesarsotovalero.github.io/2018-09-24-program-debloating) and [software specialization](https://en.wikipedia.org/wiki/Run-time_algorithm_specialisation). For more on these topic, see the living review of <a href="https://www.cesarsotovalero.net/software-debloating-papers">software
 debloating papers</a>, or consult the list of <a href="https://www.cesarsotovalero.net/software-debloating-tools">software debloating tools</a>. I also do knowledge-seeking software engineering research, e.g., by extracting useful information from data stored in software repositories. For more on this topic, see this list of <a href="https://www.cesarsotovalero.net/mining-software-repositories-resources">mining software repositories resources</a>. In particular, I'm interested in measuring the impact and pervasiveness of bloatware across large-scale software ecosystems. I'm keen to perform research on software technology that: 1) provide actionable insights to researchers and practitioners about how modern software is currently being developed and maintained, and 2) provide practical tools for developers in order to improve the software quality.

<!-- ![Custom badge](https://img.shields.io/badge/-EDUCATION-orange.svg) -->
### :mortar_board: Education
I've a [BSc](../../files/certificates/BSc_Degree_(certified)_eng.pdf) and [MSc](../../files/certificates/MSc_Degree_(certified)_eng.pdf) in Computer Science from the [Universidad Central "Marta Abreu" de Las Villas](https://www.uclv.edu.cu/), Cuba :cuba:. Currently, I'm a [PhD Student](https://www.kth.se/profile/cesarsv) in Software Engineering at [KTH Royal Institute of Technology](https://www.kth.se), Sweden :sweden:. I'm generously funded by the [Wallenberg Autonomous Systems and Software Program](https://wasp-sweden.org) (WASP), funded by Knut and Alice Wallenberg Foundation. I've the privilege of having the best supervisor ever, his name is [Benoit Baudry](https://www.kth.se/profile/baudry). 

<!-- ![Custom badge](https://img.shields.io/badge/-HOBBIES-blue.svg) -->
### :dart: Hobbies
Out of work, I enjoy spending time with my family, reading books, and running through the beautiful parks in Stockholm.

---

## :earth_africa: Location
<div id="map"></div>
<script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: 59.346936, lng: 18.072549};  
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 6, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqZod6EtoGSBLuNa_L6do4ZKa0edph9z4=initMap"> </script>
    
---

## :email: Contact me

<!-- 
     After implementing this contact form make sure
     1. you have defined "email: youremail@email.com" in _config.yml file.
     2. you verify your form on formspree.io.
-->

<form class="wj-contact" action="https://formspree.io/mrgqpknn" method="POST">
    <input type="text" name="email" placeholder="Your Email Address">
    <textarea type="text" name="content" rows="5" placeholder="Message"></textarea>
    <input type="hidden" name="_next" value="<REDIRECTION LINK> ">
    <input type="hidden" name="_subject" value="New Contact Form Submission">
    <input type="text" name="_gotcha" style="display:none">
    <input type="submit" value="Submit">
</form>

<style>
form.wj-contact input[type="text"], form.wj-contact textarea[type="text"] {
    width: 100%;
    vertical-align: middle;
    margin-top: 0.25em;
    margin-bottom: 0.5em;
    padding: 0.75em;
    font-family: monospace, sans-serif;
    font-weight: lighter;
    border-style: solid;
    border-color: #444;
    outline-color: #2e83e6;
    border-width: 1px;
    border-radius: 3px;
    transition: box-shadow .2s ease;
}

form.wj-contact input[type="submit"] {
    outline: none;
    color: white;
    background-color: #2e83e6;
    border-radius: 3px;
    padding: 0.5em;
    margin: 0.25em 0 0 0;
    border: 1px solid transparent;
    height: auto;
}
</style>

