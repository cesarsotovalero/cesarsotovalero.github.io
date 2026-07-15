---
layout: landing
title: Book a Session
description: Book a one-to-one mentorship session, mock interview, or career advice session with César Soto Valero.
keywords: booking, mentorship, mock interview, career advice, coaching
permalink: /book
published: false
css:
  - "/css/booking.css"
---

<!-- markdownlint-disable MD033 -->

{% assign booking = site.data.booking %}

<section class="booking-page">
  <header class="booking-hero">
    <div class="booking-hero-text">
      <p class="booking-eyebrow">{{ booking.hero.eyebrow }}</p>
      <h1>{{ booking.hero.title }}</h1>
      <p class="booking-subtitle">{{ booking.hero.subtitle }}</p>
      <p class="booking-note">{{ booking.hero.note }}</p>
    </div>
    <div class="booking-hero-media">
      <img src="{{ booking.hero.image }}" alt="César Soto Valero profile picture" loading="lazy"/>
    </div>
  </header>

  <section class="booking-section" aria-labelledby="booking-offers-title">
    <div class="booking-section-header">
      <h2 id="booking-offers-title">Choose your session</h2>
      <p>All sessions are one-to-one and include a direct, actionable follow-up.</p>
    </div>

    <div class="booking-grid">
      {% for offer in booking.offers %}
      <article class="booking-card" id="offer-{{ offer.key }}">
        <h3>{{ offer.title }}</h3>
        <p class="booking-card-meta">{{ offer.duration }} · {{ offer.price }}</p>
        <p>{{ offer.description }}</p>
        <ul>
          {% for bullet in offer.bullets %}
          <li>{{ bullet }}</li>
          {% endfor %}
        </ul>

        <a
          class="booking-cta"
          href="{{ offer.booking_url | append: '?utm_source=website&utm_medium=booking-page&utm_campaign=coaching-launch&utm_content=' | append: offer.key }}"
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

  <section class="booking-section" aria-labelledby="booking-testimonials-title">
    <div class="booking-section-header">
      <h2 id="booking-testimonials-title">Testimonials</h2>
      <p>Replace these placeholders with your final testimonials before publishing.</p>
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

  <section class="booking-final-cta">
    <h2>{{ booking.footer_cta.title }}</h2>
    <p>{{ booking.footer_cta.text }}</p>
    <a
      class="booking-cta"
      href="{{ booking.footer_cta.button_url | append: '?utm_source=website&utm_medium=booking-page&utm_campaign=coaching-launch&utm_content=final-cta' }}"
      target="_blank"
      rel="noopener"
      data-offer="final-cta"
    >
      {{ booking.footer_cta.button_label }}
    </a>
  </section>
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
