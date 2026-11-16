---
permalink: privacy
layout: page
title: Privacy
subtitle: What this site collects, and which services are involved
description: How cesarsotovalero.net handles visitor data, and which third-party services the site uses.
---

This is a personal website. It doesn't sell or share personal data, and it sets no cookies of its own.
The only thing it stores in your browser is your light or dark theme choice (in local storage).

Some features rely on third-party services. Each one receives the usual technical data of a web request (such as your IP address and browser) when it loads, and may set its own cookies.
They are listed below.

# Hosting

The site is hosted on GitHub Pages, so GitHub receives the request for every page you load.
See the [GitHub General Privacy Statement](https://docs.github.com/site-policy/privacy-policies/github-general-privacy-statement).

# Analytics

{% assign analytics = site.analytics %}
{% if site.gtm and site.gtm != "" %}
The site measures visits with Google Analytics, loaded through Google Tag Manager ([how Google uses this data](https://policies.google.com/technologies/partner-sites)).
Google Analytics sets its own cookies (`_ga` and `_ga_*`) to tell visitors and visits apart.
{% elsif analytics.provider and analytics.provider != "" %}
The site measures visits with {% case analytics.provider %}{% when "ga4" %}Google Analytics{% when "plausible" %}Plausible Analytics{% when "goatcounter" %}GoatCounter{% else %}{{ analytics.provider }}{% endcase %}.
{% else %}
The site doesn't use any analytics service at the moment.
{% endif %}

# Contact form

Messages sent with the [contact form](/contact) are delivered to my inbox by Formspree ([privacy policy](https://formspree.io/legal/privacy-policy)).
I only use your name and email address to reply to you.

# Newsletter

The newsletter sign-up on the [blog](/blog) is handled by Mailchimp ([Intuit privacy statement](https://www.intuit.com/privacy/statement/)).
You can unsubscribe with the link in any newsletter email.

# Comments

Comments under blog posts use [giscus](https://giscus.app), which stores them as GitHub Discussions in this site's repository ([privacy policy](https://github.com/giscus/giscus/blob/main/PRIVACY-POLICY.md)).
The comment section loads when you scroll near it, and you sign in with GitHub to comment.

# Videos

Most videos are links to YouTube; their thumbnails load from YouTube's image servers.
Videos embedded in a post use the youtube-nocookie.com player, which doesn't set YouTube cookies until you play the video.

# Advertising and support

Blog posts show one ad from Carbon Ads and a Ko-fi button for support.
Both load from their own servers.

# Questions

If you have questions about your data, [get in touch](/contact).
