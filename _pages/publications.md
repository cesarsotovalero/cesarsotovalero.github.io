---
permalink: publications
layout: page
title: Publications
subtitle: "Peer-reviewed papers, theses, and preprints"
description: List of academic papers published by César Soto Valero.
published: true
css:
  - "/css/blog-index.css"
  - "/css/publications.css"
---

<!-- markdownlint-disable MD033 -->
{% comment %} The papers live in _data/publications.yml: adding a paper is one entry there. {% endcomment %}
{% assign pubs = site.data.publications %}
{% assign journals = pubs | where: "type", "journal" %}
{% assign conferences = pubs | where: "type", "conference" %}
{% assign theses = pubs | where: "type", "thesis" %}
{% assign awarded = pubs | where_exp: "p", "p.award" %}

<p class="pub-intro">I'm the author of academic papers published in reputable journals and conferences. The following is an updated list of my published work (in reverse chronological order).</p>

<ul class="pub-profiles" aria-label="Publication profiles">
   <li><a href="https://scholar.google.es/citations?user=jNBoowwAAAAJ&amp;hl=en"><img src="/img/pages/publications/google.png" alt="" width="18" height="18">Google Scholar</a></li>
   <li><a href="https://orcid.org/0000-0003-0541-6411"><img src="/img/icons/orcid-color.svg" alt="" width="18" height="18">ORCID 0000-0003-0541-6411</a></li>
   <li><a href="https://dblp.uni-trier.de/pers/hd/s/Soto=Valero:C=eacute=sar"><img src="/img/pages/publications/dblp.jpg" alt="" width="18" height="18">dblp</a></li>
   <li><a href="https://www.researchgate.net/profile/Cesar_Soto-Valero"><img src="/img/pages/publications/researchgate.png" alt="" width="18" height="18">ResearchGate</a></li>
</ul>

<nav class="blog-filters pub-filters" aria-label="Filter papers by type">
   <ul>
      <li><button type="button" class="blog-filter" data-filter="" aria-pressed="true">All <span class="blog-filter-count">{{ pubs.size }}</span></button></li>
      <li><button type="button" class="blog-filter" data-filter="journal" aria-pressed="false">Journal <span class="blog-filter-count">{{ journals.size }}</span></button></li>
      <li><button type="button" class="blog-filter" data-filter="conference" aria-pressed="false">Conference <span class="blog-filter-count">{{ conferences.size }}</span></button></li>
      <li><button type="button" class="blog-filter" data-filter="thesis" aria-pressed="false">Thesis <span class="blog-filter-count">{{ theses.size }}</span></button></li>
      <li><button type="button" class="blog-filter" data-filter="award" aria-pressed="false">Awarded <span class="blog-filter-count">{{ awarded.size }}</span></button></li>
   </ul>
   <p class="blog-filter-status" role="status" aria-live="polite"></p>
</nav>

{% assign by_year = pubs | group_by: "year" %}
{% for group in by_year %}
<section class="pub-year" data-year="{{ group.name }}">
   <h2 class="blog-year-title" id="y{{ group.name }}">{{ group.name }}</h2>
   <ol class="pub-list">
      {% for pub in group.items %}
      {% case pub.type %}{% when "journal" %}{% assign type_label = "Journal" %}{% when "conference" %}{% assign type_label = "Conference" %}{% when "thesis" %}{% assign type_label = "Thesis" %}{% else %}{% assign type_label = "Report" %}{% endcase %}
      <li class="pub" data-type="{{ pub.type }}"{% if pub.award %} data-award="true"{% endif %}>
         <p class="pub-title"><span class="pub-type pub-type--{{ pub.type }}">{{ type_label }}</span> {{ pub.title }}</p>
         <p class="pub-authors">{{ pub.authors | replace: "César Soto-Valero", "<strong>César Soto-Valero</strong>" }}</p>
         <p class="pub-venue"><em>{{ pub.venue }}</em>{% if pub.note %}. {{ pub.note }}{% endif %}</p>
         {% if pub.award %}<p class="pub-award"><i class="fas fa-award" aria-hidden="true"></i> {{ pub.award }}</p>{% endif %}
         {% if pub.links.size > 0 %}
         <ul class="pub-links" aria-label="Links for {{ pub.title | escape }}">
            {% for link in pub.links %}<li><a href="{{ link.url }}">{{ link.label }}</a></li>{% endfor %}
         </ul>
         {% endif %}
      </li>
      {% endfor %}
   </ol>
</section>
{% endfor %}

<script>
   (function () {
      var buttons = document.querySelectorAll('.pub-filters .blog-filter');
      var status = document.querySelector('.pub-filters .blog-filter-status');
      function apply(filter) {
         var shown = 0;
         document.querySelectorAll('.pub').forEach(function (pub) {
            var match = !filter || (filter === 'award' ? pub.hasAttribute('data-award') : pub.getAttribute('data-type') === filter);
            pub.hidden = !match;
            if (match) shown++;
         });
         document.querySelectorAll('.pub-year').forEach(function (year) {
            year.hidden = !year.querySelector('.pub:not([hidden])');
         });
         buttons.forEach(function (button) {
            button.setAttribute('aria-pressed', button.getAttribute('data-filter') === filter ? 'true' : 'false');
         });
         status.textContent = filter ? shown + (shown === 1 ? ' paper' : ' papers') : '';
      }
      buttons.forEach(function (button) {
         button.addEventListener('click', function () { apply(button.getAttribute('data-filter')); });
      });
   })();
</script>
