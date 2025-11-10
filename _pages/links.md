---
layout: minimal
title: Links
permalink: /links.html
subtitle: "César Soto Valero"
description: "Links to social media and other details"
---

<link rel="stylesheet" href="/css/links-page.css">

<div class="links-container">
  <!-- Share Icon (Top Left) -->
  <div class="share-icon">
    <a href="javascript:void(0)" onclick="shareCurrentPage()" title="Share this page">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8"></path>
        <polyline points="16 6 12 2 8 6"></polyline>
        <line x1="12" y1="2" x2="12" y2="15"></line>
      </svg>
    </a>
  </div>

  <!-- Profile Section -->
  <div class="profile-section">
    <div class="profile-photo">
      <img src="{{ site.avatar }}" alt="César Soto Valero">
    </div>
    <h1 class="profile-name">César Soto Valero</h1>
    <p class="profile-description">Links to my social media and other details</p>
  </div>

  <!-- Cards Section -->
  <div class="cards-section">
    <!-- LinkedIn Card -->
    <a href="https://se.linkedin.com/in/cesarsotovalero" class="link-card" target="_blank" rel="noopener noreferrer">
      <div class="card-icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="currentColor">
          <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
        </svg>
      </div>
      <div class="card-text">LinkedIn Profile</div>
    </a>

    <!-- YouTube Card -->
    <a href="https://www.youtube.com/channel/UCR4rI98w6-MqYoCS6jR9LGg" class="link-card" target="_blank" rel="noopener noreferrer">
      <div class="card-icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="currentColor">
          <path d="M19.615 3.184c-3.604-.246-11.631-.245-15.23 0-3.897.266-4.356 2.62-4.385 8.816.029 6.185.484 8.549 4.385 8.816 3.6.245 11.626.246 15.23 0 3.897-.266 4.356-2.62 4.385-8.816-.029-6.185-.484-8.549-4.385-8.816zm-10.615 12.816v-8l8 3.993-8 4.007z"/>
        </svg>
      </div>
      <div class="card-text">YouTube Channel</div>
    </a>

    <!-- Blog Card -->
    <a href="https://www.cesarsotovalero.net/blog.html" class="link-card" target="_blank" rel="noopener noreferrer">
      <div class="card-icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="currentColor">
          <path d="M19 2H5c-1.103 0-2 .897-2 2v16c0 1.103.897 2 2 2h14c1.103 0 2-.897 2-2V4c0-1.103-.897-2-2-2zM5 20V4h14l.001 16H5z"/>
          <path d="M7 6h10v2H7zm0 4h10v2H7zm0 4h7v2H7z"/>
        </svg>
      </div>
      <div class="card-text">My Blog</div>
    </a>
  </div>
</div>

<script>
function shareCurrentPage() {
  if (navigator.share) {
    navigator.share({
      title: 'César Soto Valero - Links',
      text: 'Check out these links from César Soto Valero',
      url: window.location.href
    }).catch(err => console.log('Error sharing:', err));
  } else {
    // Fallback: copy URL to clipboard
    navigator.clipboard.writeText(window.location.href).then(() => {
      alert('Link copied to clipboard!');
    }).catch(err => {
      console.error('Failed to copy:', err);
    });
  }
}
</script>
