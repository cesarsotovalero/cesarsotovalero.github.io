---
layout: post
title: Surviving the AI Revolution as a Software Engineer
subtitle: Is there still any hope?
tags: ai
description: TODO
keywords:
  - software engineering,
  - Large Language Models (LLMs),
  - career advice,
  - Artificial Intelligence,
  - the future of software development
image: ../img/posts/2023/2023-08-28/head-down-teddy_cover.jpg
share-img: ../img/posts/2023/2023-08-28/head-down-teddy_cover.jpg
show-avatar: false
toc: true
date: 2023/08/28
author: cesarsotovalero
published: false
---

Dear software engineer, AI is here to stay.
It's inevitable, and it changes everything.
If you are already mad about what [OpenAI's ChatGPT](https://chat.openai.com/) can do, hold on because this is just the very beginning.
The next wave of extremely powerful and specialized AI models is coming. 
In the next years, AI's massive adoption will affect every single aspect of our lives.
But this article is not about the issues of an AI-powered society, which you probably already know from science fiction authors.
Instead, I will focus on how you can keep your job in this new world dominated by AI.
My focus is on software engineering jobs, but most of the principles I mention apply to any other profession.
In this survival guide, I cover only the facts that I believe will hold despite the imminent improvements of AI models. 
For example, I assume that Generative AI will eventually become better than humans at creating any kind of digital content, including not only code, but also images, music, or video. 
So, what can we do?

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-08-28/head-down-teddy.jpg alt:"A lovely teddy bear thrashed in the backyard together with a keyboard" %}
  <figcaption class="stroke"> 
    &#169; Once we said goodbye to our lovely teddy bear, ...does the keyboard comes next?
  </figcaption>
</figure>

# What has changed?

[//]: # (My predictions two years ago)
In July 2021, I published a blog post titled "[Hermit Programmers are Dead](../blog/hermit-programmers-are-dead.html)."
My article was hardly criticized on Hacker News, receiving more than [100 negative comments](https://news.ycombinator.com/item?id=28744671).[^1]
Sadly, the main point of my article was misunderstood.
The reason (I want to believe) was my limited writing skills.
In essence, I argued that the rules of the game for software developers have changed so much, due to AI and cloud computing, that the archetype of the solo-programmer has become obsolete in the workforce.
I said "writing a bunch of code is not going to be a cool thing to do anymore", and "only our unique human skills will be valued in the future."
In response, someone wrote: "this person has no idea what they are talking about."
But many things have changed since then.

[//]: # (What has changed since then)
Two years after, and it turns out that my predictions were right, particularly those about the threat of AI for developers.
Today, AI is not only better than humans at playing [Chess or Go](https://www.deepmind.com/research/highlighted-research/alphago), but it has also become better at creating all kinds of text-based content (specially code).
The improvement of deep learning techniques, advancements in neural architectures like transformers, increased computational capabilities, and the accessibility of training data extracted from the public internet have brought about a revolutionary transformation in the field of Natural Language Processing (NLP). 
This has enabled the creation of Large Language Models (LLMs) that can approximate human-level performance on certain evaluation benchmarks.

[//]: # (What is unique from LLMs)
What makes these AI systems different from previous Machine Learning (ML) models is that **they are generative instead of discriminative**.
This means that they have observed large amounts of data and learned patters, such that they can create new data that have never existed before.

The key to LLMs' tremendous success lies in the combination of the following  improvements:

<aside class="quote">
    <em>“With great size (of parameters) comes great power (of AI).”</em> 
</aside>

- **Model complexity.** The size of ML models, measured by quantity of parameters (i.e., the number of computed weights between their neurons' connections), has increased exponentially in the last years. This is has been possible thanks to the availability of more powerful hardware, such as [NVIDIA GPUs](https://www.nvidia.com/en-us/data-center/h100/), and the development of more efficient training algorithms, such as the [Adam's](https://arxiv.org/abs/1412.6980) stochastic optimization, which efficiently computes adaptive learning rates for each parameter.
- **Training size.** Researchers discovered that AI capabilities increase significantly when augmenting the training size. In the case of LLMs, they are presumably trained on the whole internet's public data. This includes Stack Overflow's Q/A, GitHub's open-source projects, framework's APIs, technical documentation, and all the code that has ever been published on public websites.
- **Human feedback.** Being able to interact with humans. AI models fine-tuned with human feedback better than previous models.[^2] These models are instructed continuously, first with a set of labeler-written prompts and prompts submitted through the OpenAI's API.

The output is amazing, even if you already know that the machine is essentially predicting the next word in a sequence over and over to generate coherent, contextually relevant responses or text passages.


[//]: # (The rise of AI for developers)
AI has become a commodity for developers, and their managers.
Something you can use as a source and transfer of value without even understanding it.
AI is better than humans at every single coding task.
This has rapidly reduced the effort of achieving any coding task.
Simply put, if you don't use AI as a developer, you're out of the market.

[GitHub Next](https://githubnext.com/)

[//]: # (The threat of AI for developers)
AI is much cheaper than developers.
This disrupts the software industry.
Its astonishing labour-saving and problem-solving capabilities are available to anyone who wants to use them.

# A survival guide for software engineers

This guide is for 10 years only, nobody can predict what will happen after that.


AI will be integrated into every single information flow service, from auto-generated email answers to the most advanced data analytic tools creating plots automatically and summarising huge amounts of data for humans to digest. This will allow faster decision-making.

For developers, AI will suggest code enhancements, code completion, refactoring, generate documentation & tests, performance analysis, review code, rubber duck, dependency analysis, and security analysis. The possibilities are endless.

AI doesn’t take responsibility for the mistakes.

# Ways to survive

- Understanding what this technology is capable of, and instructing it in the right way.
- Critical thinking. Opinions.
- Creativity. Making jokes and the ability to understand humans’ sense of humor, is something very hard for machines.
- Initiative
- Empathy. AI is better than humans in every single task, just as a calculator is better at math. But you will never get in love with a calculator.
- Curiosity
- A sense of time. Reflected in our ability to tell stories. Machines eventually will understand space through sensors but time is more complicated.
- Causality.
- Research.

# Notes

- Explain that generative AI has layers, on the bottom is the LLM, and above is the simulacrum (your interaction with the model, purpose, specification, etc.), which is the personality of the model.
- LLMs and Generative AI affects us all, as developers and humans.
- Microsoft is building an AI ecosystem (OpenAI GPT model, on top of ChatGPT, Bing search, and GitHub copilot). Meta as Llama, and Google has Bard and on top Duet. They are basically “statistical models of words”.
- Very useful, for example, GitHub Copilot can find the ISIN number for stocks, it can suggest the country for a particular stock. They can translate text, create poems, etc.
- With AI, everything that is boring to do and takes time becomes very very fast, as long as you know the subject. It makes you many times more productive. For example, they can suggest the full specification to design an API in seconds (this normally takes days).
- It’s like talking with something that knows everything but doesn’t understand it.
- It’s good at generating boilerplate code, and then you need to check it out.
- For me, this is the final nail in the coffin of the industrial way of economy. In the standard way of economy everything is a commodity, if you reach a certain level of quality, then is all about price. But now the price of a developer is totally irrelevant, the only thing that matters is if that developer is 20x more productive, or not.
- Senior developers get a big boost from this technology because they understand the response of an AI. For example, if you are a junior you don’t know exactly what to ask, and you don’t understand the response.
- ChatGPT is very good at explaining what the code does, much better than documentation (which often says something about a particular version but is outdated).
- But ChatGPT is not perfect, they make mistakes (add an example). And you need to know about the response.
- Does AI actually understand? No, it doesn’t understand, but neither we do, we humans are basically Generative Language Models. If you look at history, intelligence, civilization, and language arrived at the same time.
- I can know specific things, but AI seems to know everything. In coming versions, I’m sure it will include references to where the information was taken so that we can fact-check if the information is valid.
- The way to be able to use properly these models is to be a senior engineer. The way you become a senior is by making mistakes and having a senior who mentors you. Now companies don’t need juniors anymore because they have all the juniors in the form of AI. So, if we have no more seniors because we don’t have more juniors that are mentored by seniors?
- This could be a problem in the industry: losing the happiness of discovery! Because these machines just know everything. And the possibilities to learn new things are so big that it is almost impossible to choose what to learn. So I guess we’ll need more mentors who organize the knowledge in an organized package.
- People think that now that we have an LLM, we don’t need programmers anymore, we just need to describe a problem and ask for a solution. But come on, that’s what programming is! And what you need is domain knowledge to do that.
- If you forbid teachers at school to use AI, then you are just telling them not to use the tools that they’re going to use after finishing school, in the real world! Is using AI cheating? School is meant to train you for work life.
- So at the end for all developers is about curiosity, you need to be curious to learn: what would happen if you change this variable? Or by taking this particular problem in a different way?
- To use AI, you first need to understand all the possibilities that you have with them.
- Use it carefully today if your code has sensitive data (e.g., in a bank). Maybe the future will be deploying open source model in the companies to protect their data.
- ***The Forever War*** (1974) is a [military science fiction](https://en.wikipedia.org/wiki/Military_science_fiction) novel telling the contemplative story of human soldiers fighting an [interstellar war](https://en.wikipedia.org/wiki/Interstellar_war) against an alien civilization with actual travel time. What happened is that they set up for a battle, and when they arrived it was 30 years later, and all the weapons were better for the defenders. So today, if you’re stuck with what you’re doing, it might be actually faster to start over and then become 20x faster and then overtake what you did.

# The future

What is next? AI will keep grounding in experience. 
We are currently at the phase of AI’s learning the written world, next it’ll move towards gaining better perception of the wold through vision, audio, touch, etc.
Next step AI systems will be able to interact with the world through physical actions, becoming sociable agents, indistinguishable from humans that learn from experience, autonomously.

Machines with outsmart people. Taking power.

# Conclusion


# Further reading

- [How Soon AI Will Start Firing Programmers?](https://cacm-acm-org.focus.lib.kth.se/blogs/blog-cacm/276029-how-soon-ai-will-start-firing-programmers/fulltext)

# Footnotes

[^1]: I decided not to edit the original article to avoid losing the context of the discussion. 

[^2]: https://arxiv.org/abs/2203.02155