---
layout: minimal
title: Book a Session
description: Book a one-to-one mentorship session, mock interview, or career advice session with César Soto Valero.
keywords: booking, mentorship, mock interview, career advice, coaching
permalink: /book
published: true
css:
  - "/css/booking.css"
---

<!-- markdownlint-disable MD033 -->

{% assign booking = site.data.booking %}

<section class="booking-page">
  <header class="booking-hero">
    <div class="booking-hero-media">
      <img
        src="{{ booking.hero.image }}"
        alt="César Soto Valero profile picture"
        width="176"
        height="176"
        loading="lazy"
      />
    </div>

    <div class="booking-hero-content">
      <p class="booking-eyebrow">{{ booking.hero.eyebrow }}</p>
      <h1>{{ booking.hero.title }}</h1>
      <p class="booking-subtitle">{{ booking.hero.subtitle }}</p>

      <ul class="booking-hero-highlights">
        <li>Private one-to-one guidance tailored to your exact goals</li>
        <li>Concrete, no-fluff recommendations you can apply immediately</li>
        <li>Written follow-up so you leave with a clear execution plan</li>
      </ul>

      <div class="booking-socials" aria-label="Social links">
        <a
          class="booking-social-link"
          href="https://linkedin.com/in/{{ site.author.linkedin }}"
          target="_blank"
          rel="noopener noreferrer"
          title="LinkedIn"
        >
          <img src="{{ site.baseurl }}/img/icons/linkedin.svg" alt="LinkedIn" width="18" height="18" />
          <span>LinkedIn</span>
        </a>
        <a
          class="booking-social-link"
          href="https://www.youtube.com/{{ site.author.youtube }}"
          target="_blank"
          rel="noopener noreferrer"
          title="YouTube"
        >
          <img src="{{ site.baseurl }}/img/icons/youtube.svg" alt="YouTube" width="18" height="18" />
          <span>YouTube</span>
        </a>
        <a
          class="booking-social-link"
          href="https://github.com/{{ site.author.github }}"
          target="_blank"
          rel="noopener noreferrer"
          title="GitHub"
        >
          <img src="{{ site.baseurl }}/img/icons/github.svg" alt="GitHub" width="18" height="18" />
          <span>GitHub</span>
        </a>
      </div>
    </div>
  </header>

  <section class="booking-proof-strip" aria-label="Session guarantees">
    <article>
      <h2>1:1 Sessions</h2>
      <p>No group calls, no generic advice, no recycled feedback.</p>
    </article>
    <article>
      <h2>45-60 Minutes</h2>
      <p>Focused time to get unstuck and move forward with confidence.</p>
    </article>
    <article>
      <h2>Actionable Follow-Up</h2>
      <p>Leave with concrete next steps, priorities, and accountability.</p>
    </article>
  </section>

  <section class="booking-section" aria-labelledby="booking-offers-title">
    <div class="booking-section-header">
      <h2 id="booking-offers-title">Choose your session</h2>
      <p>Each session is designed to solve a different kind of career challenge.</p>
    </div>

    <div class="booking-grid">
      {% for offer in booking.offers %}
      {% assign offer_query_separator = '?' %}
      {% if offer.booking_url contains '?' %}
      {% assign offer_query_separator = '&' %}
      {% endif %}
      <article class="booking-card" id="offer-{{ offer.key }}">
        <header class="booking-card-header">
          <h3>{{ offer.title }}</h3>
          {% if offer.key == 'mock-interview' %}
          <span class="booking-card-badge">Most requested</span>
          {% endif %}
        </header>

        <p class="booking-card-meta">
          <span>{{ offer.duration }}</span>
          <span aria-hidden="true">&bull;</span>
          <span>{{ offer.price }}</span>
        </p>

        <p>{{ offer.description }}</p>

        <ul class="booking-card-benefits">
          {% for bullet in offer.bullets %}
          <li>{{ bullet }}</li>
          {% endfor %}
        </ul>

        <a
          class="booking-cta"
          href="{{ offer.booking_url | append: offer_query_separator | append: 'utm_source=website&utm_medium=booking-page&utm_campaign=coaching-launch&utm_content=' | append: offer.key }}"
          target="_blank"
          rel="noopener noreferrer"
          data-offer="{{ offer.key }}"
        >
          {{ offer.cta_label }}
        </a>

        <p class="booking-card-small">{{ offer.payment_note }}</p>
      </article>
      {% endfor %}
    </div>
  </section>

  {% comment %}
  <section class="booking-section" aria-labelledby="booking-testimonials-title">
    <div class="booking-section-header">
      <h2 id="booking-testimonials-title">Testimonials</h2>
    </div>

    <div class="booking-testimonials">
      {% for item in booking.testimonials %}
      <blockquote class="booking-quote">
        <p>"{{ item.quote }}"</p>
        <footer>
          <span class="booking-quote-author">{{ item.author }}</span>
          <span class="booking-quote-role">{{ item.role }}</span>
        </footer>
      </blockquote>
      {% endfor %}
    </div>
  </section>
  {% endcomment %}

  {% comment %}
  <section class="booking-section" aria-labelledby="booking-faq-title">
    <div class="booking-section-header">
      <h2 id="booking-faq-title">Policy and FAQ</h2>
    </div>

    <div class="booking-faq">
      {% for item in booking.faq %}
      <article class="booking-faq-item">
        <h3>{{ item.question }}</h3>
        <p>{{ item.answer }}</p>
      </article>
      {% endfor %}
    </div>
  </section>
  {% endcomment %}

  {% comment %}
  <section class="booking-final-cta">
    <h2>{{ booking.footer_cta.title }}</h2>
    <p>{{ booking.footer_cta.text }}</p>
    {% assign footer_cta_query_separator = '?' %}
    {% if booking.footer_cta.button_url contains '?' %}
    {% assign footer_cta_query_separator = '&' %}
    {% endif %}
    <a
      class="booking-cta"
      href="{{ booking.footer_cta.button_url | append: footer_cta_query_separator | append: 'utm_source=website&utm_medium=booking-page&utm_campaign=coaching-launch&utm_content=final-cta' }}"
      target="_blank"
      rel="noopener noreferrer"
      data-offer="final-cta"
    >
      {{ booking.footer_cta.button_label }}
    </a>
  </section>
  {% endcomment %}
</section>

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
