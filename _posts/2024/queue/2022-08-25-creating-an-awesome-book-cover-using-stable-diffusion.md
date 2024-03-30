---
layout: post
title: Creating an Awesome Book Cover Using Stable Diffusion
subtitle: The perfect cover for your thesis
tags: ai
description: TODO
keywords:
  - computer science research,
  - open research questions,
  - futuristic ideas,
  - future work
image: ../img/posts/2022/whitman_cover.jpg
share-img: ../img/posts/2022/whitman_cover.jpg
show-avatar: false
toc: true
date: 2022/08/25
author: cesarsotovalero
published: false
---

Stable Diffusion is “text-to-image diffusion model” that was released to the public by [Stability.ai](https://stability.ai/) three days ago, on August 22nd.
It is based on the idea of [stable diffusion](https://en.wikipedia.org/wiki/Stable_diffusion) and it is a great way to create a book cover for your thesis.

TheStable Diffusion model builds upon [this](https://arxiv.org/abs/2112.10752) original paper by Robin Rombach et al. and it is available as a [GitHub repository](https://github.com/CompVis/stable-diffusion). 

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/whitman.png alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO. Photo of a painting in <a href="https://goo.gl/maps/cGN5k72vforbXD2T6">ABF Stockholm</a>.
  </figcaption>
</figure>

# Problem

I need a book cover for my thesis.

# Stable Diffusion

> “Science fiction is real now. Machine learning generative models are here, and the rate with which they are improving is unreal. It’s worth paying real attention to what they can do and how they are developing.” -- Simon Willison

## txt2img

The model generates an image from a text input.

## img2img

Generating images from other images is a whole new ballgame.
With this new capability, one I could get the AI to do pretty much exactly what I have in my mind.
This is achieved through a process called [style transfer](https://en.wikipedia.org/wiki/Style_transfer), and many iterations.

[//]: # ( Text)

The Stable Diffusion v1 Model Card has the full details, but the short version is that it uses LAION-5B (5.85 billion image-text pairs scraped from the web) and its laion-aesthetics v2 5+ subset (which I think is ~600M pairs filtered for aesthetics). 
I’m not qualified to speak to the legality of this. I’m personally more concerned with the morality.
The final model is I believe around 4.2GB of data —a binary blob of floating point numbers. 
The fact that it can compress such an enormous quantity of visual information into such a small space is itself a fascinating detail.
As such, each image in the training set contributes only a tiny amount of information—a few tweaks to some numeric weights spread across the entire network.
# Solution

We pass the keywords of the thesis along with the figures in the papers.

> A distant futuristic city full of tall buildings inside a huge transparent glass dome, In the middle of a barren desert full of large dunes, Sun rays, Artstation, Dark sky full of stars with a shiny sun, Massive scale, Fog, Highly detailed, Cinematic, Colorful

# Conclusion

This makes me wonder about the future applications of AI-generated art.
I can imagine a future where we can generate a complete “unique” book cover for any paper in a matter of seconds.

The use of Stable Diffusion has generated a lot of legal and ethical controversy.
Stable Diffusion has been trained on millions of copyrighted images scraped from the web.
the people who created these images did not give their consent. 
And the model can be seen as a direct threat to their livelihoods. No-one expected creative AIs to come for the artist jobs first, but here we are!
Currently there are usage restrictions that include avoiding using it to break applicable laws, generate false information, discriminate against individuals or provide medical advice.

In the software space, with a large model on code, we should be able to morph in the latent space of programs.
We could take a program and morph it into another program that solves the same problem but in a different way.
For example, from “quicksort in C” to “mergesort in Java.”


# Further Reading

- [:earth_americas: An AI-Generated Artwork Won First Place at a State Fair Fine Arts Competition](https://www.vice.com/en/article/bvmvqm/an-ai-generated-artwork-won-first-place-at-a-state-fair-fine-arts-competition-and-artists-are-pissed)
- [:earth_americas: Stable Diffusion is a really big deal](https://simonwillison.net/2022/Aug/29/stable-diffusion/?utm_source=tldrnewsletter)
- [:earth_americas: Midjourney Community Showcase](https://www.midjourney.com/showcase/)
- <i class="fab fa-github"></i> [CompVis/latent-diffusion](https://github.com/CompVis/latent-diffusion)
- <i class="fab fa-github"></i> [nateraw/stable-diffusion-videos](https://github.com/nateraw/stable-diffusion-videos)



https://inpainter.vercel.app/
with
https://replicate.com/

# Footnotes
