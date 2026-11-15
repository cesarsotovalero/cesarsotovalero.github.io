---
layout: minimal
title: Book a session with César Soto Valero
description: "Book a one-to-one session with César Soto Valero: career mentorship, an AI engineer mock interview, or an AI advisory session. From €79."
keywords: book a session, mentorship, AI engineer mock interview, AI advisory, career advice, César Soto Valero
permalink: /book
published: true
css:
  - "/css/custom-fonts.css"
  - "/css/booking.css"
---

<!-- markdownlint-disable MD033 -->

{% assign booking = site.data.booking %}
{% assign utm = 'utm_source=website&utm_medium=booking-page&utm_campaign=coaching-launch&utm_content=' %}

<section class="booking-page">
  <nav class="booking-nav" aria-label="Site">
    <a href="{{ site.baseurl }}/">&larr; cesarsotovalero.net</a>
    <a href="{{ site.baseurl }}/about-me">About me</a>
  </nav>

  <header class="booking-hero">
    <div class="booking-hero-text">
      <p class="booking-eyebrow">{{ booking.hero.eyebrow }}</p>
      <h1>{{ booking.hero.title }}</h1>
      <p class="booking-subtitle">{{ booking.hero.subtitle }}</p>
      <div class="booking-hero-actions">
        <a class="booking-button" href="#sessions">{{ booking.hero.cta_label }}</a>
        <span class="booking-price-hint">{{ booking.hero.price_hint }}</span>
      </div>
    </div>

    <aside class="booking-host" aria-label="About your host">
      <img
        src="{{ booking.hero.image }}"
        alt="Portrait of {{ booking.hero.name }}"
        width="96"
        height="96"
      />
      <div>
        <p class="booking-host-name">{{ booking.hero.name }}</p>
        <ul class="booking-host-credentials">
          {% for item in booking.hero.credentials %}
          <li>{{ item }}</li>
          {% endfor %}
        </ul>
      </div>
    </aside>
  </header>

  <section class="booking-section" id="sessions" aria-labelledby="booking-offers-title">
    <h2 id="booking-offers-title">Choose a session</h2>

    <div class="booking-grid">
      {% for offer in booking.offers %}
      {% assign offer_query_separator = '?' %}
      {% if offer.booking_url contains '?' %}
      {% assign offer_query_separator = '&' %}
      {% endif %}
      <article class="booking-card" id="offer-{{ offer.key }}">
        <h3>{{ offer.title }}</h3>
        <p class="booking-card-audience">{{ offer.audience }}</p>

        <p class="booking-card-price">
          <span class="booking-card-amount">{{ offer.price_label }}</span>
          <span class="booking-card-duration">{{ offer.duration }}</span>
        </p>

        <p class="booking-card-description">{{ offer.description }}</p>

        <ul class="booking-card-benefits">
          {% for bullet in offer.bullets %}
          <li>{{ bullet }}</li>
          {% endfor %}
        </ul>

        <a
          class="booking-button booking-cta"
          href="{{ offer.booking_url | append: offer_query_separator | append: utm | append: offer.key }}"
          target="_blank"
          rel="noopener noreferrer"
          data-offer="{{ offer.key }}"
        >
          {{ offer.cta_label }}
        </a>
      </article>
      {% endfor %}
    </div>
  </section>

  <section class="booking-section" aria-labelledby="booking-topics-title">
    <h2 id="booking-topics-title">What you can ask me about</h2>

    <ul class="booking-topics">
      {% for topic in booking.topics %}
      <li>
        <span class="booking-topic-title">{{ topic.title }}</span>
        <span class="booking-topic-text">{{ topic.text }}</span>
      </li>
      {% endfor %}
    </ul>
  </section>

  <section class="booking-section" aria-labelledby="booking-steps-title">
    <h2 id="booking-steps-title">How it works</h2>

    <ol class="booking-steps">
      {% for step in booking.steps %}
      <li>
        <span class="booking-step-title">{{ step.title }}</span>
        <span class="booking-step-text">{{ step.text }}</span>
      </li>
      {% endfor %}
    </ol>

    <p class="booking-note">{{ booking.reschedule_note }}</p>
  </section>

  <footer class="booking-footer">
    <p>
      Not sure which session fits?
      <a href="{{ site.baseurl }}/about-me#contact-me">Send me a message</a> first.
    </p>
    <p class="booking-disclaimer">{{ booking.disclaimer }}</p>
  </footer>
</section>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "One-to-one sessions with {{ booking.hero.name }}",
  "url": "{{ site.url }}/book",
  "itemListElement": [{% for offer in booking.offers %}
    {
      "@type": "ListItem",
      "position": {{ forloop.index }},
      "item": {
        "@type": "Service",
        "name": {{ offer.title | jsonify }},
        "description": {{ offer.description | jsonify }},
        "provider": { "@id": "{{ site.url }}/#person" },
        "offers": {
          "@type": "Offer",
          "price": "{{ offer.price }}",
          "priceCurrency": {{ offer.currency | jsonify }},
          "url": {{ offer.booking_url | jsonify }}
        }
      }
    }{% unless forloop.last %},{% endunless %}{% endfor %}
  ]
}
</script>

<script>
  (function () {
    var ctas = document.querySelectorAll('.booking-cta[data-offer]');

    ctas.forEach(function (cta) {
      cta.addEventListener('click', function () {
        if (typeof gtag === 'function') {
          gtag('event', 'booking_cta_click', {
            event_category: 'booking',
            event_label: cta.getAttribute('data-offer')
          });
        }
      });
    });
  })();
</script>

<!-- markdownlint-enable MD033 -->
